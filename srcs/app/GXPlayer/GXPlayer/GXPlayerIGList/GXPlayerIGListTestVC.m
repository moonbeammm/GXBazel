//
//  GXPlayerIGListTestVC.m
//  _idx_gxplayer_library_29A2AE5A_ios_min9.0
//
//  Created by sgx on 2021/1/15.
//

#import "GXPlayerIGListTestVC.h"
#import <IGListKit/IGListKit.h>
#import "GXPlayerIGListOneObject.h"
#import "GXPlayerIGListTwoObject.h"
#import "GXPlayerIGListOneSectionController.h"
#import "GXPlayerIGListTwoSectionController.h"

@interface GXPlayerIGListTestVC () <IGListAdapterDataSource, GXPlayerIGListTwoSectionControllerProtocol>
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSDictionary <NSString *,Class> *sectionMapper;
@property (nonatomic, strong) NSArray *objects;
@end

@implementation GXPlayerIGListTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self _configSubviews];
    _sectionMapper = @{
        NSStringFromClass([GXPlayerIGListOneObject class]):[GXPlayerIGListOneSectionController class],
        NSStringFromClass([GXPlayerIGListTwoObject class]):[GXPlayerIGListTwoSectionController class],
    };
    
    self.objects = [self getArrary];
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {

    }];
}

- (void)_configSubviews {
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    CGFloat collectionViewW = CGRectGetWidth(self.view.frame);
    [self.collectionView.widthAnchor constraintEqualToConstant:collectionViewW].active = YES;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (NSArray *)getArrary {
    GXPlayerIGListOneObject *oneObject = [GXPlayerIGListOneObject new];
    GXPlayerIGListTwoObject *twoObject = [GXPlayerIGListTwoObject new];
    GXPlayerIGListOneObject *oneObject1 = [GXPlayerIGListOneObject new];
    GXPlayerIGListTwoObject *twoObject1 = [GXPlayerIGListTwoObject new];
    GXPlayerIGListOneObject *oneObject2 = [GXPlayerIGListOneObject new];
    GXPlayerIGListTwoObject *twoObject2 = [GXPlayerIGListTwoObject new];
    return @[oneObject,twoObject,oneObject1,twoObject1,oneObject2,twoObject2];
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSLog(@"sgx >> %s\n%@\n%@\n获取数据源",__PRETTY_FUNCTION__,self,self.objects);
    return self.objects;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    IGListSectionController * sectionController = [(Class)_sectionMapper[NSStringFromClass([object class])] new];
    if ([sectionController isKindOfClass:[GXPlayerIGListTwoSectionController class]]) {
        GXPlayerIGListTwoSectionController *temp = (GXPlayerIGListTwoSectionController *)sectionController;
        temp.delegate = self;
    }
    return sectionController;
}

- (void)reloadCollectionView {
    NSLog(@"sgx >> %s\n%@\n点击reload按钮",__PRETTY_FUNCTION__,self);
    self.objects = [self getArrary];
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
        if (finished) {
            NSLog(@"sgx >> %s\n%@\n点击reload按钮 - 完成reload",__PRETTY_FUNCTION__,self);
        } else {
            NSLog(@"sgx >> %s\n%@\n点击reload按钮 - 没有完成reload",__PRETTY_FUNCTION__,self);
        }
    }];
}
- (void)performCollectionView {
    [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"sgx >> 成功");
        } else {
            NSLog(@"sgx >> 失败");
        }
    }];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                    viewController:self
                    workingRangeSize:0];
        _adapter.dataSource = self;
        _adapter.viewController = self;
    }
    return  _adapter;
}

@end
