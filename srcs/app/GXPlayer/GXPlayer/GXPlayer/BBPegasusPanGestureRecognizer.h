//
//  BBPegasusPanGestureRecognizer.h
//  _idx_gxplayer_library_E787E67B_ios_min9.0
//
//  Created by sgx on 2020/10/2.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BBPegasusPanGestureDirectionNone,
    BBPegasusPanGestureDirectionHorizontal,
    BBPegasusPanGestureDirectionVertical,
} BBPegasusPanGestureDirection;

NS_ASSUME_NONNULL_BEGIN

@interface BBPegasusPanGestureRecognizer : UIPanGestureRecognizer

@property (nonatomic, assign, readonly) BBPegasusPanGestureDirection direction;

@end

NS_ASSUME_NONNULL_END
