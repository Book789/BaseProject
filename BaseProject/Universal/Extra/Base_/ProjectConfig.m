//
//  ProjectConfig.m
//  BaseProject
//
//  Created by dc on 2022/3/14.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "ProjectConfig.h"

@implementation ProjectConfig

+ (instancetype)sharedConfig{
    static ProjectConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ProjectConfig alloc] init];
    });
    return instance;
}

@end
