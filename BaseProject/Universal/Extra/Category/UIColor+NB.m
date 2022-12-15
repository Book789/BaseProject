//
//  UIColor+NB.m
//  NiceIM
//
//  Created by 顺溜 on 2020/7/21.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIColor+NB.h"

@implementation UIColor (NB)

+ (UIColor*)nbWhiteColor{
    return [UIColor styleLightColor:[UIColor whiteColor] styleDarkColor:[UIColor blackColor]];
}

+ (UIColor*)backgroundColor{
    return [UIColor styleLightColor:kColorWithHex(0xF4F4F4) styleDarkColor:[UIColor redColor]];
}

+ (UIColor*)themeRedColor{
    return [UIColor styleLightColor:kColorWithHex(0xFC0338) styleDarkColor:kColorWithHex(0xFC0338)];
}

+ (UIColor*)mainTextColor{
    return [UIColor styleLightColor:kColorWithHex(0x333333) styleDarkColor:kColorWithHex(0x333333)];
}

+ (UIColor*)midTextColor{
    return [UIColor styleLightColor:kColorWithHex(0x666666) styleDarkColor:kColorWithHex(0x666666)];
}

+ (UIColor*)subTextColor{
    return [UIColor styleLightColor:kColorWithHex(0x999999) styleDarkColor:kColorWithHex(0x999999)];
}
+ (UIColor*)separatorColor{
    return [UIColor styleLightColor:kColorWithHex(0xE5E5E5) styleDarkColor:kColorWithHex(0x9a9ba7)];
}
+ (UIColor*)spcialBackgroundColor{
    return [UIColor styleLightColor:kColorWithHex(0xBBBBBB) styleDarkColor:kColorWithHex(0xBBBBBB)];
}
+ (UIColor*)spcialRedBackgroundColor{
    return [UIColor styleLightColor:kColorWithHex(0xFECCD6) styleDarkColor:kColorWithHex(0xFECCD6)];
}

+ (UIColor*)styleLightColor:(UIColor*)lightColor styleDarkColor:(UIColor*)darkColor{
    UIColor *color = lightColor;
    if (@available(iOS 13.0, *)) {
        color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            }
            return lightColor;
        }];
    }
    return color;
}

+ (UIColor *)startColor:(UIColor*)startColor endColor:(UIColor *)endColor ratio:(CGFloat)ratio{
    if(ratio > 1) ratio = 1;
    const CGFloat *components1 = CGColorGetComponents(startColor.CGColor);
    const CGFloat *components2 = CGColorGetComponents(endColor.CGColor);
    CGFloat r = components1[0]*ratio + components2[0]*(1-ratio);
    CGFloat g = components1[1]*ratio + components2[1]*(1-ratio);
    CGFloat b = components1[2]*ratio + components2[2]*(1-ratio);
        return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
