//
//  BaseTabbarController.m
//  BaseProject
//
//  Created by nanfeng on 2017/3/18.
//  Copyright © 2017年 nanfeng. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseNavigationController.h"

#import "ViewController.h"
#import "LHPullHeaderViewController.h"


@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ViewController * view = [ViewController new];
    BaseNavigationController * baseNav = [[BaseNavigationController alloc] initWithRootViewController:view];
    baseNav.tabBarItem.title = @"首页";
    
    
    LHPullHeaderViewController * person = [LHPullHeaderViewController new
    ];
    BaseNavigationController * personNav = [[BaseNavigationController alloc] initWithRootViewController:person];
    personNav.tabBarItem.title = @"我的";

    self.viewControllers = @[baseNav,personNav];

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
