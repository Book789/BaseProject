//
//  NBNetworkAction.h
//  NiceIM
//
//  Created by mac on 2020/2/25.
//  Copyright © 2020 mac. All rights reserved.
//
//  网络请求管理类

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "NBNetworkApi.h"

//请求结束的回调方法
typedef void(^RequestFinishBlock)(id result, NSError *error);

//上传图片回调
typedef void(^UploadImageResultBlock)(NSString *url, NSError *error);

//下载文件回调
typedef void(^DownloadFinishBlock)(NSString *url, NSError *error);

@interface NBNetworkAction : NSObject

+(instancetype)shareInstance;

/*
 * POST请求
 */
-(void)POST:(NSString *)urlString
     params:(NSDictionary *)params
completedBlock:(RequestFinishBlock)completedblock;

/*
 * GET请求
 */
-(void)GET:(NSString *)urlString
    params:(NSDictionary *)params
completedBlock:(RequestFinishBlock)completedblock;

/*
 * 上传图片
 */
-(void)POST:(NSString *)urlString
     params:(NSDictionary *)params
  imageData:(NSData *)imageData
completedBlock:(RequestFinishBlock)completedblock;

/*
 * 下载文件
 */
-(void)downloadTask:(NSString *)urlString
           saveName:(NSString *)saveName
completedBlock:(DownloadFinishBlock)completedblock;

- (void)cancelTask;

@end
