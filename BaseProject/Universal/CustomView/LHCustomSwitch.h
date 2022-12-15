//
//  LHCustomSwitch.h
//  Project
//
//  Created by a on 2022/6/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHCustomSwitch : UIControl

@property(nullable, nonatomic, strong) UIColor *onTintColor;

@property(nullable, nonatomic, strong) UIColor *thumbTintColor;

@property(nullable, nonatomic, strong) UIImage *onImage ;

@property(nullable, nonatomic, strong) UIImage *offImage;

@property(nonatomic,getter=isOn) BOOL on;


- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
