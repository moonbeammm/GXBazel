//
//  GXPlayerIGListTwoCollectionViewCell.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListTwoCollectionViewCell.h"

@implementation GXPlayerIGListTwoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.backgroundColor = [UIColor yellowColor];
        [self.btn setTitle:@"reload" forState:UIControlStateNormal];
        [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btn];
        self.btn.frame = CGRectMake(50, 50, 200, 130);
        
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn1.backgroundColor = [UIColor yellowColor];
        [self.btn1 setTitle:@"不加inval" forState:UIControlStateNormal];
        [self.btn1 setTitle:@"加inval" forState:UIControlStateSelected];
        [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btn1];
        self.btn1.frame = CGRectMake(260, 50, 100, 130);
    }
    return self;
}

@end
