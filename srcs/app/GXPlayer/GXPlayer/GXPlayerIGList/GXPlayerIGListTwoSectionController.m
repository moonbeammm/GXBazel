//
//  GXPlayerIGListTwoSectionController.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListTwoSectionController.h"
#import "GXPlayerIGListTwoCollectionViewCell.h"
#import "GXPlayerIGListTwoObject.h"

@interface GXPlayerIGListTwoSectionController ()
@property (nonatomic, strong) GXPlayerIGListTwoObject * object;

@end

@implementation GXPlayerIGListTwoSectionController
- (void)didUpdateToObject:(id)object{
    self.object = object;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 200);
}

static BOOL _isSelected = NO;
- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    
    GXPlayerIGListTwoCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GXPlayerIGListTwoCollectionViewCell class] forSectionController:self atIndex:index];
    [cell.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    cell.btn1.selected = _isSelected;
    return cell;
}
- (void)btnClick:(UIButton *)btn {
    for (NSInteger i = 100; i >= 0; i--) {
        if (self.section == NSNotFound) {
            NSLog(@"sgx >> - 出错啦！notfound啦！ %s\n%@",__PRETTY_FUNCTION__,self);
        }
        if (_isSelected) {
            NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-开始performWithAnimation",__PRETTY_FUNCTION__,self);
//            [self.collectionContext invalidateLayoutForSectionController:self completion:^(BOOL finished) {
//                if (finished) {
//                    NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-开始performWithAnimation-完成",__PRETTY_FUNCTION__,self);
//                } else {
//                    NSLog(@"sgx >> %s\n%@\n点击ivalidate按钮-开始performWithAnimation-没有完成",__PRETTY_FUNCTION__,self);
//                }
//            }];
            [self.delegate performCollectionView];
        }
        
        [self.delegate reloadCollectionView];

    }
}
- (void)btnClick1:(UIButton *)btn {
    btn.selected = !btn.isSelected;
    _isSelected = btn.isSelected;
}
@end
