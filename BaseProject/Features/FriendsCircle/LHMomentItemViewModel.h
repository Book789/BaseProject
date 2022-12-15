//
//  LHMomentItemViewModel.h
//  Project
//
//  Created by a on 2022/4/27.
//

#import <Foundation/Foundation.h>
#import "LHMoment.h"
#import "MHMomentPhotoItemViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface LHMomentItemViewModel : NSObject

/// ==== Frame Properties ====
/// 头像
@property (nonatomic, readwrite, assign) CGRect avatarViewFrame;
/// 昵称
@property (nonatomic, readwrite, assign) CGRect screenNameLableFrame;
/// 正文
@property (nonatomic, readwrite, assign) CGRect contentLableFrame;

/// 时间
@property (nonatomic, readonly, assign) CGRect createAtLableFrame;


/// 位置
@property (nonatomic, readwrite, assign) CGRect locationLableFrame;

/// 来源
@property (nonatomic, readwrite, assign) CGRect sourceLableFrame;


/// ==== Model Properties ====

/// 说说模型
@property (nonatomic, readwrite, strong) LHMoment *moment;

/// 昵称布局
@property (nonatomic, readwrite, strong) YYTextLayout *screenNameLableLayout;
/// 正文布局
@property (nonatomic, readwrite, strong) YYTextLayout *contentLableLayout;
/// 位置
@property (nonatomic, readwrite, strong) YYTextLayout *locationLableLayout;
/// 时间布局
@property (nonatomic, readonly, strong) YYTextLayout *createAtLableLayout;
/// 来源布局
@property (nonatomic, readwrite, strong) YYTextLayout *sourceLableLayout;

///// 配图
@property (nonatomic, readwrite, copy) NSArray <MHMomentPhotoItemViewModel *> *picInfos;


/// 点赞+评论列表 （设计为 可变数组 后期需要添加东西）
@property (nonatomic, readonly, strong) NSMutableArray *dataSource;

/// 辅助属性
/// 是否展开全文
@property (nonatomic, readwrite, assign , getter = isExpand) BOOL expand;

/// 全文/收起 按钮
@property (nonatomic, readwrite, assign) CGRect expandBtnFrame;

/// 配图View
@property (nonatomic, readwrite, assign) CGRect photosViewFrame;
/// 分享View
//@property (nonatomic, readwrite, assign) CGRect shareInfoViewFrame;
/// 视频View
@property (nonatomic, readwrite, assign) CGRect videoViewFrame;

/// 更多按钮
@property (nonatomic, readwrite, assign) CGRect operationMoreBtnFrame;

/// upArrow
@property (nonatomic, readwrite, assign) CGRect upArrowViewFrame;

/// 整条说说的高度
@property (nonatomic, readwrite, assign) CGFloat height;



- (instancetype)initWithMoment:(LHMoment *)moment;

@end

NS_ASSUME_NONNULL_END
