//
//  LHSegmentViewController.h
//  Project
//
//  Created by a on 2022/5/30.
//
//嵌套ScrollView 

#import "BaseViewController.h"
#import "LHContentScrollView.h"
#import "LHSegmentedView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LHNestedScrollViewController : BaseViewController

/**
 title 栏
 */
@property (nonatomic, strong) LHSegmentedView * segmentedView;


/**
 内容 scrollView
 */
@property (nonatomic, strong) LHContentScrollView * scrollView;


@property(nonatomic,copy) NSArray<__kindof UIViewController *> *viewControllers;

/**
 *  内容视图的Frame
 */
@property (nonatomic, assign) CGRect contentViewFrame;


/**
 *  被选中的ViewController的Index
 */
@property (nonatomic, assign, readonly) NSInteger selectedControllerIndex;

/**
 *  获取被选中的ViewController
 */
- (UIViewController *)selectedController;

/**
 *  设置内容视图支持滑动切换，以及点击item切换时是否有动画
 *
 *  @param animated  点击切换时是否支持动画
 */
- (void)setContentScrollEnabledAndTapSwitchAnimated:(BOOL)animated;


@end


@interface UIViewController (LHNestedScrollViewController)

/**
 tabItem的标题
 */
@property (nonatomic, copy) NSString *itemTitle;

@property (nonatomic, strong) UIImage *yp_tabItemImage; // tabItem的图像
@property (nonatomic, strong) UIImage *yp_tabItemSelectedImage; // tabItem的选中图像

///1.2新增的标题 admin
@property (nonatomic, copy) NSAttributedString *yp_tabItemAttTitle;

- (LHItem *)item;

- (LHNestedScrollViewController *)nestedScrollViewController;

/**
 *  ViewController对应的Tab被Select后，执行此方法
 */
- (void)tabItemDidSelected;

/**
 *  ViewController对应的Tab被Deselect后，执行此方法
 */
- (void)tabItemDidDeselected;
@end

NS_ASSUME_NONNULL_END
