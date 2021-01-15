//
//  GXPlayerCollectionView.m
//  _idx_gxplayer_library_D94D2950_ios_min9.0
//
//  Created by sgx on 2020/10/15.
//

#import "GXPlayerCollectionView.h"

@interface GXPlayerCollectionView () <UIGestureRecognizerDelegate>

@end

@implementation GXPlayerCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
