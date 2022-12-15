//
//  LHAleartView.m
//  BaseProject
//
//  Created by dc on 2022/3/17.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "LHAleartView.h"


@interface LHAleartView()

@property(nonatomic,strong)UIView * alertView;

@property(nonatomic,strong)UILabel * titleLabel;


@property(nonatomic,strong)UILabel * descLabel;

@property(nonatomic,copy)void(^handler)(NSInteger buttonIndex);

@end

@implementation LHAleartView

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(NSInteger buttonIndex))handler cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... {
    if (self=[super init]) {
        self.handler = handler;
        NSMutableArray * buttonTitleArray = [NSMutableArray array];
        [buttonTitleArray addObject:otherButtonTitles];

        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                //依次取得所有参数
                NSLog(@"%@",otherString);
                [buttonTitleArray addObject:otherString];
            }
        }
        va_end(args);
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    

        self.alertView = [[UIView alloc] initWithFrame:CGRectMake(53, 0, kScreenWidth-53*2, 150)];
        self.alertView.backgroundColor = kColorWithHex(0xf0f0f0);
        self.alertView.layer.cornerRadius = 12;
        self.alertView.centerY = self.centerY;
        self.alertView.clipsToBounds = YES;
        [self addSubview:self.alertView];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.alpha = 0.2;
        blurEffectView.frame = self.alertView.bounds;
        [self.alertView addSubview:blurEffectView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,0, self.alertView.width-20, 44)];
        self.titleLabel.textColor = kColorWithHex(0x333333);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kMainBoldFontSize(16);
        self.titleLabel.text = title;
        [self.alertView addSubview:self.titleLabel];
        
        
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,self.titleLabel.bottom, self.alertView.width-40, 44)];
        self.descLabel.textColor = kColorWithHex(0x333333);
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.font = kMainFontSize(14);
        self.descLabel.text = message;
        self.descLabel.numberOfLines = 0;
        [self.alertView addSubview:self.descLabel];
        
        self.descLabel.height = [message getTextHeightfont:kMainFontSize(14) labelWidth:self.alertView.width-40];


        
        
        UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.descLabel.bottom+20, self.alertView.width/2, 44)];
        cancelButton.titleLabel.font = kMainBoldFontSize(16);
        [cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [cancelButton setTitleColor:kColorWithHex(0x007AFF) forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:cancelButton];
        
        UIButton * otherButton = [[UIButton alloc] initWithFrame:CGRectMake(self.alertView.width/2, cancelButton.top, cancelButton.width, cancelButton.height)];
        otherButton.titleLabel.font = kMainBoldFontSize(16);
        [otherButton setTitle:buttonTitleArray.firstObject forState:UIControlStateNormal];
        [otherButton setTitleColor:kColorWithHex(0x007AFF) forState:UIControlStateNormal];
        [otherButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:otherButton];
        
        UIView * horizontalSpaceView = [[UIView alloc] initWithFrame:CGRectMake(cancelButton.x, cancelButton.top, self.alertView.width, 0.5)];
        horizontalSpaceView.backgroundColor = kColorWithHex(0x999999);
        [self.alertView addSubview:horizontalSpaceView];
        
        UIView * verticalSpaceView = [[UIView alloc] initWithFrame:CGRectMake(cancelButton.width, cancelButton.top, 0.5, cancelButton.height)];
        verticalSpaceView.backgroundColor = kColorWithHex(0x999999);
        [self.alertView addSubview:verticalSpaceView];



        self.alertView.height = cancelButton.bottom;


    }
    return self;

    
}
- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... {
    
    if (self=[super init]) {
        
        NSMutableArray * buttonTitleArray = [NSMutableArray array];
        [buttonTitleArray addObject:otherButtonTitles];

        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                //依次取得所有参数
                NSLog(@"%@",otherString);
                [buttonTitleArray addObject:otherString];
            }
        }
        va_end(args);
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    

        self.alertView = [[UIView alloc] initWithFrame:CGRectMake(53, 0, kScreenWidth-53*2, 150)];
        self.alertView.backgroundColor = kColorWithHex(0xf0f0f0);
        self.alertView.layer.cornerRadius = 12;
        self.alertView.centerY = self.centerY;
        self.alertView.clipsToBounds = YES;
        [self addSubview:self.alertView];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.alpha = 0.2;
        blurEffectView.frame = self.alertView.bounds;
        [self.alertView addSubview:blurEffectView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,0, self.alertView.width-20, 44)];
        self.titleLabel.textColor = kColorWithHex(0x333333);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kMainBoldFontSize(16);
        self.titleLabel.text = title;
        [self.alertView addSubview:self.titleLabel];
        
        
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,self.titleLabel.bottom, self.alertView.width-40, 44)];
        self.descLabel.textColor = kColorWithHex(0x333333);
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.font = kMainFontSize(14);
        self.descLabel.text = message;
        self.descLabel.numberOfLines = 0;
        [self.alertView addSubview:self.descLabel];
        
        self.descLabel.height = [message getTextHeightfont:kMainFontSize(14) labelWidth:self.alertView.width-40];


        
        
        UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.descLabel.bottom+20, self.alertView.width/2, 44)];
        cancelButton.titleLabel.font = kMainBoldFontSize(16);
        [cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [cancelButton setTitleColor:kColorWithHex(0x007AFF) forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:cancelButton];
        
        UIButton * otherButton = [[UIButton alloc] initWithFrame:CGRectMake(self.alertView.width/2, cancelButton.top, cancelButton.width, cancelButton.height)];
        otherButton.titleLabel.font = kMainBoldFontSize(16);
        [otherButton setTitle:buttonTitleArray.firstObject forState:UIControlStateNormal];
        [otherButton setTitleColor:kColorWithHex(0x007AFF) forState:UIControlStateNormal];
        [otherButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:otherButton];
        
        UIView * horizontalSpaceView = [[UIView alloc] initWithFrame:CGRectMake(cancelButton.x, cancelButton.top, self.alertView.width, 0.5)];
        horizontalSpaceView.backgroundColor = kColorWithHex(0x999999);
        [self.alertView addSubview:horizontalSpaceView];
        
        UIView * verticalSpaceView = [[UIView alloc] initWithFrame:CGRectMake(cancelButton.width, cancelButton.top, 0.5, cancelButton.height)];
        verticalSpaceView.backgroundColor = kColorWithHex(0x999999);
        [self.alertView addSubview:verticalSpaceView];



        self.alertView.height = cancelButton.bottom;


    }
    return self;
}
-(void)show{
    
    [kKeyWindow addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    self.alertView.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        self.alertView.alpha = 1.0;
    }];
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue= [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]; //x,y,z放大缩小倍数
    animation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    animation.duration=0.4;
    animation.fillMode=kCAFillModeForwards;
    [self.alertView.layer addAnimation:animation forKey:nil];
}
-(void)dismiss{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [UIView animateWithDuration:0.2 animations:^{
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
