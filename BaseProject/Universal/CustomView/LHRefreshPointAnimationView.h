//
//  LHRefreshPointAnimationView.h
//  BaseProject
//
//  Created by dc on 2022/3/24.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHRefreshPointAnimationView : UIView

@end

@interface LHRefreshPointView : UIView

@property (nonatomic,assign)CGFloat distance;
@property (nonatomic,assign)BOOL isRefreshing;

@property (nonatomic, assign)BOOL isShowTitle;//默认Yes

@property (nonatomic,strong) UIColor *titleTextColor;
@end


NS_ASSUME_NONNULL_END
