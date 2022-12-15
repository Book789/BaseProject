//
//  GraffitiView.h
//  Project
//
//  Created by a on 2022/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YZGraffitiViewValueChangeBlock)(NSInteger value);


@interface GraffitiView : UIView

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, copy) NSString * giftUrl;

@property (nonatomic, copy) YZGraffitiViewValueChangeBlock valueChagneBlock;



@end

NS_ASSUME_NONNULL_END
