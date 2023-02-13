//
//  DeviceManage.h
//  Project
//
//  Created by Book on 2022/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceManage : NSObject

/**
 包名
 */
+(NSString *)bundleIdentifier;
/**
 App名字
 */
+(NSString *)bundleDisplayName;

/**
 App 版本号
 */
+(NSString *)bundleVersion;


/**
 手机别名
 */
+(NSString *)phoneName;
/**
 手机名称
 */
+(NSString *)deviceName;

/**
 手机系统版本
 */
+(NSString *)phoneVersion;
/**
 地方型号  （国际化区域名称）
 */
+(NSString *)localPhoneModel;
/**
 手机型号
 */
+(NSString *)phoneModel;



/**
 UUID
 */
+(NSString *)UUIDString;



@end

NS_ASSUME_NONNULL_END
