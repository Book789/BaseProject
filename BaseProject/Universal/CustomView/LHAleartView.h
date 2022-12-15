//
//  LHAleartView.h
//  BaseProject
//
//  Created by dc on 2022/3/17.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LHAleartView;
@protocol LHAleartViewDelegate <NSObject>

- (void)alertView:(LHAleartView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex ;

@end



@interface LHAleartView : UIView

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... ;

// shows popup alert animated.
- (void)show;

@end

NS_ASSUME_NONNULL_END
