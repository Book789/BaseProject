//
//  LHReachability.h
//  BaseProject
//
//  Created by dc on 2022/3/24.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHReachability : NSObject


+ (instancetype)shareInstance;

- (BOOL)networkEnable; /**< 网络连接是否正常*/
- (BOOL)isWiFi;/**< 当前网络是否WiFi*/
- (BOOL)isWWAN;/**< 当前网络是否蜂窝数据*/

- (BOOL)is2G;   /**< 当前为2G网络 IOS7之上才支持*/
- (BOOL)is3G;   /**< 当前为3G网络 IOS7之上才支持*/
- (BOOL)is4G;   /**< 当前为4G网络 IOS7之上才支持*/

@end

NS_ASSUME_NONNULL_END
