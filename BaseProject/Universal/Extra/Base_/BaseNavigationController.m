//
//  LH_HomeViewController.h
//  Manor
//
//  Created by Book on 2022/7/20.
//  Copyright © 2022 山海数科. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@property(nonatomic,strong)UIImage *shadowImage;

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self nb_setNavAttributeSet];
}

- (void)nb_setNavAttributeSet{
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置NavigationBar背景颜色
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.tintColor = kColorWithHex(0x666666); //NavigationBar 控件颜色
    self.navigationBar.translucent = NO;
//    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor nbWhiteColor]] forBarMetrics:UIBarMetricsDefault];

    //导航栏下线条
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kScreenWidth, 1), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, kScreenWidth, .5));
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, .5, kScreenWidth, .5));
    _shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationBar setShadowImage:_shadowImage];


    /**
          更换系统 返回图片
     */
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0) forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 13.0, *)){
        UINavigationBarAppearance *appearance = self.navigationBar.standardAppearance;
        if (appearance == nil) {
            appearance = [UINavigationBarAppearance new];
        }
        [appearance configureWithOpaqueBackground];
        [appearance setBackIndicatorImage:[UIImage imageNamed:@"nabar_back"] transitionMaskImage:[UIImage imageNamed:@"nabar_back"]];
        appearance.shadowColor = UIColor.clearColor;
        appearance.shadowImage = [UIImage new];
//        appearance.titleTextAttributes = @{NSForegroundColorAttributeName:kColorWithHex(0x333333),
//                                                   NSFontAttributeName:[UIFont regularFontOfSize:19.0]};
        self.navigationBar.scrollEdgeAppearance = appearance;
        self.navigationBar.standardAppearance = appearance;
        if (@available(iOS 15.0, *)){
            self.navigationBar.compactScrollEdgeAppearance = appearance;
        }


    }else{
        UIImage *backButtonImage = [[UIImage imageNamed:@"nabar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [UINavigationBar appearance].backIndicatorImage = backButtonImage;
        [UINavigationBar appearance].backIndicatorTransitionMaskImage = backButtonImage;
//        [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:kColorWithHex(0x333333),
//                                                   NSFontAttributeName:[UIFont regularFontOfSize:19.0]};
    }

}
- (void)setHideNavBarBottomLine:(BOOL)hideNavBarBottomLine{
    _hideNavBarBottomLine = hideNavBarBottomLine;
    if (_hideNavBarBottomLine) {
        if (@available(iOS 13.0, *)) {
            UINavigationBarAppearance *app = self.navigationBar.standardAppearance;
            if (app == nil) {
                app = [UINavigationBar.appearance.standardAppearance copy];
            }
            app.shadowColor = UIColor.clearColor;
            app.shadowImage = [UIImage new];
            self.navigationBar.scrollEdgeAppearance = app;
            self.navigationBar.standardAppearance = app;
            return;
        }
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    }
    else{
        if (@available(iOS 13.0, *)) {
            UINavigationBarAppearance *app = self.navigationBar.standardAppearance;
            if (app == nil) {
                app = [UINavigationBar.appearance.standardAppearance copy];
            }
            app.shadowColor = UIColor.clearColor;
            app.shadowImage = _shadowImage;
            self.navigationBar.scrollEdgeAppearance = app;
            self.navigationBar.standardAppearance = app;
            return;
        }
        [self.navigationBar setShadowImage:_shadowImage];
    }
}

//判断是否隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
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
