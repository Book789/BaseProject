//
//  UIView+FM_Toast.m
//  MeiMei
//
//  Created by admin on 15/11/26.
//  Copyright (c) 2015年 FM. All rights reserved.
//
#define FMCOLOR_HEXAndAlpha(rgbValue,alfa) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alfa]

#import "UIView+FMToast.h"
#import <MBProgressHUD.h>
#import "UIWindow+FMPublic.h"
#import "YYCategories.h"

@implementation NSObject(FMToast)
-(UIView*)fm_hudInView
{
    UIView* inView = nil;
    if([self isKindOfClass:[UIViewController class]])
    {
        inView = ((UIViewController*)self).view;
    }
    else if([self isKindOfClass:[UIView class]])
    {
        inView = (id)self;
    }
    else
    {
        inView = [UIWindow fm_getShowTopWindow];
    }
    return inView;
}
-(void)fm_showLoadingHUD
{
    [self fm_showLoadingHUDWithText:nil];
}
-(void)fm_showLoadingHUDWithText:(NSString *)text,...
{
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    
    UIView* hudInView = [self fm_hudInView];
    
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
//    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color= FMCOLOR_HEXAndAlpha(0x1c232c, 0.4);//MHColor_Theme_Color;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
        
        hud.detailsLabel.font = [UIFont systemFontOfSize:16];
        hud.margin = 16;
        hud.bezelView.layer.cornerRadius = 8;
        hud.detailsLabel.text = text;
        hud.detailsLabel.textColor = [UIColor whiteColor];
    }
}

-(void)fm_showLoadingHUDWithClickBlock:(FMBlock)clickBlock
{
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    
    UIView* hudInView = [self fm_hudInView];
    
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
    
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7]; //
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (clickBlock) {
            clickBlock();
        }
    }];
    [hud addGestureRecognizer:tap];
}

-(void)fm_hideHUD
{
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    
    UIView* hudInView = [self fm_hudInView];
    [MBProgressHUD hideHUDForView:hudInView animated:NO];
}

- (void)fm_showProgress:(CGFloat)progress{
    

    MBProgressHUD *hud = [MBProgressHUD HUDForView:[self fm_hudInView]];
    
    if (hud) {
        hud.mode = MBProgressHUDModeDeterminate;
        hud.progress = progress;
        hud.label.text = [NSString stringWithFormat:@"%.2f%%",progress*100];
    }else{
       hud = [MBProgressHUD showHUDAddedTo: [self fm_hudInView] animated:YES];
        hud.progress = progress;
        hud.label.text = [NSString stringWithFormat:@"%.2f%%",progress*100];
    }
}

-(void)fm_showTextHUD:(NSString *)text,...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [self fm_showTextHUDWithDelay:0 view:nil text:text];
}
-(void)fm_showTextHUDWithDelay:(CGFloat)delay text:(NSString *)text, ...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [self fm_showTextHUDWithDelay:delay view:nil text:text];
}
-(void)fm_showTextHUDWithDelay:(CGFloat)delay image:(UIImage *)image text:(NSString *)text, ...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    UIImageView* imageView = nil;
    if(image)
    {
        imageView = [[UIImageView alloc] initWithImage:image];
    }
    [self fm_showTextHUDWithDelay:delay view:imageView text:text];
}
-(void)fm_showTextHUDWithDelay:(CGFloat)delay view:(UIView *)view text:(NSString *)text, ...
{
    if(view == nil && text.length == 0)
    {
        return;
    }
    
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    
    if ([NSThread isMainThread] == NO)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self fm_showTextHUDWithDelay:delay view:view text:text];
        });
        return;
    }
    
    UIView* hudInView = [self fm_hudInView];
    
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
//    hud.yOffset=0;
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color=FMCOLOR_HEXAndAlpha(0x1c232c, 0.8);//MHColor_Theme_Color;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    if(text.length)
    {
        hud.detailsLabel.font = [UIFont systemFontOfSize:16];
        hud.margin = 16;
        hud.bezelView.layer.cornerRadius = 8;
        hud.detailsLabel.text = text;
        hud.detailsLabel.textColor = [UIColor whiteColor];
    }
    if(view)
    {
        hud.customView = view;
        hud.mode = MBProgressHUDModeCustomView;
    }
    hud.userInteractionEnabled = NO;
    
    float duration = 1;
    if(delay > 0)
    {
        duration = delay;
    }
    else
    {
        duration = (float)text.length*0.08 + 0.3;
        duration = MIN(3, MAX(1, duration));
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (hud.superview)
        {
            hud.removeFromSuperViewOnHide = YES;
            [hud hideAnimated:YES];
        }
    });
}

+(void)fm_showLoadingHUD
{
    [[UIWindow fm_getShowTopWindow] fm_showLoadingHUD];
}
+(void)fm_showLoadingHUDWithText:(NSString *)text,...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [[UIWindow fm_getShowTopWindow] fm_showLoadingHUDWithText:text];
}

+(void)fm_showLoadingHUDWithClickBlock:(FMBlock)clickBlock
{
    [[UIWindow fm_getShowTopWindow] fm_showLoadingHUDWithClickBlock:clickBlock];
}

+(void)fm_hideHUD
{
    
    [[UIWindow fm_getShowTopWindow] fm_hideHUD];
}
+(void)fm_showTextHUD:(id)text,...
{
    NSString *tempText;
    if([text isKindOfClass:[NSDictionary class]])
    {
        tempText = text[@"msg"];
    }
    else
    {
        tempText = text;
    }
    
    if(tempText.length)
    {
        va_list list;
        va_start(list, tempText);
        text = [[NSString alloc]initWithFormat:tempText arguments:list];
        va_end(list);
    }
    [[UIWindow fm_getShowTopWindow] fm_showTextHUDWithDelay:0 view:nil text:tempText];
}
+(void)fm_showTextHUDWithDelay:(CGFloat)delay text:(NSString *)text, ...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [[UIWindow fm_getShowTopWindow] fm_showTextHUDWithDelay:delay view:nil text:text];
}
+(void)fm_showTextHUDWithDelay:(CGFloat)delay image:(UIImage *)image text:(NSString *)text, ...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    UIImageView* imageView = nil;
    if(image)
    {
        imageView = [[UIImageView alloc] initWithImage:image];
    }
    [[UIWindow fm_getShowTopWindow] fm_showTextHUDWithDelay:delay view:imageView text:text];
}
+(void)fm_showTextHUDWithDelay:(CGFloat)delay view:(UIView *)view text:(NSString *)text, ...
{
    if(text.length)
    {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [[UIWindow fm_getShowTopWindow] fm_showTextHUDWithDelay:delay view:view text:text];
}
@end

@implementation UIView (FMToast)

@end

@implementation UIViewController(FMToast)

@end
