//
//  GXPlayerCollectionViewCell.m
//  _idx_gxplayer_library_8468945F_ios_min9.0
//
//  Created by sgx on 2020/9/25.
//


#import "GXPlayerCollectionViewCell.h"
#import "BBPegasusPanGestureRecognizer.h"


@interface GXPlayerCollectionViewCell ()
{
    CGPoint _beginningPoint;
    BOOL _gestureSeeking;
    BOOL _seekingCanceled;
}
@property (nonatomic, strong) BBPegasusPanGestureRecognizer *pan;

@end

@implementation GXPlayerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pan = [[BBPegasusPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.contentView addGestureRecognizer:self.pan];
        self.pan.delegate = self;
    }
    return self;
}

- (void)pan:(UIGestureRecognizer *)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan: {
            _beginningPoint = [recognizer locationInView:recognizer.view];
        }   break;
        case UIGestureRecognizerStateChanged: {
            if ([(BBPegasusPanGestureRecognizer *)recognizer direction] != BBPegasusPanGestureDirectionHorizontal &&
                !_gestureSeeking) {
                _seekingCanceled = YES;
                return;
            }
            [self updateSeekingStatus:YES];
            _seekingCanceled = NO;
        }   break;
            
        default: {
            if (_seekingCanceled) {
                
            }
            [self updateSeekingStatus:NO];
            _seekingCanceled = NO;
        }
            break;
    }
}

- (void)updateSeekingStatus:(BOOL)gestureSeeking {
    if (gestureSeeking == _gestureSeeking) {
        return;
    }
    _gestureSeeking = gestureSeeking;
    
    if (gestureSeeking) { // 开始seeking

    } else { // 结束seeking
        if (!_seekingCanceled) { // 没有取消seeking

        }
    }
}

//////共存  A手势或者B手势 代理方法里shouldRecognizeSimultaneouslyWithGestureRecognizer   有一个是返回YES，就能共存
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.pan == gestureRecognizer && otherGestureRecognizer == self.collectionViewGesture) {
        if (self.pan.direction == BBPegasusPanGestureDirectionVertical) {
            NSLog(@"可以滑动");
            return YES;
        } else {
            NSLog(@"不能滑动");
            return NO;
        }
    }

    return NO;
}

- (void)setCollectionViewGesture:(UIPanGestureRecognizer *)collectionViewGesture {
    _collectionViewGesture = collectionViewGesture;
}

@end
