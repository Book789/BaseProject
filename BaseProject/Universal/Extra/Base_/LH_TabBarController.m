////
////  LH_TabBarController.m
////
////
//
//#import "LH_TabBarController.h"
//#import <Lottie/LOTAnimationView.h>
//
//
//
//#import "LH_BaseNavigationController.h"
//
//@interface LH_TabBarController ()<UITabBarControllerDelegate>
//
//@property(nonatomic, strong) LOTAnimationView *animationView;
//
//@property(nonatomic, assign) NSInteger currentIndex;
//
//@end
//
//@implementation LH_TabBarController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.delegate = self;
//
//    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
//
//
//    self.tabBar.translucent = NO;
////    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:1]]];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -1, kScreenWidth, 1)];
//    view.backgroundColor = [UIColor whiteColor];
//    [[UITabBar appearance] insertSubview:view atIndex:0];
//
//    NSMutableDictionary *attributDicNor    = [NSMutableDictionary dictionary];
//    NSMutableDictionary *attributDicSelect = [NSMutableDictionary dictionary];
//    UITabBar *tabBar = [UITabBar appearance];
////    UIColor *normalColor = [UIColor colorWithHexString:@"#B6B7BA"];
////    UIColor *selectColor = [UIColor colorWithHexString:@"#33CCFD"];
//    if (@available(iOS 10.0, *)) {
//        [tabBar setUnselectedItemTintColor:normalColor];
//    } else {
//        [attributDicNor setValue:normalColor forKey:NSForegroundColorAttributeName];
//    }
//    [attributDicNor setValue:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName];
//
//    [attributDicSelect setValue:selectColor forKey:NSForegroundColorAttributeName];
//    [attributDicSelect setValue:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName];
//    UITabBarItem *tabBarItem = [UITabBarItem appearance];
//    [tabBarItem setTitleTextAttributes:attributDicNor    forState:UIControlStateNormal];
//    [tabBarItem setTitleTextAttributes:attributDicSelect forState:UIControlStateSelected];
//
//    if (@available(iOS 15.0, *)) {
//        UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
////        appearance.backgroundImage = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:1]];
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes   = @{NSForegroundColorAttributeName: normalColor};
//        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: selectColor};
//        tabBar.scrollEdgeAppearance = appearance;
//        tabBar.standardAppearance   = appearance;
//    }
//
//
//    // 添加子控制器
//    [self setupChildVC:[LH_HomeViewController new]
//                 title:@"首页"
//              andImage:@"home"
//        andSelectImage:@"home_select"];
//    [self setupChildVC:[LH_DynamicController new]
//                 title:@"发现"
//              andImage:@"discover"
//        andSelectImage:@"discover_select"];
//    [self setupChildVC:[HLBazaarViewController new]
//                 title:@"市场"
//              andImage:@"market"
//        andSelectImage:@"market_select"];
//    [self setupChildVC:[LH_MyViewController new]
//                 title:@"我"
//              andImage:@"my"
//        andSelectImage:@"my_select"];
//
////    [self setupChildVC:[LH_DynamicController class]
////                 title:@"首页"
////              andImage:@"home"
////        andSelectImage:@"home_select"];
//
//
//}
//-(void)setSpecialIndex:(NSInteger)specialIndex{
//    _specialIndex = specialIndex;
//    _currentIndex = _specialIndex;
//    self.selectedViewController = self.viewControllers[_specialIndex];
//    [self setAnaimationWithTabBarController:self selectViewController:self.viewControllers[_specialIndex]];
//}
//-(void)setSelectedIndex:(NSUInteger)selectedIndex{
//
//    self.currentIndex = selectedIndex;
//    [self tabBarController:self didSelectViewController:self.viewControllers[self.currentIndex]];
//    self.selectedViewController = self.viewControllers[self.currentIndex];
//}
//#pragma mark - UITabBarControllerDelegate
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
//    if (self.currentIndex == index) {
//        return NO;
//    }
//    self.currentIndex = index;
//    return YES;
//
//}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//
//    LH_BaseNavigationController * navi = (LH_BaseNavigationController*)viewController;
//    if ([navi.viewControllers.firstObject isKindOfClass:[LH_BaseViewController class]]) {
//        LH_BaseViewController * switchViewController = (LH_BaseViewController*)navi.viewControllers.firstObject;
//        [switchViewController switchTabbarUpdateData];
//    }
//
//
//    [self setAnaimationWithTabBarController:tabBarController selectViewController:viewController];
//}
//
//- (void)setAnaimationWithTabBarController:(UITabBarController *)tabBarController selectViewController:(UIViewController *)viewController {
//
//    //1.
//    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
//    __block NSMutableArray <UIView *>*tabBarSwappableImageViews = [NSMutableArray arrayWithCapacity:4];
//    //2.
//    for (UIView *tempView in tabBarController.tabBar.subviews) {
//        if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            for (UIImageView *tempImageView in tempView.subviews) {
//                if ([tempImageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//                    [tabBarSwappableImageViews addObject:tempImageView];
//                }
//            }
//        }
//    }
//    //3.
//    __block UIView *currentTabBarSwappableImageView = tabBarSwappableImageViews[index];
//    //动画01-带重力效果的弹跳
////    [AnimationHelper gravityAnimation:currentTabBarSwappableImageView];
//    //动画02-先放大，再缩小
////    [AnimationHelper zoominTozoomoutAnimation:currentTabBarSwappableImageView];
//    //动画03-Z轴旋转
////    [AnimationHelper zaxleRotationAnimation:currentTabBarSwappableImageView];
//    //动画04-Y轴位移
////    [AnimationHelper yaxleMovementAnimation:currentTabBarSwappableImageView];
//    //动画05-放大并保持
////    [AnimationHelper zoominKeepEffectAnimation:tabBarSwappableImageViews index:index];
//    //动画06-Lottie动画
//    [self lottieAnimation:currentTabBarSwappableImageView index:index];
//
//}
//
//
//#pragma mark - Custom
///**
// * 初始化子控制器
// */
//- (void)setupChildVC:(LH_BaseViewController *)vc title:(NSString *)title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
//
//    LH_BaseNavigationController *nvc = [[LH_BaseNavigationController alloc] initWithRootViewController:vc];
//    nvc.tabBarItem.title = title;
//    nvc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nvc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nvc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1.5, 0, 1.5, 0);
//    [self addChildViewController:nvc];
//}
//-(void)lottieAnimation:(UIView *)currentAnimationView index:(NSInteger)index {
//    CGRect frame = currentAnimationView.frame;
//    frame.origin.x = 0;
//    frame.origin.y = 0;
//    __block LOTAnimationView *lottieAnimationView = [LOTAnimationView animationNamed:[NSString stringWithFormat:@"tab_%ld",index]];
//    lottieAnimationView.frame = frame;
//    lottieAnimationView.contentMode = UIViewContentModeScaleAspectFill;
//    lottieAnimationView.animationSpeed = 2;
//    //self.animationView = animationView;
//    lottieAnimationView.center = currentAnimationView.center;
//    [currentAnimationView.superview addSubview:lottieAnimationView];
//    currentAnimationView.hidden = YES;
//    [lottieAnimationView playFromProgress:0 toProgress:1 withCompletion:^(BOOL animationFinished) {
//        currentAnimationView.hidden = NO;
//        [lottieAnimationView removeFromSuperview];
//        lottieAnimationView = nil;
//    }];
//
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
