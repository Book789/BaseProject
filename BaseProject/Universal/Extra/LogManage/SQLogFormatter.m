//
//  SQLogFormatter.m
//  CocoaLumberjackDemo
//
//

#import "SQLogFormatter.h"

@implementation SQLogFormatter


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
     NSString *formatLog = [NSString stringWithFormat:@"[SQ]%@%@-%ld\n%@",logLevel,logMessage->_function,logMessage->_line,logMessage->_message];
     return formatLog;
}

@end
