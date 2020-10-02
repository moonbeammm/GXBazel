//
//  GXPlayerCollectionViewCell.h
//  _idx_gxplayer_library_8468945F_ios_min9.0
//
//  Created by sgx on 2020/9/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GXPlayerCollectionViewCell : UICollectionViewCell <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIPanGestureRecognizer *collectionViewGesture;

@end

NS_ASSUME_NONNULL_END
