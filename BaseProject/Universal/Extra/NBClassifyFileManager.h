//
//  NBClassifyFileManager.h
//  NiceIM
//
//  Created by mac on 2020/5/9.
//  Copyright © 2020 mac. All rights reserved.
//
//  文件持久化  Archive会将对象及其对象关系序列化

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBClassifyFileManager : NSObject


/// 读取文件dic
/// @param path 路径
+(NSDictionary *)readClassifyDicWithPath:(NSString *)path;

/// 写入字典
/// @param dic 要写入数据
/// @param path 保存沙河路径
+(void)writeToFileWithDic:(NSDictionary *)dic andFilePath:(NSString *)path;


/// 读取文件NSArray
/// @param path 路径
+(NSArray *)readArrayWithPath:(NSString *)path;

/// 写入数组 arr
/// @param arr 要写入数据
/// @param path 保存沙河路径
+(void)writeToFileWithArray:(NSArray *)arr andFilePath:(NSString *)path;


/// 读取文件字符串
/// @param path 路径
+(NSString *)readStringWithPath:(NSString *)path;

/// 写入字符串 string
/// @param string 要写入数据
/// @param path 保存沙河路径
+(void)writeToFileWithString:(NSString *)string andFilePath:(NSString *)path;


/// 读取文件NSData
/// @param path 路径
+(NSData *)readClassifyFileWithPath:(NSString *)path;

/// 写入 NSData
/// @param tempData 要写入数据
/// @param path 保存沙河路径
+(void)writeToFileWithData:(NSData *)tempData andFilePath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
