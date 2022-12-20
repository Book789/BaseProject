//
//  SQFileLogformatter.m
//  CocoaLumberjackDemo
//
//

#import "SQFileLogFormatter.h"

@implementation SQFileLogFormatter

//实现方法
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel = nil;
    switch (logMessage->_flag) {
        case DDLogFlagError:
            logLevel = @"Error";
            break;
        case DDLogFlagWarning:
            logLevel = @"Warn";
            break;
        case DDLogFlagInfo:
            logLevel = @"Info";
            break;
        case DDLogFlagDebug:
            logLevel = @"Debug";
            break;
        default:
            logLevel = @"Verbose";
            break;
    }
    NSString *formatLog = [NSString stringWithFormat:@"%@[SQ]%@%@-%ld\n%@",logMessage->_timestamp, logLevel,logMessage->_function,logMessage->_line,logMessage->_message];
    return formatLog;
}

- (NSString *)getTimeStringWithDate:(NSDate *)date {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"YYYY.MM.dd-HH.mm.ss.SSS"];
    });
    return [dateFormatter stringFromDate:date];
}

@end
