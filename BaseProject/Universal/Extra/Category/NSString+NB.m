//
//  NSString+NB.m
//  NiceIM
//
//  Created by mac on 2020/2/28.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NSString+NB.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <sys/utsname.h>

@implementation NSString (NB)

- (CGFloat)getTextHeightfont:(UIFont *)font labelWidth:(float)width{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}

- (NSMutableAttributedString*)specifiedString:(NSString*)string changeColor:(UIColor*)color{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (string.length == 0) string = @" ";
    NSRange range = [self rangeOfString:string];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attributedStr;
}

- (NSMutableAttributedString*)specifiedStringArray:(NSArray*)array changeColor:(UIColor*)color{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:@""];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    for (NSString * string in array) {
        NSRange range = [self rangeOfString:string];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributedStr;
}

-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(UIFont *)font{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (str.length != 0) {
        NSRange range = [self rangeOfString:str];
        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributedStr;
}
-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(UIFont *)font changeColor:(UIColor*)color{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (str.length != 0) {
        NSRange range = [self rangeOfString:str];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributedStr;
}
-(NSMutableAttributedString*)adjustLineSpacing:(CGFloat)space{
    if (self.length == 0) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self]; //字间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space]; //行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    return attributedString;
}

#pragma mark- 字符串转化字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil || ![jsonString isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

-(NSString *)repairNumPrecision{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [self doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

//提示标签不能输入特殊字符
- (BOOL)judgeTheillegalCharacter{
    NSString *str = @"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

+ (NSString*)formartCreateTime:(NSTimeInterval)timeInterval format:(NSString*)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (format) {
        [dateFormatter setDateFormat:format];
    }
    else{
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    }
    NSString *dateString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    if (!dateString.length) {
        return @"未知时间";
    }
    return dateString;
}

+ (CGFloat)getCacheSize{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES) firstObject];
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath :cachePath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:cachePath] objectEnumerator];
    NSString *fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject]) != nil ){
        //获取文件全路径
        NSString *fileAbsolutePath = [cachePath stringByAppendingPathComponent:fileName];
        if ([manager fileExistsAtPath :fileAbsolutePath]){
            folderSize += [[manager attributesOfItemAtPath:fileAbsolutePath error:nil] fileSize];
        }
    }
    return folderSize/(1024.0*1024.0);
}

+ (void)clearCache{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES) firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath :cachePath];
    for (NSString *p in files) {
        NSError *error = nil ;
        //获取文件全路径
        NSString *fileAbsolutePath = [cachePath stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager ] fileExistsAtPath :fileAbsolutePath]) {
            [[NSFileManager defaultManager ] removeItemAtPath :fileAbsolutePath error :&error];
        }
    }
}

- (BOOL)containtUrl{
   NSString *regularStr =  @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regularStr options:0 error:nil];
    return [regular matchesInString:self options:0 range:NSMakeRange(0, self.length)].count;
}

+ (NSString *)getOperatorInfomation{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *code = [carrier mobileNetworkCode];
    if (code == nil) {
        return @"不能识别";
    }
    if ([code isEqualToString:@"00"] ||
        [code isEqualToString:@"02"] ||
        [code isEqualToString:@"07"]) {
        return @"移动运营商";
    }
    if ([code isEqualToString:@"01"] ||
        [code isEqualToString:@"06"] ||
        [code isEqualToString:@"09"]) {
        return @"联通运营商";
    }
    if ([code isEqualToString:@"03"] ||
        [code isEqualToString:@"05"] ||
        [code isEqualToString:@"11"]) {
        return @"电信运营商";
    }
    if ([code isEqualToString:@"20"]) {
        return @"铁通运营商";
    }
    return @"不能识别";
}

- (BOOL)checkIsContainChinese{
    for (NSInteger i=0; i<self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch  && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
}

- (NSString*)utcTimeStrTransformLocTimeStr:(nullable NSString*)format{
    NSString *utcTimeStr = self;
    if (self.length > 18) {
        //服务器返回格式 2020-04-26T05:35:55.000+0000
        utcTimeStr = [self substringToIndex:self.length-9];
        utcTimeStr = [utcTimeStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDate *utcDate = [formatter dateFromString:utcTimeStr];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = format ?: @"yyyy-MM-dd HH:mm:ss";
    NSString *locTimeStr = [formatter stringFromDate:utcDate];
    return locTimeStr ?: self;
}

- (NSString*)utcTimeStrTransformLocTimeStr:(NSString*)format pastTime:(NSInteger)pastTime{
    NSString *utcTimeStr = self;
    if (self.length > 18) {
        //服务器返回格式 2020-04-26T05:35:55.000+0000
        utcTimeStr = [self substringToIndex:self.length-9];
        utcTimeStr = [utcTimeStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format ?: @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDate *utcDate = [formatter dateFromString:utcTimeStr];
    NSDate *date = [NSDate dateWithTimeInterval:pastTime*60*60 sinceDate:utcDate];
    formatter.timeZone = [NSTimeZone localTimeZone];
    NSString *locTimeStr = [formatter stringFromDate:date];
    return locTimeStr;
}

//时间---->时间戳
-(NSTimeInterval)transTotimeStamp:(nullable NSString*)formatStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    if (formatStr) {
        [dateFormatter setDateFormat:formatStr];
    }
    else{
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSDate *date = [dateFormatter dateFromString:self];
    return [date timeIntervalSince1970];
}

#pragma mark- 根据群组ID获取默认图片
-(UIImage*)teamDefaultIconByTeamID{
    NSInteger teamIconNum = [self longLongValue]%20;
    return [UIImage imageNamed:[NSString stringWithFormat:@"team_icon%ld",(long)teamIconNum]];
}

#pragma mark- 链接正则
+ (NSString *)linksRegular{
return @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
}

+ (NSString*)iphoneType{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max (China)";
    if([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if([platform isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    if ([platform isEqualToString:@"iPhone12,8"]) return @"iPhone SE 2";
    if ([platform isEqualToString:@"iPhone13,1"]) return @"iPhone 12 mini";
    if ([platform isEqualToString:@"iPhone13,2"]) return @"iPhone 12";
    if ([platform isEqualToString:@"iPhone13,3"]) return @"iPhone 12 Pro";
    if ([platform isEqualToString:@"iPhone13,4"]) return @"iPhone 12 Pro Max";

    return platform ?: @"iPhone";
}

//html字体大小
- (NSString *)htmlBodyWithFontSize:(NSString *)fontSize{
    NSMutableString *html = [NSMutableString stringWithString:@"<html>"];
    [html appendString:@"<head>"];
    [html appendString:@"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\">"];
    //[html appendString:[NSString stringWithFormat:@"<style>@font-face{font-family: 'Endzone Sans';src: url('%@');}</style>",[[NSBundle mainBundle] pathForResource:@"EndzoneSans-Light" ofType:@"otf"]]];
//    [html appendString:@"<style>"];
//    html appendString:<#(nonnull NSString *)#>
//    [html appendString:@"</style>"];
    
    [html appendString:@"</head>"];
    [html appendString:[NSString stringWithFormat:@"<body style='font-size:%@px;font-family:PingFangSC-Regular;padding:0px 10px'>",fontSize]];
    
    NSString *contentStr = self;
    if ([self isEqual:[NSNull null]]){
        contentStr = @" ";
    }
    [html appendString:contentStr];
    [html appendString:@"</body>"];
    [html appendString:@"</html>"];
    return html;
}

//MARK:群成员等级背景色
- (UIColor*)teamLvlBackGroundColor{
    switch ([self integerValue]) {
        case 1:
            return kColorWithHex(0xfda961); //青铜
            break;
        case 2:
            return kColorWithHex(0xb9c4da); //白银
            break;
        case 3:
            return kColorWithHex(0xfac23b); //黄金
            break;
        case 4:
            return kColorWithHex(0x9aa0e0); //白金
            break;
        case 5:
            return kColorWithHex(0x62d9fd); //钻石
            break;
        case 6:
            return kColorWithHex(0x5d93ff);
            break;
        case 7:
            return kColorWithHex(0xec66ff);
            break;
        case 8:
            return kColorWithHex(0xff6687);
            break;
        case 9:
            return kColorWithHex(0x363545);
            break;
        case 10:
            return kColorWithHex(0x4eb5e0);
            break;
        default:
            return [UIColor clearColor];
            break;
    }
}

//MARK:判断字符串中是否存在emoji
- (BOOL)stringContainsEmoji{
    if (self.length == 0) {
        return NO;
    }
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

//MARK:判断字符串中是否存在emoji
- (BOOL)hasEmoji{
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

//MARK:判断是不是九宫格
-(BOOL)isNineKeyBoard{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)self.length;
    for(int i=0;i<len;i++){
        if(!([other rangeOfString:self].location != NSNotFound))
            return NO;
    }
    return YES;
}

- (BOOL)judgeIsAllNumber{
   if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

//产生随机字符串
- (NSString *)generateRandomString{
    static int len = 15;
    NSString *letters = @"0123456789ABCDEFGHIJKLMNOPQRST";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];
    for (NSInteger i = 0; i < len; i++) {
        uint32_t aa = (uint32_t)[letters length];
        NSInteger a = arc4random_uniform(aa);
        [randomString appendFormat:@"%C", [letters characterAtIndex:a]];
    }
    return randomString;
}

+ (BOOL)isNumber:(NSString *)strValue{
    if (strValue == nil || [strValue length] <= 0){
        return NO;
    }
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    NSString *filtered = [[strValue componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    if (![strValue isEqualToString:filtered]){
        return NO;
    }
    return YES;
}



@end
