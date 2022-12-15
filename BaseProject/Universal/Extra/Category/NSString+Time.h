//
//  NSString+Time.h
//  Project
//
//  Created by a on 2022/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Time)


// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒



/**
 获取当前时间
 */
+(NSString*)currentDateStr;

/**
 获取本周开始截止日期
 */
+(NSArray*)getWeekBeginAndEndWith:(NSInteger)pastWeek;

/**
 获取某月开始截止日期
 */
+(NSArray*)getMonthBeginAndEndWith:(NSInteger)pastMonth;

/**
 获取近三个月开始截止日期
 */
+(NSArray*)getThreeMonthBeginAndEndWith;

/**
 时间戳 转日期 （yyyy-MM-dd）
*/
+ (NSString *)timeWithYearMonthDayCountDown:(NSString *)timestamp;

/**
 字符串转时间戳 如：2017-4-10 17:15:10 （精确到毫秒*1000）
 */
+ (NSString *)getTimeStrWithString:(NSString *)str;

/**
  转换成 （天 时 分 秒） totalSeconds 秒
 */
+ (NSString *)timeFormatted:(NSInteger)totalSeconds;


/**
 当前时间戳 单位毫秒
 */
+ (NSString *)nowTimeInterval;


/**
 获取某一天是星期几
 */
+(NSString *)getWeekDayFordate:(NSTimeInterval)date;
/**
 获取某一天是 周几
 */
+(NSString *)getWeekDayForDateTimeStamp:(NSTimeInterval)timeStamp;
/**
 获取当月的天数
 */
+(NSInteger)getNumberOfDaysInCurrentMonth;

/**
 刚刚、几分钟之前、几小时之前、几天、几月、几年之前

 */
+ (NSString *)timeTurnStringTimestamp:(NSString *)timestamp;

@end

NS_ASSUME_NONNULL_END
