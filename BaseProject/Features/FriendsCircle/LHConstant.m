//
//  LHConstant.m
//  Project
//
//  Created by a on 2022/4/27.
//

#import "LHConstant.h"


/// 链接key
NSString * const LHMomentLinkUrlKey = @"LHMomentLinkUrlKey";
/// 电话号码key
NSString * const LHMomentPhoneNumberKey = @"LHMomentPhoneNumberKey";
/// 位置key
NSString * const LHMomentLocationNameKey = @"LHMomentLocationNameKey";

/// 用户信息key
NSString * const LHMomentUserInfoKey = @"LHMomentUserInfoKey";

/**
 用户头像的大小 44x44
 */
CGFloat const LHMomentAvatarWH = 44.0f;

/// 说说内容距离左右屏幕的间距 20
CGFloat const LHMomentContentLeftOrRightInset = 20.0f;

/// 微信正文内容的显示最大行数（PS：如果超过最大值，那么正文内容就单行显示，可以点击正文内容查看全部内容）
NSUInteger const LHMomentContentTextMaxCriticalRow = 12000;

CGFloat const LHMomentContentInnerMargin = 10.f;

/// videoView高度
CGFloat const LHMomentVideoViewHeight = 181.0f;
/// videoView宽度
CGFloat const LHMomentVideoViewWidth = 103.0f;
/// 更多按钮宽高 (实际：25x25)
CGFloat const LHMomentOperationMoreBtnWH = 25;

/// 全文、收起W
CGFloat const MHMomentExpandButtonWidth = 35.0f;
/// 全文、收起H
CGFloat const MHMomentExpandButtonHeight = 25.0f;

/// 向上箭头W 45
CGFloat const LHMomentUpArrowViewWidth = 45.0f;
/// 向上箭头H 6
CGFloat const LHMomentUpArrowViewHeight = 6.0f;

/// pictureView中图片之间的的间距 6
CGFloat const MHMomentPhotosViewItemInnerMargin = 6.0f;
/// pictureView中图片的大小 86x86 (屏幕尺寸>320)
CGFloat const MHMomentPhotosViewItemWH1 = 86.0f;
/// pictureView中图片的大小 70x70 (屏幕尺寸<=320)
CGFloat const MHMomentPhotosViewItemWH2 = 70.0f;

/// 单张图片的最大高度（等比例）180 (ps：别问我为什么，我量出来的)
CGFloat const MHMomentPhotosViewSingleItemMaxHeight = 180;
