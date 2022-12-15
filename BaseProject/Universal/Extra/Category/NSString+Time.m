//
//  NSString+Time.m
//  Project
//
//  Created by a on 2022/5/5.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+(NSString*)currentDateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+(NSArray*)getWeekBeginAndEndWith:(NSInteger)pastWeek{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    NSInteger weekDay = [comp weekday];
    NSInteger day = [comp day];
    NSInteger firstDiff, lastDiff;
    if (weekDay == 1){
        if (pastWeek == 1) {
            firstDiff = -6*pastWeek;
            lastDiff = -6*(pastWeek-1);
        }
        else{
            firstDiff = -7*pastWeek+1;
            lastDiff = -7*(pastWeek-1);
        }
    }
    else{
        firstDiff = [calendar firstWeekday] - weekDay + 1 - 7*(pastWeek-1);
        lastDiff = 8 - weekDay - 7*(pastWeek-1);
    }

    //在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
   
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
        
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *firstDay = [formatter stringFromDate:firstDayOfWeek];
    NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    return @[firstDay,lastDay];
}

+(NSArray*)getMonthBeginAndEndWith:(NSInteger)pastMonth{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    
    NSInteger getMonth = comp.month-pastMonth;
    NSInteger getYear = comp.year;
    if (getMonth <= 0) {
        getYear--;
        getMonth = getMonth+12;
    }
    NSString *beginTime = [NSString stringWithFormat:@"%ld-%02ld-01",getYear,getMonth];
    
    comp.year = getYear;
    comp.month = getMonth;
    NSDate *lastDate = [calendar dateFromComponents:comp];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:lastDate];
    NSString *endTime = [NSString stringWithFormat:@"%ld-%02ld-%02ld",comp.year,comp.month,range.length];
    return @[beginTime,endTime];
}

+(NSArray*)getThreeMonthBeginAndEndWith{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    NSString *endTime = [NSString stringWithFormat:@"%ld-%02ld-%02ld",comp.year,comp.month,comp.day+1];
    
    NSInteger getMonth = comp.month-2;
    NSInteger getYear = comp.year;
    if (getMonth <= 0) {
        getYear--;
        getMonth = getMonth+12;
    }
    NSString *beginTime = [NSString stringWithFormat:@"%ld-%02ld-01",getYear,getMonth];
    return @[beginTime,endTime];
}
#pragma mark 时间戳 转日期 （yyyy-MM-dd）
+ (NSString *)timeWithYearMonthDayCountDown:(NSString *)timestamp {
    // 时间戳转日期
    
    // 传入的时间戳timeStr如果是精确到毫秒的记得要/1000
    NSTimeInterval timeInterval = [timestamp doubleValue];
    if (timestamp.length==13) {
        timeInterval = [timestamp doubleValue]/1000;
    }
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 实例化一个NSDateFormatter对象，设定时间格式，这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [dateFormatter stringFromDate:detailDate];

    return dateStr;
}
// 字符串转时间戳 如：2017-4-10 17:15:10 （精确到毫秒*1000）
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
}
#pragma mark 转换成 （天 时 分 秒）
+ (NSString *)timeFormatted:(NSInteger)totalSeconds {
        
    NSInteger day = (totalSeconds/(3600*24));
    NSInteger hour = ((totalSeconds-day*24*3600)/3600);
    NSInteger minute = (totalSeconds-day*24*3600-hour*3600)/60;
    NSInteger second = totalSeconds - day*24*3600 - hour*3600 - minute*60;

    return [NSString stringWithFormat:@"%ld天%ld时%ld分%ld秒", day, hour, minute, second];
    
}
// 当前时间戳
+ (NSString *)nowTimeInterval {
    // 现在的时间戳
    
    // 获取当前时间0秒后的时间
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    // *1000 是精确到毫秒，不乘就是精确到秒
    NSTimeInterval time = [date timeIntervalSince1970]*1000;
    NSString *timeStr = [NSString stringWithFormat:@"%.0f", time];
    return timeStr;
}
// 1、获取某一天是星期几
+(NSString *)getWeekDayFordate:(NSTimeInterval)date{
    NSArray *weekday = [NSArray arrayWithObjects:[NSNull null], @"7",@"1", @"2", @"3", @"4", @"5", @"6", nil];
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    
    return weekStr;
}
#pragma mark 1、获取某一天是星期几
+(NSString *)getWeekDayForDateTimeStamp:(NSTimeInterval)timeStamp{
    
    NSArray *weekday = [NSArray arrayWithObjects:[NSNull null], @"周日",@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];

    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    
    return weekStr;
}
//9、获取当月的天数
+(NSInteger)getNumberOfDaysInCurrentMonth{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    
    return numberOfDaysInMonth;
}
+ (NSString *)timeTurnStringTimestamp:(NSString *)timestamp{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    
    NSInteger seconds = round(timeInterval);
    
    if (seconds < 0) {
        return @"";
    }
    if (seconds < 60) {
        return @"刚刚";
    }else if (seconds < 3600) {
        return [NSString stringWithFormat:@"%ld分钟之前",seconds/60];
    }else if (seconds < 3600*24){
        return [NSString stringWithFormat:@"%ld小时之前",seconds/(3600)];
    }else if (seconds < (3600*24*30)){
        return [NSString stringWithFormat:@"%ld天之前",seconds/(3600*24)];
    }else if (seconds < (3600*24*30*12)){
        return [NSString stringWithFormat:@"%ld月之前",seconds/(3600*24*30)];
    }else{
        return [NSString stringWithFormat:@"%ld年之前",seconds/(3600*24*30*12)];
    }
}


-(void)intervalWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate{
   
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth;//同时比较天数、月份差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta1 = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    //打印
    NSLog(@"%@",delta1);

}

@end
