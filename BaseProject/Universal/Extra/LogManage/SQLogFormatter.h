//
//  SQLogFormatter.h
//  CocoaLumberjackDemo
//
//  Log输出格式自定义(遵循DDLogFormatter协议，然后实现formatLogMessage:方法)

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQLogFormatter : NSObject<DDLogFormatter>

@end

NS_ASSUME_NONNULL_END
