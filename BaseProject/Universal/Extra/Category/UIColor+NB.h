//
//  UIColor+NB.h
//  NiceIM
//
//  Created by 顺溜 on 2020/7/21.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (NB)

/// 白色
@property (class, nonatomic, readonly)UIColor *nbWhiteColor;


/**
 控制器视图背景色
default: #333333, night: #C2C2C2
 */
@property (class, nonatomic, readonly)UIColor *backgroundColor;

/// 主题红色
@property (class, nonatomic, readonly)UIColor *themeRedColor;

/// 黑色字体颜色
@property (class, nonatomic, readonly)UIColor *mainTextColor;

/// 半黑色字体颜色
@property (class, nonatomic, readonly)UIColor *midTextColor;

/// 灰色字体颜色
@property (class, nonatomic, readonly)UIColor *subTextColor;

/// 分割线颜色
@property (class, nonatomic, readonly)UIColor *separatorColor;

/// 特殊背景颜色
@property (class, nonatomic, readonly)UIColor *spcialBackgroundColor;

/// 浅红色背景颜色
@property (class, nonatomic, readonly)UIColor *spcialRedBackgroundColor;



/// 两个颜色过渡色
/// @param startColor 第一个颜色
/// @param endColor 第二个颜色
/// @param ratio 过渡比例
+ (UIColor *)startColor:(UIColor*)startColor endColor:(UIColor *)endColor ratio:(CGFloat)ratio;

@end

NS_ASSUME_NONNULL_END
