//
//  LHContentScrollView.h
//  Project
//
//  Created by a on 2022/5/30.
//

#import <UIKit/UIKit.h>


/**
 *  自定义UIScrollView，在需要时可以拦截其滑动手势
 */

@class LHContentScrollView;

@protocol LHContentScrollViewDelegate <NSObject>

@optional

- (BOOL)scrollView:(LHContentScrollView *_Nullable)scrollView shouldScrollToPageIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LHContentScrollView : UIScrollView

@property (nonatomic, weak) id <LHContentScrollViewDelegate> lh_delegate;

@property (nonatomic, assign) BOOL interceptLeftSlideGuetureInLastPage;

@end

NS_ASSUME_NONNULL_END
