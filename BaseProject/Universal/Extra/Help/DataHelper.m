//
//  DataHelper.m
//  仿微信选择联系人列表
//
//  Created by yongda on 2017/12/28.
//  Copyright © 2017年 TangyuanLiu. All rights reserved.
//

#import "DataHelper.h"
#import "LHUserModel.h"
#import <UIKit/UIKit.h>

@implementation DataHelper

/**
 联系人数组排序
 
 @param array 原始联系人数组数据
 @return 排序后的联系人数组
 */
+ (NSMutableArray *) getContactListDataBy:(NSMutableArray *)array{
    
    NSMutableArray *ans = [[NSMutableArray alloc] init];
    
    NSArray *serializeArray = [(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {//排序
        int i;
        NSString *strA = [DataHelper transformCharacter:((LHUserModel *)obj1).nickname];
        NSString *strB =  [DataHelper transformCharacter:((LHUserModel *)obj2).nickname];
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;//上升
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;//下降
            }
        }
        
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }else{
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    char lastC = '1';
    NSMutableArray *data;
    NSMutableArray *oth = [[NSMutableArray alloc] init];
    for (LHUserModel * model in serializeArray) {
        if ([DataHelper transformCharacter:model.nickname].length==0) {
            [oth addObject:model];
            continue;
        }
        char c = [[DataHelper transformCharacter:model.nickname] characterAtIndex:0];
        if (!isalpha(c)) {
            [oth addObject:model];
        }
        else if (c != lastC){
            lastC = c;
            if (data && data.count > 0) {
                [ans addObject:data];
            }
            
            data = [[NSMutableArray alloc] init];
            [data addObject:model];
        }
        else {
            [data addObject:model];
        }
    }
    if (data && data.count > 0) {
        [ans addObject:data];
    }
    if (oth.count > 0) {
        [ans addObject:oth];
    }
    return ans;
}


/**
 获取分区数(姓氏首字母)

 @param array 排序后的联系人数组
 @return [A,B,C,D.....]
 */
+ (NSMutableArray *)getContactListSectionBy:(NSMutableArray *)array {
    
    NSMutableArray *section = [[NSMutableArray alloc] init];
//    [section addObject:UITableViewIndexSearch]; // 索引栏最上方的搜索icon
    for (NSArray *item in array) {
        LHUserModel *model = [item objectAtIndex:0];
        if ([DataHelper transformCharacter:model.nickname].length>0) {
            char c = [[DataHelper transformCharacter:model.nickname] characterAtIndex:0];
            if (!isalpha(c)) {
                c = '#';
            }
            [section addObject:[NSString stringWithFormat:@"%c", toupper(c)]];
        }else{
            //此处处理带空格的昵称
            [section addObject:[NSString stringWithFormat:@"%c", toupper( '#')]];
        }
    }
    return section;
}

+ (NSString *)transformCharacter:(NSString * )chinese {
    
    NSString  * pinYinStr = [NSString string];
    if (chinese.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:chinese];
        //1.先转换为带声调的拼音
        if(CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"带声调的pinyin: %@", pinYin);
        }
       //2.再转换为不带声调的拼音
       if (CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformStripDiacritics, NO)) {
           NSLog(@"不带声调的pinyin: %@", pinYin);
       }
       //3.去除掉首尾的空白字符和换行字符
       pinYinStr = [pinYin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
       //4.去除掉其它位置的空白字符和换行字符
       pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
       pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
       pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
       NSLog(@"去掉空白字符和换行字符的pinyin: %@", pinYinStr);
       [pinYinStr capitalizedString];
   }
   return pinYinStr;
}


@end
