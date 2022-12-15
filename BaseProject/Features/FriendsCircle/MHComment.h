//
//  MHComment.h
//  Project
//
//  Created by a on 2022/4/28.
//

#import <Foundation/Foundation.h>
#import "LHUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MHComment : NSObject

/// 正文
@property (nonatomic, readwrite, copy) NSString *text;
/// idStr(评论的id)
@property (nonatomic, readwrite, copy) NSString *idstr;
/// momentIdstr(该评论的所处的说说的id)
@property (nonatomic, readwrite, copy) NSString *momentIdstr;
/// 创建时间
@property (nonatomic, readwrite, strong) NSDate *createdAt;
/// 回复:xxx （目标）
@property (nonatomic, readwrite, strong) LHUserModel *toUser;
/// xxx: （来源）
@property (nonatomic, readwrite, strong) LHUserModel *fromUser;


@end

NS_ASSUME_NONNULL_END
