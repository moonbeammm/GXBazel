//
//  GXPlayerIGListTwoSectionController.h
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "IGListSectionController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GXPlayerIGListTwoSectionControllerProtocol <NSObject>

- (void)reloadCollectionView;
- (void)performCollectionView;
@end

@interface GXPlayerIGListTwoSectionController : IGListSectionController
@property (nonatomic, weak) id<GXPlayerIGListTwoSectionControllerProtocol> delegate;
@end

NS_ASSUME_NONNULL_END
