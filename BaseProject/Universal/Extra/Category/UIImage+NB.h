//
//  UIImage+NB.h
//  NiceIM
//
//  Created by mac on 2020/3/13.
//  Copyright © 2020 mac. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (NB)


/// 获取视频第一帧
/// @param path 视频地址
+ (UIImage *)getVideoPreViewImage:(NSURL *)path;


/// 生成指定尺寸二维码
/// @param content 二维码字符串
/// @param size 大小
+(UIImage *)qrCodeImageWithContent:(NSString *)content codeImageSize:(CGFloat)size;


/// 获取图片主题色
/// @param image 图片
/// @param scale 寻找颜色时图片缩放加快速度 缩放越大误差会越大
+ (NSArray *)imageThemeColor:(UIImage *)image scale:(CGFloat)scale;


/// 绘制图片
/// @param color 背景色
/// @param size 大小
/// @param text 文字
/// @param textAttributes 字体设置
/// @param isCircular 是否圆形
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size text:(NSString *)text textAttributes:(NSDictionary *)textAttributes circular:(BOOL)isCircular;


/// 根据用户ID 显示名生成图片
/// @param userID 用户ID
/// @param showName 显示名
+ (UIImage *)imageWidthUserID:(NSString*)userID showName:(NSString*)showName;


/// 图片剪裁圆形
/// @param borderW 边框大小
/// @param borderColor 边框颜色
- (UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor;


/// 群用户头像拼接成图片
/// @param array image数组
/// @param bgColor 返回图片背景色
+ (UIImage *)groupIconWith:(NSArray *)array bgColor:(UIColor *)bgColor;


/// 群用户头像拼接成图片
/// @param URLArray image远程url
/// @param bgColor 返回图片背景色
+ (UIImage *)groupIconWithURLArray:(NSArray *)URLArray bgColor:(UIColor *)bgColor;

/// 生成渐变色图片
/// @param colors 渐变颜色
/// @param rect 图片尺寸
+ (UIImage *)gradientImageWithColors:(NSArray *)colors rect:(CGRect)rect;

/**
  生成纯色的图片
 */
+ (UIImage *)colorAsImageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
