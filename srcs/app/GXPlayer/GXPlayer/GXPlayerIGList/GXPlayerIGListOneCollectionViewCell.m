//
//  GXPlayerIGListOneCollectionViewCell.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListOneCollectionViewCell.h"

@implementation GXPlayerIGListOneCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor blueColor];
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.backgroundColor = [UIColor yellowColor];
        [self.btn setTitle:@"invalidate" forState:UIControlStateNormal];
        [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btn];
        self.btn.frame = CGRectMake(50, 50, 200, 130);
        
    }
    return self;
}


@end
