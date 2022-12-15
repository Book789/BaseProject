//
//  MH_L_ModifyFamilyDeclarationView.m
//  MeiSui
//
//  Created by dc on 2022/2/23.
//  Copyright © 2022 厦门东城世纪. All rights reserved.
//

#import "LHModifyFamilyDeclarationView.h"


@interface LHModifyFamilyDeclarationView()<UITextViewDelegate>

@property(nonatomic,strong)UIView *animateView;


@property(nonatomic,strong)UILabel  * textViewNumberLabel;

@end

@implementation LHModifyFamilyDeclarationView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self nb_settingUpSubViews];
        [self nb_animateForShowView];
    }
    return self;
}
-(void)nb_settingUpSubViews{
    
    _animateView = [[UIView alloc]init];
    _animateView.frame = CGRectMake(35, 182, self.bounds.size.width-70, 338);
    _animateView.center = self.center;
    _animateView.layer.cornerRadius = 8;
    _animateView.layer.masksToBounds = YES;
    _animateView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_animateView];
    
//    UILabel *  titleLabel = [UILabel labelWithFrame:CGRectMake(0, 24, _animateView.width, 22) Text:@"PingFang SC" textColor:[UIColor colorWithHexString:@"#333333"] font:[UIFont fontWithName: @"PingFang SC" size:16] textAlignment:NSTextAlignmentCenter];
//    [_animateView addSubview:titleLabel];
    

    
    
//    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(28, _animateView.height-18-44,_animateView.width-56, 44)];
//    [cancelBtn addTarget:self action:@selector(nb_dismissViewAction) forControlEvents:UIControlEventTouchUpInside];
//    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//    [cancelBtn setTitleColor:[UIColor colorWithHexString:@"#999999"]  forState:UIControlStateNormal];
//    [_animateView addSubview:cancelBtn];
//
//
//    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(28, cancelBtn.top-12-44,_animateView.width-56, 44)];
//    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
//    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    sureBtn.titleLabel.font = [UIFont fontWithName: @"PingFang SC" size:16];
//    [sureBtn addTarget:self action:@selector(nb_sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [_animateView addSubview:sureBtn];
//    UIColor * color = [UIColor colorWithPatternImage:[UIImage createImageWithSize:CGSizeMake(sureBtn.width, sureBtn.height) gradientColors:@[[UIColor colorWithHexString:@"#FF444C"],[UIColor colorWithHexString:@"#FF6A4F"]] percentage:@[@(0),@(1.0)] gradientType:GradientFromLeftToRight];
//    sureBtn.backgroundColor = color;
//    sureBtn.layer.cornerRadius = 22;
//    sureBtn.clipsToBounds = YES;
    
//    UIView *   textViewBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(28, titleLabel.bottom+18, sureBtn.width, sureBtn.top-48-titleLabel.bottom)];
//    textViewBackgroundView.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
//    textViewBackgroundView.layer.cornerRadius = 10;
//    textViewBackgroundView.layer.borderWidth =  0.5;
//    textViewBackgroundView.layer.borderColor = [UIColor colorWithHexString:@"#CFCFCF"].CGColor;
//    [_animateView addSubview:textViewBackgroundView];
//
//    _textViewNumberLabel = [UILabel labelWithFrame:CGRectMake(textViewBackgroundView.right-60, textViewBackgroundView.bottom-20, 60, 16) Text:@"PingFang SC" textColor:[UIColor colorWithHexString:@"#999999"] font:[UIFont fontWithName: @"PingFang SC" size:14] textAlignment:NSTextAlignmentCenter];
//    _textViewNumberLabel.text = @"0/200";
//    [_animateView addSubview:_textViewNumberLabel];
    
//    _textView = [[IQTextView alloc]initWithFrame:CGRectMake(textViewBackgroundView.x+4, textViewBackgroundView.top+5, textViewBackgroundView.width-8, textViewBackgroundView.height-25)];
//    _textView.delegate = self;
//    _textView.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
//    _textView.font =[UIFont fontWithName: @"PingFang SC" size:14] ;
//    _textView.placeholder = @"输入家族宣言";
//    _textView.textColor =  [UIColor colorWithHexString:@"#333333"];
//    _textView.placeholderTextColor = [UIColor colorWithHexString:@"#999999"];
//    [_animateView addSubview:_textView];

    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (!CGRectContainsPoint(_animateView.frame, [touch locationInView:self])) {
        [self nb_dismissViewAction];
    }
}

- (void)nb_animateForShowView{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _animateView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
        _animateView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
}
- (void)nb_dismissViewAction{
    [self endEditing:YES];
    [UIView animateWithDuration:0.45 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _animateView.transform = CGAffineTransformMakeScale(.1, .1);
        _animateView.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)nb_sureBtnAction{

    [self endEditing:YES];
}
@end
