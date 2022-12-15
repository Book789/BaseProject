//
//  UIImage+Gradient.h
//
//  颜色渐变

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            //从上到下
    GradientFromLeftToRight,                //从左边到右
    GradientFromLeftTopToRightBottom,       //从上到下
    GradientFromLeftBottomToRightTop        //从上到下
};

@interface UIImage (Gradient)

/**
 *  根据给定的颜色，生成渐变色的图片 默认颜色数组为2种颜色
 *  @param imageSize        要生成的图片的大小
 *  @param colorsArray         渐变颜色的数组
 *   percents            默认@[@(0),@(1.0)]
 *   gradientType    渐变类型 默认为从左到右
 */
+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorsArray;
/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorsArray         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *   gradientType    渐变类型 默认为从左到右
 */
+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorsArray percentage:(NSArray *)percents;
/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorsArray         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *  @param gradientType     渐变色的类型
 */
+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorsArray percentage:(NSArray *)percents gradientType:(GradientType)gradientType;

@end
