//
//  WordFilter.h
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LH_WordFilter : NSObject

- (void)addFilterWords: (NSArray *)filterWords;

- (NSString *)filter:(NSString *)str;

/**
 释放过滤词库
 */
- (void)freeFilter;

@end

NS_ASSUME_NONNULL_END
