//
//  LHCustomSwitch.m
//  Project
//
//  Created by a on 2022/6/8.
//

#import "LHCustomSwitch.h"

@interface LHCustomSwitch()

@property(nonatomic,strong)UIButton * button;

@property(nullable, nonatomic, strong) UIColor *offTintColor;

@end

@implementation LHCustomSwitch

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 51, 31);

        self.onTintColor = kColorWithHex(0x33C659);
        self.offTintColor  = kRGBAColor(119.85, 119.85, 127.5, 0.16);
        
        self.layer.cornerRadius = 15.5;
        self.clipsToBounds = YES;
        self.backgroundColor = kRGBAColor(119.85, 119.85, 127.5, 0.16);

        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(2, 2, 27, 27);
        button.layer.cornerRadius = 13.5;
        button.clipsToBounds = YES;
        button.userInteractionEnabled = NO;
        button.backgroundColor = [UIColor whiteColor];
        [self addSubview:button];
        self.button = button;
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
-(void)click:(UIControl*)control{
    self.on = !self.on;
    [self setAnimate];
}
-(void)setOnTintColor:(UIColor *)onTintColor{
    _onTintColor = onTintColor;
}
-(void)setThumbTintColor:(UIColor *)thumbTintColor{
    _thumbTintColor = thumbTintColor;
    self.button.backgroundColor = thumbTintColor;
}
- (void)setOn:(BOOL)on animated:(BOOL)animated{
    self.on = on;
    [self setAnimate];
}
-(void)setOnImage:(UIImage *)onImage{
    _onImage = onImage;
    self.onTintColor = [UIColor colorWithPatternImage:_onImage];
}
-(void)setOffImage:(UIImage *)offImage{
    _offImage = offImage;
    self.offTintColor =  [UIColor colorWithPatternImage:_offImage];
}
-(void)setAnimate{
    
    if (self.on) {
        [UIView animateWithDuration:0.2 animations:^{
            self.backgroundColor = self.onTintColor;
            self.button.x = self.width - 2 - self.button.width;
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.backgroundColor = self.offTintColor;
            self.button.x = 2;
        }];
    }

}
@end
