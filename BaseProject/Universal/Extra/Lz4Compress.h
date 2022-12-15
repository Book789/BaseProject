//
//  Lz4Compress.h
//  Project
//
//
// 支持对文件压缩 不支持图片 压缩过的文件压缩
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Lz4Compress : NSObject

+(NSData*)compress:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
