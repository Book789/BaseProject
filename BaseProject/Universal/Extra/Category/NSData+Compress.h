//
//  NSData+Compress.h
//  BaseProject
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Compress)

/**
 iOS 系统自带压缩
 */
- (NSData *)compress;
- (NSData *)decompress;


- (NSData *)compressGZip;
- (NSData *)decompressGZip;


- (NSData *)compressLZ4;
- (NSData *)decompressLZ4;

@end

NS_ASSUME_NONNULL_END
