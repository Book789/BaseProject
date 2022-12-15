//
//  LHSheetView.h
//  BaseProject
//
//  Created by dc on 2022/3/28.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LHSheetView;
@protocol LHSheetViewDelegate <NSObject>

- (void)actionSheet:(LHSheetView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface LHSheetView : UIView

- (instancetype)initWithTitle:(nullable NSString *)title delegate:(nullable id<LHSheetViewDelegate>)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... ;

- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
