//
//  GXHomeViewController.m
//  Test
//
//  Created by sunguangxin on 2018/8/18.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeViewController.h"


#import <IGListKit/IGListKit.h>

@interface GXHomeViewController ()

@end

@implementation GXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    IGListAdapter *adapter = [[IGListAdapter alloc]initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
}

//- (IGListAdapter *)adapter {
//    if (!_adapter) {
//        _adapter = [[IGListAdapter alloc]initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
//        _adapter.dataSource = self;
//        _adapter.viewController = self;
//        _adapter.scrollViewDelegate = self;
//    }
//    return  _adapter;
//}

@end
