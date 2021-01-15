//
//  GXPlayerIGListTwoObject.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListTwoObject.h"

@implementation GXPlayerIGListTwoObject

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
