//
//  LHCheckTool.h
//  Project
//
//  Created by dc on 2022/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHCheckTool : NSObject
/**
 校验手机号是否正确
 */
+ (BOOL)vailableMobile:(NSString *)mobile;

@end

NS_ASSUME_NONNULL_END
