//
//  NBNetworkAction.m
//  NiceIM
//
//  Created by mac on 2020/2/25.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NBNetworkAction.h"
#import "NBJSONResponseSerializer.h"
#import "ProjectConfig.h"

#define TIMEOUT 15
@interface NBNetworkAction()

@property(nonatomic, strong)NSString *vcVersionCode;

@end

@implementation NBNetworkAction

+(instancetype)shareInstance{
    static NBNetworkAction *NetworkAction;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NetworkAction = [[self alloc]init];
    });
    return NetworkAction;
}

- (NSString*)vcVersionCode{
    if (!_vcVersionCode) {
        NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [NSString stringWithFormat:@"%@",infoPlist[@"CFBundleShortVersionString"]];
        if (version.length > 5) {
            _vcVersionCode = [version substringToIndex:5];
        }
        else{
            _vcVersionCode = version?:@"";
        }
    }
    return _vcVersionCode;
}

-(AFHTTPSessionManager *)baseHtppRequest{
    static AFHTTPSessionManager *sharedAFHTTPSessionManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.HTTPMaximumConnectionsPerHost = 1;
        
        sharedAFHTTPSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        sharedAFHTTPSessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sharedAFHTTPSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        sharedAFHTTPSessionManager.responseSerializer = [NBJSONResponseSerializer serializer];
        [sharedAFHTTPSessionManager.requestSerializer setTimeoutInterval:TIMEOUT];
        sharedAFHTTPSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    });
    return sharedAFHTTPSessionManager;
}

//Post请求
-(void)POST:(NSString *)urlString params:(NSDictionary *)params completedBlock:(RequestFinishBlock)completedblock{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    NSString *urlStr = [[ProjectConfig sharedConfig].domainURL stringByAppendingString:urlString?:@""];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //设置全局参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setObject:self.vcVersionCode forKey:@"vcVersionCode"];
    [dic setObject:@"zh_CN" forKey:@"language"];
    
    NSLog(@"地址: %@\n 参数:%@",urlStr,dic);
    urlStr=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//对中文编码

    [manager POST:urlStr parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *aa = [NSString stringWithFormat:@"地址: %@\n 参数:%@ \n 返回数据:%@",urlStr,dic,responseObject];
//        kAlertShow(aa);
        if (completedblock) {
            completedblock(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completedblock) {
            completedblock(nil, error);
        }
    }];
}

-(void)GET:(NSString *)urlString params:(NSMutableDictionary *)params completedBlock:(RequestFinishBlock)completedblock{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    NSString *urlStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //设置全局参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setObject:@"iOS" forKey:@"Source"];
    
    [manager GET:urlStr parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completedblock) {
            completedblock(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completedblock) {
            completedblock(nil, error);
        }
    }];
}

//上传图片
-(void)POST:(NSString *)urlString params:(NSDictionary *)params imageData:(NSData *)imageData completedBlock:(RequestFinishBlock)completedblock{
    
//    AFHTTPSessionManager *manager = [self baseHtppRequest];
    
    //地址处理
//    NSString *urlStr=[NSString stringWithFormat:@"%@%@",kProjectName,urlString];
//    urlStr=[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//
//    NSString *dataStr=[[params yy_modelToJSONString] base64EncodeString];
//
//    //token拼写
//    NSString *timestampStr=[NSString stringWithFormat:@"%ld",time(NULL)];
//    NSString *token=[NSString stringWithFormat:@"%@%@%@%@",kVersion,timestampStr,Secret,dataStr];
//
//    //data参数加密两次; head参数加密一次
//    NSDictionary *dic=@{@"head":@{@"version":kVersion,
//                                  @"timestamp":timestampStr,
//                                  @"code":@"145158033845",
//                                  @"token":[token md5Hash]},
//                        @"data":dataStr};
//
//    NSString*paramStr=[dic yy_modelToJSONString];
//
//    NSDictionary *dic1=@{@"data":[paramStr base64EncodeString],
//                         @"fileByteData":[imageData base64EncodedStringWithOptions:0]};
//
//    [manager POST:urlStr parameters:dic1  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //先把获取的数据给转码成gbk，因为java的默认编码是gbk
//        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//
//        NSString* str = [[NSString alloc] initWithBytes:[responseObject bytes] length:[responseObject length] encoding:gbkEncoding];
//        //转化成json 字典
//        NSDictionary *dic=[self dictionaryWithJsonString:str];
//
//        if ([dic count]>0) {
//            if ([dic[@"head"][@"code"] isEqualToString:@"00"]) {
//
//                if (completedblock) {
//                    NSString *dataStr=[dic[@"data"] base64DecodeString];
//                    NSDictionary *dataDic=[self dictionaryWithJsonString:dataStr];
//                    NSString *message = dataDic[@"message"];
//                    completedblock(dataDic, message);
//                }
//            }else{
//                if (failedBlock) {
//                    failedBlock(dic[@"head"][@"info"]);
//                }
//            }
//        }else{
//            if (failedBlock) {
//                failedBlock(@"网络异常");
//            }
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failedBlock) {
//            failedBlock(@"网络超时,请求失败");
//        }
//    }];
}

//下载资源文件
-(void)downloadTask:(NSString *)urlString saveName:(NSString *)saveName completedBlock:(DownloadFinishBlock)completedblock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *document = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        return [document URLByAppendingPathComponent:saveName];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if (completedblock) {
            completedblock(filePath.absoluteString,error);
        }
    }];
    [downloadTask resume];
}

//取消请求任务
- (void)cancelTask{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    [manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}

@end
