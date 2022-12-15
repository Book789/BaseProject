//
//  LHMoment.h
//  Project
//
//  Created by a on 2022/4/27.
//
//单条说说Model
#import <Foundation/Foundation.h>
#import "LHUserModel.h"
#import "MHPicture.h"
#import "MHComment.h"


NS_ASSUME_NONNULL_BEGIN
/// 微信朋友圈类型 （0 配图  1 video 2 share）
typedef NS_ENUM(NSUInteger, MHMomentExtendType) {
    MHMomentExtendTypePicture = 0, /// 配图
    MHMomentExtendTypeVideo,       /// 视频
    MHMomentExtendTypeShare,       /// 分享
};


@interface LHMoment : NSObject

/**
 正文
 */
@property (nonatomic, readwrite, copy) NSString *text;
/**
 idStr
 */
@property (nonatomic, readwrite, copy) NSString *idstr;
/**
 创建时间
 */
@property (nonatomic, readwrite, strong) NSDate *createdAt;
/**
 来源 （比如：今日头条、QQ音乐...）
 */
@property (nonatomic, readwrite, copy) NSString *source;
/**
 来源可否点击 0 不可点击
 */
@property (nonatomic, readwrite, assign) int32_t sourceAllowClick;
/**
 点击来源跳转的链接
 */
@property (nonatomic, readwrite, copy) NSString *sourceUrl;
/**
 位置 （暴露位置，始终可以点击）
 */
@property (nonatomic, readwrite, copy) NSString *location;
/**
 是否已点赞 0 没有点赞
 */
@property (nonatomic, readwrite, assign) int32_t attitudesStatus;
/**
 点赞数
 */
@property (nonatomic, readwrite, assign) int32_t attitudesCount;
/**
 点赞列表 (可变数组)
 */
@property (nonatomic, readwrite, strong) NSMutableArray <LHUserModel *> * attitudesList;
/**
 评论数
 */
@property (nonatomic, readwrite, assign) int32_t commentsCount;
/**
 评论列表
 */
@property (nonatomic, readwrite, strong) NSMutableArray <MHComment *> *commentsList;
/**
 用户模型
 */
@property (nonatomic, readwrite, strong) LHUserModel *user;
/**
 图片数组
 */
@property (nonatomic, readwrite, copy) NSArray <MHPicture *> *picInfos;

/**
 微信朋友圈类型 （0 配图  1 video 2 share）
 */
@property (nonatomic, readwrite, assign) MHMomentExtendType type;

///**
// 分享内容
// */
//@property (nonatomic, readwrite, strong) MHMomentShareInfo *shareInfo;
///**
// 视频内容
// */
//@property (nonatomic, readwrite, strong) MHMomentVideo *videoInfo;

@end




NS_ASSUME_NONNULL_END
