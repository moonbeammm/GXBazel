//
//  BBMPKVOSignal.h
//  BBMPKVO
//
//  Created by sgx on 2019/8/14.
//  Copyright © 2019 sgx. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <GXKVO/GXKVOMacro.h>

NS_ASSUME_NONNULL_BEGIN

#define BBMPObserve(TARGET, KEYPATH) \
    ({ \
        __weak id weakTarget = (TARGET); \
        [BBMPKVOWrapper addObserver:self target:weakTarget keyPath:@keypath(TARGET, KEYPATH)]; \
    })

#define BBMPRemoveObserve(TARGET, KEYPATH) \
    ({ \
        [BBMPKVOWrapper removeObserver:self keyPath:@keypath(TARGET, KEYPATH)]; \
    })

#define BBMPRemoveAllObserve(TARGET, KEYPATH) \
    ({ \
        [BBMPKVOWrapper removeAllObserver:self]; \
    })


static NSString *const BBMPKVOSignalKeyPath = @"BBMPKVOSignalKeyPath";
typedef void (^BBMPKVOSignalBlock)(id __nullable oldValue, id __nullable newValue);

@interface BBMPKVOSignal : NSObject

- (void)subscribNext:(BBMPKVOSignalBlock)nextBlock;

@end

@interface BBMPKVOWrapper : NSObject

+ (BBMPKVOSignal *)addObserver:(NSObject *)observer target:(NSObject *)target keyPath:(NSString *)keyPath;
+ (void)removeObserver:(NSObject *)observer keyPath:(NSString *)keyPath;
+ (void)removeAllObserver:(NSObject *)observer;

@end

NS_ASSUME_NONNULL_END
