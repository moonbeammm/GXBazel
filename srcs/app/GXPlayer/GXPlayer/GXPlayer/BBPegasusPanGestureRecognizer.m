//
//  BBPegasusPanGestureRecognizer.m
//  _idx_gxplayer_library_E787E67B_ios_min9.0
//
//  Created by sgx on 2020/10/2.
//

#import "BBPegasusPanGestureRecognizer.h"


@interface BBPegasusPanGestureRecognizer ()

@property (nonatomic, assign, readwrite) BBPegasusPanGestureDirection direction;

@end

@implementation BBPegasusPanGestureRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    _direction = BBPegasusPanGestureDirectionNone;
    NSLog(@"###inlineV2###-[-touchesBegan:withEvent:]");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];

    if (_direction != BBPegasusPanGestureDirectionNone) {
        return;
    }
    
    BBPegasusPanGestureDirection tempDirection = BBPegasusPanGestureDirectionNone;
    for (UITouch *touch in [event allTouches]) {
        if (touch.phase == UITouchPhaseStationary) {
            continue;
        }
        CGPoint currentPoint = [touch locationInView:touch.view];
        CGPoint previousPoint = [touch previousLocationInView:touch.view];
        CGFloat touchOffsetX = currentPoint.x - previousPoint.x;
        CGFloat touchOffsetY = currentPoint.y - previousPoint.y;
        
        NSLog(@"###inlineV2###-[-touchMoved:withEvent:]offsetX:%@,offsetY:%@",@(fabs(touchOffsetX)),@(fabs(touchOffsetY)));
        if (fabs(touchOffsetX) > fabs(touchOffsetY)) {
            tempDirection = BBPegasusPanGestureDirectionHorizontal;
            break;
        } else if (fabs(touchOffsetX) < fabs(touchOffsetY)) {
            tempDirection = BBPegasusPanGestureDirectionVertical;
            break;
        }
    }
    
    _direction = tempDirection;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    _direction = BBPegasusPanGestureDirectionNone;
    NSLog(@"###inlineV2###-[-touchesCancelled:withEvent:]");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    _direction = BBPegasusPanGestureDirectionNone;
    NSLog(@"###inlineV2###-[-touchesEnded:withEvent:]");
}

@end
