//
//  LHVIew.h
//  Project
//
//  Created by a on 2022/5/30.
//

#import <UIKit/UIKit.h>
#import "LHItem.h"

@class LHSegmentedView;
@protocol LHSegmentedViewDelegate <NSObject>

@optional

- (BOOL)segmentdView:(LHSegmentedView *_Nullable)segmentdView willSelectItemAtIndex:(NSInteger)index;
- (void)segmentdView:(LHSegmentedView *_Nullable)segmentdView didSelectedItemAtIndex:(NSInteger)index;
- (void)segmentdView:(LHSegmentedView *_Nullable)segmentdView didDoubleTapItemAtIndex:(NSInteger)index;


@end


NS_ASSUME_NONNULL_BEGIN

@interface LHSegmentedView : UIView<UIScrollViewDelegate>


@property (nonatomic, copy) NSArray<LHItem *> *items; // TabItems

@property (nonatomic, weak) id<LHSegmentedViewDelegate> delegate;
/**
 设置item选中背景
 */
@property (nonatomic, strong) UIColor * itemSelectedBgColor;
/**
 限制背景色 或下划线 的长 高
 */
@property (nonatomic, assign) UIEdgeInsets itemSelectedBgInsets;


/**
 按钮第一个和最后一个距离边缘的距离
 */
@property (nonatomic, assign) NSInteger leftAndRightSpacing;

/**
 标题颜色
 */
@property (nonatomic, strong) UIColor *itemTitleColor;
/**
 选中时标题的颜色
 */
@property (nonatomic, strong) UIColor *itemTitleSelectedColor;
/**
 标题字体
 */
@property (nonatomic, strong) UIFont *itemTitleFont;
/**
 选中时标题的字体
 */
@property (nonatomic, strong) UIFont *itemTitleSelectedFont;

/**
 选中某一个item
 */
@property (nonatomic, assign) NSInteger selectedItemIndex;

/**
 *  拖动内容视图时，item的颜色是否根据拖动位置显示渐变效果，默认为YES
 */
@property (nonatomic, assign, getter = isItemColorChangeFollowContentScroll) BOOL itemColorChangeFollowContentScroll;

/**
 *  拖动内容视图时，item的字体是否根据拖动位置显示渐变效果，默认为NO
 */
@property (nonatomic, assign, getter = isItemFontChangeFollowContentScroll) BOOL itemFontChangeFollowContentScroll;

/**
 *  TabItem的选中背景是否随contentView滑动而移动
 */
@property (nonatomic, assign, getter = isItemSelectedBgScrollFollowContent) BOOL itemSelectedBgScrollFollowContent;

/**
 *  将Image和Title设置为水平居中，默认为YES
 */
@property (nonatomic, assign, getter = isItemContentHorizontalCenter) BOOL itemContentHorizontalCenter;

/**
 *  设置tabBar可以左右滑动
 *  此方法与setScrollEnabledAndItemFitTextWidthWithSpacing这个方法是两种模式，哪个后调用哪个生效
 *
 *  @param width 每个tabItem的宽度
 */
- (void)setScrollEnabledAndItemWidth:(CGFloat)width;

/**
 *  设置tabBar可以左右滑动，并且item的宽度根据标题的宽度来匹配
 *  此方法与setScrollEnabledAndItemWidth这个方法是两种模式，哪个后调用哪个生效
 *
 *  @param spacing  item的宽度 = 文字宽度 + spacing
 */
- (void)setScrollEnabledAndItemFitTextWidthWithSpacing:(CGFloat)spacing;

/**
 设置item 背景颜色 生成图片
 */
- (void)gradientWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(GradientType)type;

@end

NS_ASSUME_NONNULL_END
