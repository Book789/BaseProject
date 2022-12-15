//
//  UIImage+NB.m
//  NiceIM
//
//  Created by mac on 2020/3/13.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIImage+NB.h"
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVTime.h>

@implementation UIImage (NB)

// 获取视频第一帧
+ (UIImage *)getVideoPreViewImage:(NSURL *)path{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

//生成指定尺寸大小二维码
+(UIImage *)qrCodeImageWithContent:(NSString *)content codeImageSize:(CGFloat)size{
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    [qrFilter setValue:contentData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *image = qrFilter.outputImage;
    
    CGRect integralRect = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(integralRect), size/CGRectGetHeight(integralRect));
    
    size_t width = CGRectGetWidth(integralRect)*scale;
    size_t height = CGRectGetHeight(integralRect)*scale;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:integralRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, integralRect, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (NSArray *)imageThemeColor:(UIImage *)image scale:(CGFloat)scale{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    if (scale <= 0.1) {
        scale = 0.1;
    }else if(scale >= 1){
        scale = 1;
    }
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake([image size].width * scale, [image size].height * scale);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);

    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);

    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);

    if (data == NULL){
        CGContextRelease(context);
        return nil;
    }
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];

  
    for (int x=0; x<thumbSize.height; x++) {
        for (int y=0; y<thumbSize.width; y++) {
            int offset = 4*(x*thumbSize.width + y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];

            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
        }
    }
    CGContextRelease(context);

    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;

    while ( (curColor = [enumerator nextObject]) != nil){
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
    }
    //返回三原色色值
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
//    [dic setValue:@([MaxColor[0] intValue]/255.0f) forKey:@"red"];
//    [dic setValue:@([MaxColor[1] intValue]/255.0f) forKey:@"green"];
//    [dic setValue:@([MaxColor[2] intValue]/255.0f) forKey:@"blue"];
    return @[@([MaxColor[0] intValue]/255.0f),@([MaxColor[1] intValue]/255.0f),@([MaxColor[2] intValue]/255.0f)];
}

//绘制图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size text:(NSString *)text textAttributes:(NSDictionary *)textAttributes circular:(BOOL)isCircular{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // circular
    if (isCircular) {
        CGPathRef path = CGPathCreateWithEllipseInRect(rect, NULL);
        CGContextAddPath(context, path);
        CGContextClip(context);
        CGPathRelease(path);
    }
    
    //color
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    //text
    CGSize textSize = [text sizeWithAttributes:textAttributes];
    [text drawInRect:CGRectMake((size.width - textSize.width) / 2, (size.height - textSize.height) / 2, textSize.width, textSize.height) withAttributes:textAttributes];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/// 根据用户ID 显示名生成图片
+ (UIImage *)imageWidthUserID:(NSString*)userID showName:(NSString*)showName{
    NSInteger num = [userID longLongValue]%5;
     UIColor *color;
     switch (num) {
         case 0:
             color = kColorWithHex(0xf27aa2);
             break;
         case 1:
             color = kColorWithHex(0xe5cd65);
             break;
         case 2:
             color = kColorWithHex(0xe6705b);
             break;
         case 3:
             color = kColorWithHex(0x57d0e7);
             break;
         default:
             color = kColorWithHex(0x86da55);
             break;
     }
    
    NSString *friStchar = showName;
    if (showName.length > 2) {
        friStchar = [showName substringToIndex:2];
    }
    if ([friStchar checkIsContainChinese]) {
        friStchar = [showName substringToIndex:1];
    }
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                          NSFontAttributeName:kMainBoldFontSize(60)};
    UIImage *icon = [self imageWithColor:color size:CGSizeMake(150, 150) text:friStchar textAttributes:dic circular:YES];
    return icon;
}


- (UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor{
    if (!self) return nil;
    
    CGSize size = CGSizeMake(self.size.width+2*borderW, self.size.height+2*borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //2.绘制大圆,显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];

    //绘制一个小圆,把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, self.size.width, self.size.height)];
    [clipPath addClip];
    [self drawAtPoint:CGPointMake(borderW, borderW)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/// 群成员头像生成群头像
+ (UIImage *)groupIconWithURLArray:(NSArray *)URLArray bgColor:(UIColor *)bgColor;{
    UIImageView *imageView = [[UIImageView alloc] init];
    NSMutableArray *imageArray = [NSMutableArray array];
    NSLog(@"112");
    for (int i = 0; i<URLArray.count;  i++) {
        NSData * data = [[NSData alloc]initWithContentsOfURL:URLArray[i]];
        UIImage *image = [[UIImage alloc]initWithData:data];
        [imageArray addObject:image];
    }
    NSLog(@"55552");
    imageView.image = [UIImage groupIconWith:imageArray bgColor:[UIColor groupTableViewBackgroundColor]];
    return imageView.image;
}

/// 群成员头像生成群头像
+ (UIImage *)groupIconWith:(NSArray *)array bgColor:(UIColor *)bgColor {
    CGSize finalSize = CGSizeMake(100, 100);
    CGRect rect = CGRectZero;
    rect.size = finalSize;

    UIGraphicsBeginImageContext(finalSize);
    if (bgColor) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, bgColor.CGColor);
        CGContextSetFillColorWithColor(context, bgColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, 100);
        CGContextAddLineToPoint(context, 100, 100);
        CGContextAddLineToPoint(context, 100, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke);
    }

    if (array.count >= 2) {
        NSArray *rects = [self eachRectInGroupWithCount2:array.count];
        int count = 0;
        for (id obj in array) {
            if (count > rects.count-1) {
                break;
            }

            UIImage *image;
            if ([obj isKindOfClass:[NSString class]]) {
                image = [UIImage imageNamed:(NSString *)obj];
            } else if ([obj isKindOfClass:[UIImage class]]){
                image = (UIImage *)obj;
            } else {
                NSLog(@"%s Unrecognizable class type", __FUNCTION__);
                break;
            }

            CGRect rect = CGRectFromString([rects objectAtIndex:count]);
            [image drawInRect:rect];
            count++;
        }
    }
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (NSArray *)eachRectInGroupWithCount:(NSInteger)count {
    NSArray *rects = nil;
    CGFloat sizeValue = 100;
    CGFloat padding = 8;
    
    CGFloat eachWidth = (sizeValue - padding*3) / 2;
    CGRect rect1 = CGRectMake(sizeValue/2 - eachWidth/2, padding, eachWidth, eachWidth);
    CGRect rect2 = CGRectMake(padding, padding*2 + eachWidth, eachWidth, eachWidth);
    CGRect rect3 = CGRectMake(padding*2 + eachWidth, padding*2 + eachWidth, eachWidth, eachWidth);
    if (count == 3) {
        rects = @[NSStringFromCGRect(rect1), NSStringFromCGRect(rect2), NSStringFromCGRect(rect3)];
    } else if (count == 4) {
        CGRect rect0 = CGRectMake(padding, padding, eachWidth, eachWidth);
        rect1 = CGRectMake(padding*2, padding, eachWidth, eachWidth);
        rects = @[NSStringFromCGRect(rect0), NSStringFromCGRect(rect1), NSStringFromCGRect(rect2), NSStringFromCGRect(rect3)];
    }
    
    return rects;
}

+ (NSArray *)eachRectInGroupWithCount2:(NSInteger)count {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:count];
    CGFloat sizeValue = 100;
    CGFloat padding = 10;
    CGFloat eachWidth;
    
    if (count <= 4) {
        eachWidth = (sizeValue - padding*3) / 2;
        [self getRects:array padding:padding width:eachWidth count:4];
    } else {
        padding = padding / 2;
        eachWidth = (sizeValue - padding*4) / 3;
        [self getRects:array padding:padding width:eachWidth count:9];
    }

    if (count < 4) {
        [array removeObjectAtIndex:0];
        CGRect rect = CGRectFromString([array objectAtIndex:0]);
        rect.origin.x = (sizeValue - eachWidth) / 2;
        [array replaceObjectAtIndex:0 withObject:NSStringFromCGRect(rect)];
        if (count == 2) {
            [array removeObjectAtIndex:0];
            NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:2];
            
            for (NSString *rectStr in array) {
                CGRect rect = CGRectFromString(rectStr);
                rect.origin.y -= (padding+eachWidth)/2;
                [tempArray addObject:NSStringFromCGRect(rect)];
            }
            [array removeAllObjects];
            [array addObjectsFromArray:tempArray];
        }
    } else if (count != 4 && count <= 6) {
        [array removeObjectsInRange:NSMakeRange(0, 3)];
        NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:6];

        for (NSString *rectStr in array) {
            CGRect rect = CGRectFromString(rectStr);
            rect.origin.y -= (padding+eachWidth)/2;
            [tempArray addObject:NSStringFromCGRect(rect)];
        }
        [array removeAllObjects];
        [array addObjectsFromArray:tempArray];
        
        if (count == 5) {
            [tempArray removeAllObjects];
            [array removeObjectAtIndex:0];
            
            for (int i=0; i<2; i++) {
                CGRect rect = CGRectFromString([array objectAtIndex:i]);
                rect.origin.x -= (padding+eachWidth)/2;
                [tempArray addObject:NSStringFromCGRect(rect)];
            }
            [array replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:tempArray];
        }
        
    } else if (count != 4 && count < 9) {
        if (count == 8) {
            [array removeObjectAtIndex:0];
            NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:2];
            for (int i=0; i<2; i++) {
                CGRect rect = CGRectFromString([array objectAtIndex:i]);
                rect.origin.x -= (padding+eachWidth)/2;
                [tempArray addObject:NSStringFromCGRect(rect)];
            }
            [array replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:tempArray];
        } else {
            [array removeObjectAtIndex:2];
            [array removeObjectAtIndex:0];
        }
    }

    return array;
}

+ (void)getRects:(NSMutableArray *)array padding:(CGFloat)padding width:(CGFloat)eachWidth count:(int)count {

    for (int i=0; i<count; i++) {
        int sqrtInt = (int)sqrt(count);
        int line = i%sqrtInt;
        int row = i/sqrtInt;
        CGRect rect = CGRectMake(padding * (line+1) + eachWidth * line, padding * (row+1) + eachWidth * row, eachWidth, eachWidth);
        [array addObject:NSStringFromCGRect(rect)];
    }
}

+ (UIImage *)gradientImageWithColors:(NSArray *)colors rect:(CGRect)rect{
    if (!colors.count || CGRectEqualToRect(rect, CGRectZero)) {
        return nil;
    }

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = rect;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    NSMutableArray *mutColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = [NSArray arrayWithArray:mutColors];

    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.opaque, 0);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}
+ (UIImage *)colorAsImageWithColor:(UIColor *)color size:(CGSize)size{
        
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
