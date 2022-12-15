//
//  LHContentScrollView.m
//  Project
//
//  Created by a on 2022/5/30.
//

#import "LHContentScrollView.h"

@implementation LHContentScrollView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[UISlider class]]) {
        self.scrollEnabled = NO;
    } else {
        self.scrollEnabled = YES;
    }
    return view;
}

/**
 *  重写此方法，在需要的时候，拦截UIPanGestureRecognizer
 */
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (![gestureRecognizer respondsToSelector:@selector(translationInView:)]) {
        return YES;
    }
    // 计算可能切换到的index
    NSInteger currentIndex = self.contentOffset.x / self.frame.size.width;
    NSInteger targetIndex;// = currentIndex;
    
    CGPoint translation = [gestureRecognizer translationInView:self];
    if (translation.x > 0) {
        targetIndex = currentIndex - 1;
    } else {
        targetIndex = currentIndex + 1;
    }
    
    // 第一页往右滑动
    if (targetIndex < 0) {
        return NO;
    }
    
    // 最后一页往左滑动
    if (self.interceptLeftSlideGuetureInLastPage) {
        NSUInteger numberOfPage = self.contentSize.width / self.frame.size.width;
        if (targetIndex >= numberOfPage) {
            return NO;
        }
    }
    
    // 其他情况
    if (self.lh_delegate && [self.lh_delegate respondsToSelector:@selector(scrollView:shouldScrollToPageIndex:)]) {
        return [self.lh_delegate scrollView:self shouldScrollToPageIndex:targetIndex];
    }
    
    return YES;
}


@end
