//
//  SHInfiniteShufflingLabel.h
//  Project
//
//  Created by a on 2022/5/27.
//

#import <UIKit/UIKit.h>

typedef void(^DidSlectIndex)(NSInteger index,NSString *text);
typedef enum : NSUInteger {
    SHRollingDirectionUp,
    SHRollingDirectionDown,
} SHRollingDirection;


@interface SHInfiniteShufflingLabel : UIScrollView
/**
 设置文字内容和间隔时间
 @param dataArray 文字数组
 @param time 间隔时间,0代表不启动定时器(自动创建和销毁定时器)
 @param direction 滚动方向
 */
- (void)setTextArray:(NSArray <NSString *>*)dataArray InteralTime:(NSTimeInterval)time Direction:(SHRollingDirection)direction;
/*!
 *点击回调
 */
@property (nonatomic , copy) DidSlectIndex didSelect;

@end

