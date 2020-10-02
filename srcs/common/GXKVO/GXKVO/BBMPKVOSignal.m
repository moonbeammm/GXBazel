//
//  BBMPKVOSignal.m
//  BBMPKVO
//
//  Created by sgx on 2019/8/14.
//  Copyright © 2019 sgx. All rights reserved.
//

#import "BBMPKVOSignal.h"
#import <pthread.h>
#import <objc/runtime.h>

// ********************************************************************************************************************
#pragma mark - BBMPKVOController
// ********************************************************************************************************************

@interface BBMPKVOSignal ()
{
    pthread_mutex_t _mutex;
}
@property (nonatomic, readonly) NSObject *target;
@property (nonatomic, readonly, weak) NSObject *observer;
@property (nonatomic, readonly, copy) NSString *keyPath;
@property (nonatomic, readonly, assign) NSKeyValueObservingOptions options;
@property (nonatomic, readonly, copy) BBMPKVOSignalBlock block;

@end

@implementation BBMPKVOSignal

- (id)initWithTarget:(NSObject *)target observer:(__weak NSObject *)observer keyPath:(NSString *)keyPath {
    if (self = [super init]) {
        if (target == nil) {
            return nil;
        }
        if (observer == nil) {
            return nil;
        }
        if (keyPath.length == 0) {
            return nil;
        }

        _options = NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        _target = target;
        _observer = observer;
        _keyPath = keyPath;
        pthread_mutex_init(&_mutex, NULL);
    }
    return self;
}

- (void)dealloc {
    [self.target removeObserver:self forKeyPath:self.keyPath];
    pthread_mutex_destroy(&_mutex);
    NSLog(@"BBMPKVOSignal dealloc!");
}

- (void)subscribNext:(BBMPKVOSignalBlock)nextBlock {
    pthread_mutex_lock(&_mutex);
    _block = [nextBlock copy];
    pthread_mutex_unlock(&_mutex);
    [self.target addObserver:self forKeyPath:self.keyPath options:self.options context:(__bridge void *)self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context != (__bridge void *)self) {
        return;
    }
    if (![keyPath isEqualToString:self.keyPath]) {
        return;
    }
    if (object != self.target) {
        return;
    }
    
    BBMPKVOSignalBlock block;
    id observer;
    id target;
    
    // lock
    pthread_mutex_lock(&_mutex);
    
    block = self.block;
    observer = self.observer;
    target = self.target;
    
    id oldValue = nil;
    id newValue = nil;

    NSArray *allKeys = change.allKeys;
    if ([allKeys containsObject:NSKeyValueChangeOldKey]) {
        oldValue = change[NSKeyValueChangeOldKey];
        if ([oldValue isKindOfClass:[NSNull class]]) {
            oldValue = nil;
        }
    }
    if ([allKeys containsObject:NSKeyValueChangeNewKey]) {
        newValue = change[NSKeyValueChangeNewKey];
        if ([newValue isKindOfClass:[NSNull class]]) {
            newValue = nil;
        }
    }
    
    // unlock
    pthread_mutex_unlock(&_mutex);
    
    if (block == nil || target == nil) return;
    block(oldValue, newValue);
}

@end

// ********************************************************************************************************************
#pragma mark - BBMPKVOController
// ********************************************************************************************************************

@interface BBMPKVOController : NSObject
{
    pthread_mutex_t _mutex;
    NSMapTable *_keyPathSignalMap;
}
@end

@implementation BBMPKVOController

- (instancetype)init {
    if (self = [super init]) {
        _keyPathSignalMap = [NSMapTable weakToStrongObjectsMapTable];
        pthread_mutex_init(&_mutex, NULL);
    }
    return self;
}

- (void)dealloc {
    [self removeAllSignals];
    pthread_mutex_destroy(&_mutex);
}

- (BBMPKVOSignal *)addObserver:(NSObject *)observer target:(NSObject *)target keyPath:(NSString *)keyPath {
    // lock
    pthread_mutex_lock(&_mutex);

    BBMPKVOSignal *signal = [_keyPathSignalMap objectForKey:keyPath];
    if (signal) {
        // 已经监听过了。防止重复注册。
        pthread_mutex_unlock(&_mutex);
        return nil;
    }
    
    signal = [[BBMPKVOSignal alloc] initWithTarget:target observer:observer keyPath:keyPath];
    [_keyPathSignalMap setObject:signal forKey:keyPath];
    
    // unlock
    pthread_mutex_unlock(&_mutex);

    return signal;
}

- (void)removeAllSignals {
    pthread_mutex_lock(&_mutex);
    [_keyPathSignalMap removeAllObjects];
    pthread_mutex_unlock(&_mutex);
}

- (void)removeObserver:(NSObject *)observer keyPath:(NSString *)keyPath {
    pthread_mutex_lock(&_mutex);
    [_keyPathSignalMap removeObjectForKey:keyPath];
    pthread_mutex_unlock(&_mutex);
}

@end

// ********************************************************************************************************************
#pragma mark - BBMPKVOController
// ********************************************************************************************************************

static NSString *kBBMPKVOControllerKey = @"kBBMPKVOControllerKey";

@implementation BBMPKVOWrapper

+ (BBMPKVOSignal *)addObserver:(NSObject *)observer target:(NSObject *)target keyPath:(NSString *)keyPath {
    @synchronized (self) {

        BBMPKVOController *kvoControl = objc_getAssociatedObject(observer, &kBBMPKVOControllerKey);
        if (!kvoControl) {
            kvoControl = [BBMPKVOController new];
            objc_setAssociatedObject(observer, &kBBMPKVOControllerKey, kvoControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        BBMPKVOSignal *signal = [kvoControl addObserver:observer target:target keyPath:keyPath];

        return signal;
    }
}

+ (void)removeObserver:(NSObject *)observer keyPath:(NSString *)keyPath {
    @synchronized (self) {
        BBMPKVOController *kvoControl = objc_getAssociatedObject(observer, &kBBMPKVOControllerKey);
        [kvoControl removeObserver:observer keyPath:keyPath];
    }
}

+ (void)removeAllObserver:(NSObject *)observer {
    @synchronized (self) {
        BBMPKVOController *kvoControl = objc_getAssociatedObject(observer, &kBBMPKVOControllerKey);
        [kvoControl removeAllSignals];
    }
}

@end
