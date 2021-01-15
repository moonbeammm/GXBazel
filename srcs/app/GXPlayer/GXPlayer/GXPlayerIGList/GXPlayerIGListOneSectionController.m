//
//  GXPlayerIGListOneSectionController.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListOneSectionController.h"
#import "GXPlayerIGListOneCollectionViewCell.h"
#import "GXPlayerIGListOneObject.h"

@interface GXPlayerIGListOneSectionController ()
@property (nonatomic, strong) GXPlayerIGListOneObject * object;

@end

@implementation GXPlayerIGListOneSectionController
- (void)didUpdateToObject:(id)object{
    self.object = object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 200);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GXPlayerIGListOneCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GXPlayerIGListOneCollectionViewCell class] forSectionController:self atIndex:index];
    [cell.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)btnClick:(UIButton *)btn {
    for (NSInteger i = 100; i >= 0; i--) {
    NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮！",__PRETTY_FUNCTION__,self);
    [UIView performWithoutAnimation:^{
        NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-开始performWithAnimation",__PRETTY_FUNCTION__,self);
        [self.collectionContext invalidateLayoutForSectionController:self completion:^(BOOL finished) {
            if (finished) {
                NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-invalidate-完成",__PRETTY_FUNCTION__,self);
            } else {
                NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-invalidate-失败",__PRETTY_FUNCTION__,self);
            }
        }];
    }];
    }
}

@end
