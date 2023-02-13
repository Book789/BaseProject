//
//  BaseViewController.m
//  BaseProject
//
//  Created by nanfeng on 2017/3/24.
//  Copyright © 2017年 nanfeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.emptyView = [LHEmptyView addToView:self.view show:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
