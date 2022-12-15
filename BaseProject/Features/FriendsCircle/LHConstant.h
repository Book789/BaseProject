//
//  LHConstant.h
//  Project
//
//  Created by a on 2022/4/27.
//
// 朋友圈常量配置

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




/// 链接key
FOUNDATION_EXTERN NSString * const LHMomentLinkUrlKey;
/// 电话号码key
FOUNDATION_EXTERN NSString * const LHMomentPhoneNumberKey;
/// 位置key
FOUNDATION_EXTERN NSString * const LHMomentLocationNameKey;

/// 用户信息key
FOUNDATION_EXTERN NSString * const LHMomentUserInfoKey;


/// 点击文字高亮的颜色
#define MHMomentTextHighlightBackgroundColor kColorWithHex(0xC7C7C7)
/// 微信昵称字体颜色
#define MHMomentScreenNameTextColor kColorWithHex(0x5B6A92)
/// 微信正文（链接、电话）的颜色
#define MHMomentContentUrlTextColor kColorWithHex(0x4380D1)
/// 微信正文字体颜色
#define MHMomentContentTextColor WXGlobalBlackTextColor
/// 微信时间颜色
#define MHMomentCreatedAtTextColor kColorWithHex(0x737373)


/// 全局黑色字体
#define WXGlobalBlackTextColor     kColorWithHex(0x000000)


/**
 用户头像的大小 44x44
 */
FOUNDATION_EXTERN CGFloat const LHMomentAvatarWH;

/// 微信正文内容的显示最大行数（PS：如果超过最大值，那么正文内容就单行显示，可以点击正文内容查看全部内容）
FOUNDATION_EXTERN NSUInteger const LHMomentContentTextMaxCriticalRow;


/**
 说说内容距离左右屏幕的间距 20
 */
FOUNDATION_EXTERN CGFloat const LHMomentContentLeftOrRightInset;

/**
 内容（控件）之间的的间距 10
 */
FOUNDATION_EXTERN CGFloat const LHMomentContentInnerMargin;

/// 全文、收起W
FOUNDATION_EXTERN CGFloat const MHMomentExpandButtonWidth ;
/// 全文、收起H
FOUNDATION_EXTERN CGFloat const MHMomentExpandButtonHeight ;

/// 更多按钮宽高 (实际：25x25)
FOUNDATION_EXTERN CGFloat const LHMomentOperationMoreBtnWH ;

/// videoView高度
FOUNDATION_EXTERN CGFloat const LHMomentVideoViewHeight ;
/// videoView宽度
FOUNDATION_EXTERN CGFloat const LHMomentVideoViewWidth ;


/// 向上箭头W
FOUNDATION_EXTERN CGFloat const LHMomentUpArrowViewWidth ;
/// 向上箭头H
FOUNDATION_EXTERN CGFloat const LHMomentUpArrowViewHeight ;

/// pictureView中图片之间的的间距 6
FOUNDATION_EXTERN CGFloat const MHMomentPhotosViewItemInnerMargin;
/// pictureView中图片的大小 86x86 (屏幕尺寸>320)
FOUNDATION_EXTERN CGFloat const MHMomentPhotosViewItemWH1;
/// pictureView中图片的大小 70x70 (屏幕尺寸<=320)
FOUNDATION_EXTERN CGFloat const MHMomentPhotosViewItemWH2;


// 计算微信说说正文的limitWidth或者评论View的宽度
static inline CGFloat LHMomentCommentViewWidth() {
    return ([UIScreen mainScreen].bounds.size.width - LHMomentContentLeftOrRightInset*2 -LHMomentAvatarWH - LHMomentContentInnerMargin);
}

/// 图片的宽度 （九宫格）
static inline CGFloat LHMomentPhotosViewItemWidth(){
    CGFloat itemW = ([UIScreen mainScreen].bounds.size.width<=320)? MHMomentPhotosViewItemWH2:MHMomentPhotosViewItemWH1;
    return itemW;
}


/// 单张图片的最大宽度（方形or等比例）
static inline CGFloat LHMomentPhotosViewSingleItemMaxWidth(){
    CGFloat itemW = LHMomentPhotosViewItemWidth();
    return MHMomentPhotosViewItemInnerMargin + itemW*2;
}

/// 单张图片的最大高度（等比例）180 (ps：别问我为什么，我量出来的)
FOUNDATION_EXTERN CGFloat const MHMomentPhotosViewSingleItemMaxHeight;


/// pictureView显示图片的最大列数
#define LHMomentMaxCols(__photosCount) ((__photosCount==4)?2:3)


