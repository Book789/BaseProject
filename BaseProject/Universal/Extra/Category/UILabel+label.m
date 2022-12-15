//
//  UILabel+label.m
//  BaseProject
//
//  Created by nanfeng on 2017/3/18.
//  Copyright © 2017年 nanfeng. All rights reserved.
//

#import "UILabel+label.h"

@implementation UILabel (label)
+(UILabel*)labelWithFrame:(CGRect)frame withBackgroudColor:(UIColor*)backgroudColor;
{
    return [UILabel labelWithFrame:frame withBackgroudColor:backgroudColor textColor:[UIColor clearColor] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentLeft text:@""];
}
+(UILabel*)labelWithFrame:(CGRect)frame textColor:(UIColor*)textColor font:(UIFont*)font textAlignment:(NSTextAlignment)textAlignment
{
    return [UILabel labelWithFrame:frame withBackgroudColor:[UIColor clearColor] textColor:textColor font:font textAlignment:textAlignment text:@""];
}

+(UILabel*)labelWithFrame:(CGRect)frame textColor:(UIColor*)textColor font:(UIFont*)font  textAlignment:(NSTextAlignment)textAlignment  text:(NSString*)text
{
    return [UILabel labelWithFrame:frame withBackgroudColor:[UIColor clearColor] textColor:textColor font:font textAlignment:textAlignment text:text];
}

+(UILabel*)labelWithFrame:(CGRect)frame withBackgroudColor:(UIColor*)backgroudColor textColor:(UIColor*)textColor font:(UIFont*)font textAlignment:(NSTextAlignment)textAlignment  text:(NSString*)text
{
    UILabel * label =[[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backgroudColor;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.text = text;
    return label;
}
@end
