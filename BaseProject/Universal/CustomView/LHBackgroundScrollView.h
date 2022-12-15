//
//  LHBackgroundScrollView.h
//  Project
//
//  Created by a on 2022/5/26.
//
//一张图背景无限

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHBackgroundScrollView : UIView

@property (nonatomic, strong) UIImage *image;


-(void)startAnimation;

-(void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
