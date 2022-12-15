//
//  LHEmptyView.h
//  BaseProject
//
//  Created by dc on 2022/3/24.
//  Copyright © 2022 nanfeng. All rights reserved.
//

typedef NS_ENUM(NSUInteger, LHEmptyViewState) {
    ///隐藏
    LHEmptyViewStateHidden           = 0,

    ///加载中 ...
    LHEmptyViewStateLoading,
    
    ///点击重试
    LHEmptyViewStateRetry,
    
    ///无数据
    LHEmptyViewStateNoResult,
    
//    ///用户还没有收藏数据
//    FMCaptionViewStateNoUserData,
//
//    ///用户还没有收藏数据并需要动作
//    FMCaptionViewStateNoUserDataAndAction,
//
//    ///用户还没有粉丝数据
//    FMCaptionViewStateNoFansDataAndAction,
};

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHEmptyView : UIView


+ (instancetype)addToView:(UIView *)view;

+ (instancetype)addToView:(UIView *)view show:(BOOL)show;

+ (instancetype)captionFromView:(UIView *)view;

+ (void)fm_setEmptyViewClass:(Class)emptyViewClass;

+ (BOOL)removeFromView:(UIView *)view;

/**
 *  @brief 修改状态
 */
@property(assign,nonatomic) LHEmptyViewState state;


@property(strong,nonatomic)UIImageView* imageView;
@property(strong,nonatomic)UILabel* titleLabel;
@property(strong,nonatomic)UIButton* button;

@property(copy, nonatomic) void(^retryBlock)(void);

@end

NS_ASSUME_NONNULL_END
