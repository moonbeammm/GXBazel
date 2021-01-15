//
//  GXPlayerIGListOneObject.m
//  _idx_gxplayer_library_A0367403_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListOneObject.h"

@implementation GXPlayerIGListOneObject

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable GXPlayerIGListOneObject<IGListDiffable>*)object {
    if ([self.name isEqualToString:object.name]) {
        return YES;
    }
    return [self isEqual:object];
}

@end
