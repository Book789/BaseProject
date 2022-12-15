//
//  Lz4Compress.m
//  Project
//
//

#import "Lz4Compress.h"

#include "lz4.h"

//#include "compression.h"

@implementation Lz4Compress

+(NSData*)compress:(NSData*)data{
        
//    return data;
    NSLog(@"src: %.2f",data.length/1024.0/1024.0);

    uint8_t *bytes = malloc(4 + LZ4_compressBound((int)data.length));
    int32_t length = LZ4_compress(data.bytes, (char *)bytes + 4, (int)data.length);
    bytes = realloc(bytes, 4 + length);
    int32_t originalLength = (int32_t)data.length;
    memcpy(bytes, &originalLength, 4);
    return [[NSData alloc] initWithBytesNoCopy:bytes length:4 + length freeWhenDone:true];

//    NSData *src = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ad.json" ofType:nil]];
//
//    NSLog(@"src: %.2f",src.length/1024.0/1024.0);
//
//    uint8_t *dstBuffer = (uint8_t *)malloc(src.length);
//    memset(dstBuffer, 0, src.length);
//
//    size_t compressResultLength = compression_encode_buffer(dstBuffer, src.length, [src bytes], src.length, NULL, COMPRESSION_LZ4);
//
//    if (compressResultLength > 0) {
//        NSData *newData = [NSData dataWithBytes:dstBuffer length:compressResultLength];
////        [newData writeToFile:@"/Users/cocoajin/Desktop/compress.json" atomically:YES];
//        NSLog(@"compressResultLength: %.2f",compressResultLength/1024.0/1024.0);
//
//        NSLog(@"com: %.2f",(src.length-compressResultLength)/(float)src.length/1024.0/1024.0);
//
//    }else{
//        NSLog(@"compress error!");
//    }
//
//    free(dstBuffer);
}
//- (void)DeCompress:(NSData*)data{
//    NSData *src = [NSData dataWithContentsOfFile:@"/Users/cocoajin/Desktop/compress.data"];
//
//    NSLog(@"src: %ld",src.length);
//    uint8_t *dstBuffer = (uint8_t *)malloc(1024*1024*10);
//    memset(dstBuffer, 0, src.length);
//
//    size_t decompressLen = compression_decode_buffer(dstBuffer,1024*1024*10,src.bytes,src.length,NULL,COMPRESSION_LZMA);
//
//    if (decompressLen > 0) {
//        NSData *newData = [NSData dataWithBytes:dstBuffer length:decompressLen];
//        [newData writeToFile:@"/Users/cocoajin/Desktop/decompress.txt" atomically:YES];
//        NSLog(@"com: %ld",decompressLen);
//
//    }else{
//        NSLog(@"decompressLen error!");
//    }
//
//    free(dstBuffer);
//}

@end
