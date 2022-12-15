//
//  LHReachability.m
//  BaseProject
//
//  Created by dc on 2022/3/24.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "LHReachability.h"
#import "YYReachability.h"

@interface LHReachability ()

@property (nonatomic, strong) YYReachability *reachability;

@end

@implementation LHReachability

+ (instancetype)shareInstance{
    static LHReachability * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LHReachability alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _reachability = [YYReachability reachabilityWithHostname:@"www.baidu.com"];
        _reachability.notifyBlock = ^(YYReachability * _Nonnull reachability) {
//            FMRunInMainQueue(^{
//                [[NSNotificationCenter defaultCenter] postNotificationName:FMReachabilityChangedNotification object:reachability];
//            });
        };
    }
    return self;
}

//
- (BOOL)networkEnable
{
    return [_reachability isReachable];
}

//
- (BOOL)isWiFi
{
     return  _reachability.status == YYReachabilityStatusWiFi;
}

- (BOOL)isWWAN
{
    return  _reachability.status == YYReachabilityStatusWWAN;
}

//
- (BOOL)is2G
{
    if (_reachability.status == YYReachabilityStatusWWAN)
    {
        if (_reachability.wwanStatus == YYReachabilityWWANStatus2G)
            return YES;
    }
    return NO;
}

- (BOOL)is3G
{
    if (_reachability.status == YYReachabilityStatusWWAN)
    {
        if (_reachability.wwanStatus == YYReachabilityWWANStatus3G)
            return YES;
    }
    return NO;
}

- (BOOL)is4G
{
    if (_reachability.status == YYReachabilityStatusWWAN)
    {
        if (_reachability.wwanStatus == YYReachabilityWWANStatus4G)
            return YES;
    }
    return NO;
}

@end
