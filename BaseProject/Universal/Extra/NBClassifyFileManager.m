//
//  NBClassifyFileManager.m
//  NiceIM
//
//  Created by mac on 2020/5/9.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NBClassifyFileManager.h"

@implementation NBClassifyFileManager

+(NSDictionary *)readClassifyDicWithPath:(NSString *)path{
    NSData *fileData = [self readClassifyFileWithPath:path];
    NSDictionary *dic;
    if (fileData) {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:fileData];
        dic = [unarchiver decodeObjectForKey:@"ClassifyData"];
        [unarchiver finishDecoding];
    }
    return dic;
}

+(void)writeToFileWithDic:(NSDictionary *)responseDic andFilePath:(NSString *)path{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:responseDic forKey:@"ClassifyData"];
    [archiver finishEncoding];
    [self writeToFileWithData:data andFilePath:path];
}

+(NSArray *)readArrayWithPath:(NSString *)path{
    NSData *fileData=[self readClassifyFileWithPath:path];
    NSArray *dataArr;
    if (fileData) {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:fileData];
        dataArr = [unarchiver decodeObjectForKey:@"ClassifyData"];
        [unarchiver finishDecoding];
    }
    return dataArr;
}

+(void)writeToFileWithArray:(NSArray *)arr andFilePath:(NSString *)path{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:arr forKey:@"ClassifyData"];
    [archiver finishEncoding];
    [self writeToFileWithData:data andFilePath:path];
}

+(NSString *)readStringWithPath:(NSString *)path{
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content ?: @"";
}

+(void)writeToFileWithString:(NSString *)string andFilePath:(NSString *)path{
    [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

+(NSData *)readClassifyFileWithPath:(NSString *)path{
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    return fileData;
}

+(void)writeToFileWithData:(NSData *)tempData andFilePath:(NSString *)path{
    NSFileManager *fm = [NSFileManager defaultManager];
    //定义一个布尔类型的对象
    BOOL ifsucess = NO;
    //获取上面fileData对象中通过NSFileManager对象获取的文件中的内容，然后再创建一个新的路径，并存储
    ifsucess = [fm createFileAtPath:path contents:tempData attributes:nil];
    
    //对布尔型对象进行判断
    if(ifsucess){
        NSLog(@"文件 create file sucess");
    }
    else{
        NSLog(@"文件 create file failed");
    }
}

@end
