//
//  NSString+NB.h
//  NiceIM
//
//  Created by mac on 2020/2/28.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NB)


/// 获取字符串高度
/// @param font 字体大小
/// @param width UI宽
-(CGFloat)getTextHeightfont:(UIFont *)font labelWidth:(float)width;

/// 修改制定字符串颜色
/// @param string 要修改的字符串
/// @param color 颜色
- (NSMutableAttributedString*)specifiedString:(NSString*)string changeColor:(UIColor*)color;

/// 修改制定字符串颜色
/// @param array 要修改的字符串 的数组
/// @param color 颜色
- (NSMutableAttributedString*)specifiedStringArray:(NSArray*)array changeColor:(UIColor*)color;

/// 改变指定字符字体大小
/// @param str 要修改的字符串
/// @param font 字体
-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(UIFont *)font;
/// 改变指定字符字体大小
/// @param str 要修改的字符串
/// @param font 字体
-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(UIFont *)font changeColor:(UIColor*)color;

/// 改变指定字符字体行间距
/// @param space 行间距
-(NSMutableAttributedString*)adjustLineSpacing:(CGFloat)space;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/// 修复数字精度缺失
-(NSString *)repairNumPrecision;

/// 提示标签不能输入特殊字符
- (BOOL)judgeTheillegalCharacter;
    
/// 时间戳转字符串
+ (NSString*)formartCreateTime:(NSTimeInterval)timeInterval format:(NSString*)format;

/// 获取缓存文件大小
+ (CGFloat)getCacheSize;

/// 清除缓存文件
+ (void)clearCache;

/// 是否包含url
- (BOOL)containtUrl;
   
/// 获取用户手机服务商信息
+ (NSString *)getOperatorInfomation;

/// 是否包含中文
- (BOOL)checkIsContainChinese;

/// 时间格式转化 处理服务端返回时间转化本地时区
/// @param format 输出格式 默认yyyy-MM-dd HH:mm:ss
- (NSString*)utcTimeStrTransformLocTimeStr:(nullable NSString*)format;

/// 时间格式转化 处理服务端返回时间
/// @param format 要返回的时间格式
/// @param pastTime 原有时间 加上小时数
- (NSString*)utcTimeStrTransformLocTimeStr:(NSString*)format pastTime:(NSInteger)pastTime;

/// 时间转时间戳
/// @param formatStr yyyy-MM-dd HH:mm:ss
- (NSTimeInterval)transTotimeStamp:(nullable NSString*)formatStr;

/// 根据群组ID获取默认图片
- (UIImage*)teamDefaultIconByTeamID;

/// 匹配链接 正则表达式
+ (NSString *)linksRegular;

/// 获取手机机型
+ (NSString*)iphoneType;

/// 修改html字体大小
/// @param fontSize 字体大小
- (NSString *)htmlBodyWithFontSize:(NSString *)fontSize;

/// 群成员等级背景色
- (UIColor*)teamLvlBackGroundColor;

/// 判断字符串中是否存在emoji
- (BOOL)stringContainsEmoji;

/// 判断字符串中是否存在emoji
- (BOOL)hasEmoji;

/// 判断是不是九宫格
- (BOOL)isNineKeyBoard;

/// 判断是否是数字
- (BOOL)judgeIsAllNumber;

//产生随机字符串
- (NSString *)generateRandomString;
/**
 判断是否为纯数字
 */
+ (BOOL)isNumber:(NSString *)strValue;


@end

NS_ASSUME_NONNULL_END
