//
//  ProjectConfig.h
//  BaseProject
//
//  Created by dc on 2022/3/14.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NB_APPID) {
    APPID_Develop = 100,                 //开发
    APPID_Test = 110,         //测试
    APPID_PreDistribution = 200,               //预发布
    APPID_Distribution = 300,                 //发布
};


@interface ProjectConfig : NSObject

+ (instancetype)sharedConfig;

/**
 域名
 */
@property(nonatomic, readonly)NSString * domainURL;


@end

NS_ASSUME_NONNULL_END
