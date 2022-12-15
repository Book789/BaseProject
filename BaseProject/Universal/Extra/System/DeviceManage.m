//
//  DeviceManage.m
//  Project
//
//  Created by 天丰互联 on 2022/12/9.
//

#import "DeviceManage.h"

@implementation DeviceManage

+(NSString*)bundleIdentifier{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_BundleId = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return app_BundleId;
}

+(NSString *)bundleDisplayName{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;

}
+(NSString *)bundleVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_build;
}

+(NSString *)phoneName{
    NSString * userPhoneName = [[UIDevice currentDevice] name];
    return userPhoneName;
}

+(NSString *)deviceName{
    NSString * deviceName = [[UIDevice currentDevice] systemName];
    return deviceName;
}
+(NSString *)phoneVersion{
    NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
}
+(NSString *)phoneModel{
    NSString *phoneModel = [[UIDevice currentDevice] model];
    return phoneModel;
}
+(NSString *)localPhoneModel{
    NSString *localPhoneModel = [[UIDevice currentDevice] localizedModel];
    return localPhoneModel;
}



+(NSString *)UUIDString{
    NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return identifier;
}

@end
