//
//  UIViewController+ViewController.m
//  Project
//
//  Created by a on 2022/4/29.
//

#import "UIViewController+ViewController.h"

@implementation UIViewController (ViewController)

+ (UIViewController*)fm_currentTopViewController{
    
    UIViewController* rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    ;
    UIViewController* topVC = [self fm_deepestPresentedViewControllerOf:rootVC];
    
    if ([topVC isKindOfClass:[UITabBarController class]]) {
        UIViewController* tabSelectedVC = ((UITabBarController*)topVC).selectedViewController;
        if (tabSelectedVC) {
            topVC = [self fm_deepestPresentedViewControllerOf:tabSelectedVC];
        }
    }
    if ([topVC isKindOfClass:[UINavigationController class]]) {
        UIViewController* navTopVC = ((UINavigationController*)topVC).topViewController;
        if (navTopVC) {
            topVC = [self fm_deepestPresentedViewControllerOf:navTopVC];
        }
    }
    
    return topVC;
}
+ (UIViewController*)fm_deepestPresentedViewControllerOf:(UIViewController*)viewController{
    
    UIViewController* deepestViewController = viewController;
    
    Class alertVC0 = [UIAlertController class];
    Class alertVC1 = NSClassFromString(@"_UIAlertShimPresentingViewController");
    while (YES) {
        UIViewController* presentedVC = deepestViewController.presentedViewController;
        if (presentedVC && [presentedVC isKindOfClass:alertVC0] == NO && [presentedVC isKindOfClass:alertVC1] == NO) {
            deepestViewController = deepestViewController.presentedViewController;
        }
        else {
            break;
        }
    }
    return deepestViewController;
}

@end
