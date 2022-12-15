//
//  LHItem.h
//  Project
//
//  Created by a on 2022/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHItem : UIButton

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *titleSelectedColor;

@property (nonatomic, assign, readonly) CGRect frameWithOutTransform;


/**
 *  badge > 99，显示99+
 *  badge <= 99 && badge > 0，显示具体数值
 *  badge == 0，隐藏badge
 *  badge < 0，显示一个小圆点，即YPTabItemBadgeStyleDot
 */
@property (nonatomic, assign) NSInteger badge;


@end

NS_ASSUME_NONNULL_END
