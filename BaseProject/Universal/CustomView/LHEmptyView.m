//
//
//

#import "LHEmptyView.h"
#import "LHReachability.h"
#import "LHRefreshPointAnimationView.h"
#import "BasePopupView.h"


static Class FMCaptionStyleViewClass = nil;

#define MC_Request_NoNet        @"Oh！网络不见了，请检查网络连接"
#define MC_Request_NoNetToast   @"Oh！网络不见了，请检查网络连接"
#define MC_Request_NoResult     @"暂无数据"
#define MC_Request_Retry        @"哦啊~手机网络不太顺畅哦！"
#define MC_Request_Low          @"哦啊~手机网络不太顺畅哦！"
#define MC_Request_Loading      @"请求中.."
#define MC_Request_UserNoData   @"暂无数据"

@interface LHEmptyView()
@property(strong,nonatomic)NSMutableDictionary* titleMap;
@property(strong,nonatomic)NSMutableDictionary* imageMap;
//@property(nonatomic,strong)UIImageView *juHuaView;
//@property(nonatomic,strong)UIImageView *juHuaCircle;

@property(nonatomic, strong) LHRefreshPointView *animationView;

@property(nonatomic, strong) UIButton * retryButton;


@end

@implementation LHEmptyView

+(void)fm_setCaptionViewClass:(Class)captionViewClass
{
    if (captionViewClass) {
        FMCaptionStyleViewClass = captionViewClass;
    }
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initMyself];
    }
    return self;
}
+(instancetype)addToView:(UIView *)view{
    
    return [self addToView:view show:YES];
}
+(instancetype)addToView:(UIView *)view show:(BOOL)show{
    if (FMCaptionStyleViewClass) {
        return [FMCaptionStyleViewClass addToView:view show:show];
    }

    LHEmptyView* emptyView = [[self alloc] initWithFrame:CGRectMake(0, KNavigationBarHeight+kStatusBarHeight, view.width, view.height-KNavigationBarHeight+kStatusBarHeight)];
    [view addSubview:emptyView];
    if (show){
        [emptyView show];
    }
    else{
        [emptyView hide];
    }
    return emptyView;
}
+ (instancetype)captionFromView:(UIView *)view{
    LHEmptyView* captionView = nil;
    for (UIView* subview in view.subviews) {
        if([subview isKindOfClass:self])
        {
            captionView = (id)subview;
            break;
        }
    }
    return captionView;
}
+(BOOL)removeFromView:(UIView *)view{
    
    UIView* captionView = nil;
    for (UIView* subview in view.subviews) {
        if([subview isKindOfClass:self])
        {
            captionView = subview;
            break;
        }
    }
    if(captionView)
    {
        [captionView removeFromSuperview];
    }
    return YES;
}

-(void)_initMyself{
    

    self.backgroundColor = kColorWithHex(0xf5f5f5);
    
    self.state = LHEmptyViewStateHidden;
    self.titleMap = [NSMutableDictionary dictionary];
    self.imageMap = [NSMutableDictionary dictionary];

    
    //    //1.3临时替换菊花
    //    UIActivityIndicatorView *juhua = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //    juhua.color=MHColor_Black_Text_Color;
    //    juhua.center=self.imageView.center;
    //    juhua.hidesWhenStopped=YES;
    //    [juhua startAnimating];
    //    [self.imageView addSubview:juhua];

    //1.5换成手帕
    //    _juHuaView=juhua;

//    _juHuaView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
//    _juHuaView.image=[UIImage imageNamed:@"refresh_circle"];
//    _juHuaView.contentMode=UIViewContentModeCenter;
//    _juHuaView.center=CGPointMake(self.width/2, self.height/2);
//    [self addSubview:_juHuaView];

//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh_logo"]];
//    imageView.center = CGPointMake(self.width/2, self.height/2);
//    [self addSubview:imageView];
//    self.juHuaCircle=imageView;
//
////    CATransform3D rotationTransform = CATransform3DIdentity;
////    rotationTransform.m34 = 1.0/-900;
////    //带点缩小的效果
////    rotationTransform = CATransform3DScale(rotationTransform, 0.7, 0.7, 1);
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
////    animation.fromValue = [NSValue valueWithCATransform3D:rotationTransform];
////    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
////    animation.duration  =  0.8;
////    animation.autoreverses = YES;
////    animation.cumulative = NO;
////    animation.fillMode = kCAFillModeForwards;
////    animation.repeatCount = MAXFLOAT;
////    animation.delegate = self;
////    [_juHuaView.layer addAnimation:animation forKey:@"rotationAnimation"];
////    //    transform.scale
//    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    animation.fromValue = 0;
//    animation.toValue = [NSNumber numberWithFloat:M_PI*2];
//    animation.duration = 1;
//    CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    animation.timingFunction = linearCurve;
//    animation.removedOnCompletion = NO;
//    animation.repeatCount = INFINITY;
//    animation.fillMode = kCAFillModeForwards;
//    animation.autoreverses = NO;
//    [_juHuaView.layer addAnimation:animation forKey:@"transform.rotation"];

    _animationView =[[LHRefreshPointView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    _animationView.isShowTitle = NO;
    [self addSubview:_animationView];
//    [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
//    }];
    _animationView.center = CGPointMake(self.width*0.5, self.height-kScreenHeight*0.5);

}
-(void)handleTap:(id)sender
{
    if(_state == LHEmptyViewStateLoading || _state == LHEmptyViewStateHidden)
    {
        return;
    }
//    if(_allTapToRetry == NO && _state != LHEmptyViewStateRetry&&_state!=LHEmptyViewStateNoUserData)
//    {
//        return;
//    }
    _animationView.isRefreshing = YES;
    if(self.state == LHEmptyViewStateNoResult){

    }else{
        self.state = LHEmptyViewStateLoading;
    }
    !self.retryBlock ?: self.retryBlock();
}

-(void)setTitle:(NSString *)title andState:(LHEmptyViewState)state
{
    [self setState:state andTitle:title];
}
-(void)setState:(LHEmptyViewState)state andTitle:(NSString *)title
{
    [self setTitle:title forState:state];
    if(_state != state)
    {
        [self setState:state];
    }
}
-(void)setTitle:(NSString *)title forState:(LHEmptyViewState)state
{
    _titleMap[@(state)] = title;
    if (_state == state) {
        _titleLabel.text = title;
        [self refreshView];
        BasePopupView * popupV=nil;
        for (BasePopupView * v in self.superview.subviews) {
            if ([v isKindOfClass:[BasePopupView class]]) {
                popupV = (BasePopupView *)v;
            }
        }
        if (popupV) {
            //如果有弹窗 则置于弹窗之下
            [self.superview insertSubview:self belowSubview:popupV];
        }else{
            if(self.superview.subviews.lastObject != self){
                //无弹窗 则置于最上
                [self.superview bringSubviewToFront:self];
            }
        }
    }
}
-(NSString *)titleForState:(LHEmptyViewState)state
{
    return _titleMap[@(state)];
}
- (void)setImage:(UIImage *)image forState:(LHEmptyViewState)state{
    _imageMap[@(state)]=image;
}
- (UIImage *)imageForState:(LHEmptyViewState)state
{
     return _imageMap[@(state)];
}
-(void)setState:(LHEmptyViewState)state
{
    _state = state;

    [self setImageView:nil titleLabel:_titleLabel state:state];

    [self refreshView];
    BasePopupView * popupV=nil;
    for (BasePopupView * v in self.superview.subviews) {
        if ([v isKindOfClass:[BasePopupView class]]) {
            popupV = (BasePopupView *)v;
        }
    }
    if (popupV) {
        //如果有弹窗 则置于弹窗之下
        [self.superview insertSubview:self belowSubview:popupV];
    }else{
        if(self.superview.subviews.lastObject != self){
            //无弹窗 则置于最上
            [self.superview bringSubviewToFront:self];
        }
    }


}

-(void)setImageView:(UIImageView *)imageView titleLabel:(UILabel *)titleLabel state:(LHEmptyViewState)state {
    BOOL hasNetwork = [[LHReachability shareInstance] networkEnable];
    NSString* title = [self titleForState:state];
    switch (state) {
        case LHEmptyViewStateNoResult:
        {
            if(hasNetwork)
            {
                 self.imageView.image = [UIImage imageNamed:@"bg_nothing"];
                self.titleLabel.text = title?:MC_Request_NoResult;
                _animationView.hidden=YES;
                titleLabel.hidden=NO;
                self.retryButton.hidden = YES;
            }
            else
            {
                self.imageView.image = [UIImage imageNamed:@"icon_net_disable"];
                self.titleLabel.text = title?:MC_Request_NoNet;
                _animationView.hidden = YES;
                titleLabel.hidden=NO;
                self.retryButton.hidden = NO;
            }
            break;
        }
        case LHEmptyViewStateRetry:
        {
            if(hasNetwork)
            {
                self.imageView.image = [UIImage imageNamed:@"icon_net_slow"];
                self.titleLabel.text = title?:MC_Request_Retry;
                _animationView.hidden = YES;
                self.titleLabel.hidden=NO;
                 self.retryButton.hidden = NO;
            }
            else
            {
                self.imageView.image = [UIImage imageNamed:@"icon_net_disable"];
                self.titleLabel.text = title?:MC_Request_NoNet;
                _animationView.hidden=YES;
                self.titleLabel.hidden=NO;
                self.retryButton.hidden = NO;
            }
            break;
        }
        case LHEmptyViewStateHidden:
        {
            _animationView.hidden=YES;
            _titleLabel.hidden=YES;
            break;
        }
        case LHEmptyViewStateLoading:
        {
//            titleLabel.text = title?:MC_Request_Loading;
            self.imageView.image=nil;
            _animationView.isRefreshing = YES;
            _animationView.hidden=NO;
            _titleLabel.hidden=YES;
            if (_retryButton)
                _retryButton.hidden = YES;
            break;
        }
//        case LHEmptyViewStateNoUserData:
//        {
//            UIImage *image=[self imageForState:state];
//            self.imageView.image = image;
//            self.titleLabel.text = title?:MC_Request_UserNoData;
//            _animationView.isRefreshing = NO;
//            _animationView.hidden=YES;
//            self.titleLabel.hidden = NO;
//            _retryButton.hidden = YES;
//        }
//            break;
//        case LHEmptyViewStateNoUserDataAndAction:
//        {
//            UIImage *image=[self imageForState:state];
//            self.imageView.image = image;
//            self.titleLabel.text = title?:MC_Request_UserNoData;
//            _animationView.isRefreshing = NO;
//            _animationView.hidden=NO;
//            self.titleLabel.hidden = NO;
//            self.retryButton.hidden = NO;
//            [self.retryButton setTitle:@"去广场逛一逛" forState:UIControlStateNormal];
//        }
//            break;
//        case LHEmptyViewStateNoFansDataAndAction:
//        {
//            UIImage *image=[self imageForState:state];
//            self.imageView.image = image;
//            self.titleLabel.text = title?:MC_Request_UserNoData;
//            _animationView.isRefreshing = NO;
//            _animationView.hidden=NO;
//            self.titleLabel.hidden = NO;
//            self.retryButton.hidden = NO;
//            [self.retryButton setTitle:@"我要直播" forState:UIControlStateNormal];
//        }
//            break;
    }
}

- (UIImageView*)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_imageView.superview);
            make.centerY.equalTo(_imageView.superview).offset(-123/2);
        }];
    }
    return _imageView;
}

- (UILabel*)titleLabel
{
    if (!_titleLabel)
    {
        CGFloat y=CGRectGetMaxY(self.imageView.frame)+17;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,y, kScreenWidth, 18)];
        _titleLabel.textColor = kColorWithHex(0x666666);
        _titleLabel.font = kMainFontSize(14);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_titleLabel.superview);
            make.top.equalTo(self.imageView.mas_bottom).offset(17);
        }];
    }
    return _titleLabel;
}

- (UIButton*)retryButton{
    if (!_retryButton){
          CGFloat y=CGRectGetMaxY(self.titleLabel.frame)+20;
        _retryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _retryButton.frame = CGRectMake(self.width-155*0.5, y, 155, 43) ;
        _retryButton.titleLabel.font = kMainFontSize(17);
        [_retryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_retryButton setTitle:@"重新加载"  forState:UIControlStateNormal];
        [self addSubview:_retryButton];
        [_retryButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(155, 43));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
            make.centerX.equalTo(_retryButton.superview);
        }];
        UIImage * backImage =[UIImage createImageWithSize:_retryButton.frame.size gradientColors:@[kColorWithHex(0xff444c),kColorWithHex(0xff6a4f)] percentage:@[@(0),@(1.0)] gradientType:GradientFromLeftToRight];
        [_retryButton setBackgroundImage:backImage forState:UIControlStateNormal];

    }
    return _retryButton;
}

-(void)refreshView{
    
    if(_state == LHEmptyViewStateHidden){
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
}

-(void)show{
    
    self.state = LHEmptyViewStateLoading;
}
-(void)hide{
    self.state = LHEmptyViewStateHidden;
}
-(void)fm_themeChanged
{
    self.state = _state;
}
-(void)setButtonTitle:(NSString *)title
{
    if(title.length){
        
        self.button.hidden = NO;
        [_button setTitle:title forState:UIControlStateNormal];
        _button.centerX = self.width/2;
        _button.top = self.titleLabel.bottom + 15;
    }
    else
    {
        _button.hidden = YES;
    }
}
-(UIButton *)button{
    
    if(_button == nil){
        self.retryButton.hidden = YES;

        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.width = 150;
        button.height = 39;
        button.layer.cornerRadius = 19.5;
        button.layer.masksToBounds = YES;
        UIImage * backImage =[UIImage createImageWithSize:_retryButton.frame.size gradientColors:@[kColorWithHex(0xff444c),kColorWithHex(0xff6a4f)] percentage:@[@(0),@(1.0)] gradientType:GradientFromLeftToRight];
        [button setBackgroundImage:backImage forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = kMainFontSize(15);
        _button = button;
        [self addSubview:button];
    }
    return _button;
}
//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续layer上面的动画
- (void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
@end
