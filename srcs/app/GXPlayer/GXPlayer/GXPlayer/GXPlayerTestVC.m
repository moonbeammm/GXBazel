//
//  GXPlayerTestVC.m
//  universal
//
//  Created by sgx on 2020/11/14.
//

#import "GXPlayerTestVC.h"

@interface GXPerson : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson



@end

@interface GXPerson1 : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson1



@end


@interface GXPerson2 : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson2



@end

@interface GXPerson3 : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson3



@end


@interface GXPerson4 : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson4



@end

@interface GXPerson5 : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation GXPerson5



@end

@interface GXPlayerTestVC ()

@property (nonatomic, assign) BOOL isFullScreen;
@property (nonatomic, strong) GXPerson *person;
@property (nonatomic, strong) GXPerson1 *person1;
@property (nonatomic, strong) GXPerson2 *person2;
@property (nonatomic, strong) GXPerson3 *person3;
@property (nonatomic, strong) GXPerson4 *person4;
@property (nonatomic, strong) GXPerson5 *person5;

@end

@implementation GXPlayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self _configSubviews];
    self.person = [GXPerson new];
}

- (BOOL)shouldAutorotate {
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.isFullScreen) {
        return UIInterfaceOrientationMaskLandscape;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)_configSubviews {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"进入全屏" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(enterFullScreen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"进入半屏" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(enterMiniScreen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    btn1.frame = CGRectMake(100, 300, 100, 100);
}
- (void)enterFullScreen:(UIButton *)btn {
    self.isFullScreen = YES;
    [self forceChangeDeviceOritationToLandscape:YES];
}
- (void)enterMiniScreen:(UIButton *)btn {
    self.isFullScreen = NO;
    [self _didClickEnterMini:self.person
                           q:self.person1
                           b:self.person2
                           r:self.person3
                           w:self.person4
                           e:self.person5];
}

- (void)_didClickEnterMini:(GXPerson *)person
                         q:(GXPerson1 *)q
                         b:(GXPerson2 *)b
                         r:(GXPerson3 *)r
                         w:(GXPerson4 *)w
                         e:(GXPerson5 *)e {
    [self forceChangeDeviceOritationToLandscape:NO];
}

/// 强制旋转设备
- (void)forceChangeDeviceOritationToLandscape:(BOOL)toLandscape {
    if (toLandscape) {
        [self forceChangeOritationToLandScape];
    } else {
        [self forceChangeOritationToPortrait];
    }
}

/// 强制旋转设备横屏 (能否转屏最后还要经过supportedInterfaceOrientations方法判断)
- (void)forceChangeOritationToLandScape
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationLandscapeRight;
        
        UIDeviceOrientation o = [UIDevice currentDevice].orientation;
        if (o == UIDeviceOrientationLandscapeRight) {
            val = UIInterfaceOrientationLandscapeLeft;
        }
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

/// 强制旋转设备竖屏 (能否转屏最后还要经过supportedInterfaceOrientations方法判断)
- (void)forceChangeOritationToPortrait
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        NSInteger val = UIInterfaceOrientationPortrait;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

@end
