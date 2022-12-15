//
//  MHMomentPhotosView.h
//  MHDevelopExample
//
//  Created by senba on 2017/7/7.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//  配图（多张） -- 九宫格

#import <UIKit/UIKit.h>
#import "Protocol.h"

@interface MHMomentPhotosView : UIView<MHReactiveView>

@property (nonatomic, copy) void(^photosImgClickBlock)(NSMutableArray *imageArray, NSInteger index);

@end
