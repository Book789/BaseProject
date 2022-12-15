//
//  NBJSONResponseSerializer.m
//  NiceIM
//
//  Created by mac on 2020/2/25.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NBJSONResponseSerializer.h"
//#import "NBNavigationController.h"
//#import "NBLoginViewController.h"
//#import "NBTabBarController.h"
//#import "NSObject+hkvc.h"

@interface NBJSONResponseSerializer()

@end

@implementation NBJSONResponseSerializer

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error{
    NSDictionary *responseObject = [super responseObjectForResponse:response data:data error:error];
    NSLog(@"%@",responseObject);
    
    if (responseObject == nil || [responseObject isKindOfClass:[NSNull class]]) {
        *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:404 userInfo:@{NSLocalizedDescriptionKey:@"Not Found"}];
        return nil;
    }
    
    if ([responseObject[@"status"] integerValue] == 500) {
        *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:500 userInfo:@{NSLocalizedDescriptionKey:@"服务器连接错误"}];
        return nil;
    }
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        if ([responseObject.allKeys containsObject:@"code"]) {
            NSString *codeValue = [responseObject[@"code"] description];
            //短信验证码处 特殊处理
//            if (![codeValue isEqualToString:ApiRequestSuccess] &&
//                ![codeValue isEqualToString:@"0300043"] &&
//                ![codeValue isEqualToString:@"0300071"] &&
//                ![codeValue isEqualToString:ApiNotRegisteredError] &&
//                ![codeValue isEqualToString:ApiVerificationImageCodeError]) {
//
//                NSString *msg = responseObject[@"msg"];
//                if ([codeValue isEqualToString:ApiAccountFreeze]) {
//                    //账号冻结
//                    NSDictionary *dic = responseObject[@"data"];
//                    if ([dic isKindOfClass:[NSDictionary class]] && dic.count) {
//                        NSString *reason = dic[@"congealReason"] ?: NBLocalizedStringFromTable(@"grsjwg");
//                        NSInteger timeLength = [dic[@"congealTime"] integerValue];
//                        if (timeLength <= 0){
//                            msg = [NSString stringWithFormat:@"\n%@%@，%@",NBLocalizedStringFromTable(@"grzywn"),reason,NBLocalizedStringFromTable(@"grzhbyjdj")];
//                        }
//                        else{
//                            NSString *timeStr = [NSString stringWithFormat:@"%@%ld%@，",NBLocalizedStringFromTable(@"grzhbdj"),(long)timeLength,NBLocalizedStringFromTable(@"hour")];
//                            NSString *endTime = [dic[@"createTime"] utcTimeStrTransformLocTimeStr:@"yyyy-MM-dd HH:mm:ss" pastTime:timeLength];
//                            msg = [NSString stringWithFormat:@"\n%@%@，%@%@%@",NBLocalizedStringFromTable(@"grzywn"),reason,timeStr,NBLocalizedStringFromTable(@"gryjjfsj"),endTime];
//                        }
//                    }
//                }
//                else if ([codeValue isEqualToString:ApiAccountNotLogin]) {
//                    //登录失效提醒
//                    msg = @""; //设置为空只用UIAlertController提示
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        [self nb_alertForaccountNotLogin];
//                    });
//                }
                
//                *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:200 userInfo:@{NSLocalizedDescriptionKey:msg,NSLocalizedFailureReasonErrorKey:codeValue}];
//            }
        }
    }
    
    return responseObject;
}

- (void)nb_alertForaccountNotLogin{
//    NBUserInfoModel *infoModel = [[NBUserInfoLocal shareUserInfo] getLoginUserInfoModel];
//    if (infoModel.userId.length == 0 || infoModel.wyToken.length == 0){
//        return;
//    }
//
//    UIViewController *currentController = self.hk_currentViewController;
//    if ([currentController isKindOfClass:[UIAlertController class]]) {
//        return;
//    }
    
    NSString *title = @"您的账号登录已失效，请重新登录";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:title];
    [alertTitleStr addAttribute:NSForegroundColorAttributeName value:[UIColor mainTextColor] range:NSMakeRange(0, title.length)];
    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, title.length)];
    [alert setValue:alertTitleStr forKey:@"attributedTitle"];
    
//    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"马上登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [[[NIMSDK sharedSDK] loginManager] logout:nil];
//        [[NBUserInfoLocal shareUserInfo] removeLocalUserInfo];
//        NSDictionary *params = @{@"client":@"IOS",@"facility":[NSString iphoneType],@"loginDevictType":@"APP"};
//        [[NBNetworkAction shareInstance] POST:LogoutURL params:params completedBlock:^(id result, NSError *error) {}];
//
//        NBTabBarController *tabbar = [NBTabBarController instance];
//        NBNavigationController *nav = [[NBNavigationController alloc]initWithRootViewController:[NBLoginViewController new]];
//        nav.hideNavBottomLine = YES;
//        [tabbar presentViewController:nav animated:YES completion:nil];
//        [tabbar nb_selectHomePage:YES];
//
//        //pop到根视图
//        NBNavigationController *selectedNav = tabbar.selectedViewController;
//        [selectedNav popToRootViewControllerAnimated:NO];
//    }];
//    [sureAction setValue:[UIColor themeRedColor] forKey:@"_titleTextColor"];
//    [alert addAction:sureAction];
//    [currentController presentViewController:alert animated:YES completion:nil];
}

@end
