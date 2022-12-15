//
//  NBRefreshGifHeader.m
//  NiceIM
//
//  Created by shun on 2021/11/12.
//  Copyright © 2021 mac. All rights reserved.
//

#import "NBRefreshGifHeader.h"

@interface NBRefreshGifHeader()

@property(nonatomic, strong)UILabel *customStatusLable;

@property(nonatomic, strong)UIImageView *gifImageView;

@property(nonatomic, strong)NSMutableDictionary *stateImages;

@property(nonatomic, strong)NSMutableDictionary *stateDurations;

@end

@implementation NBRefreshGifHeader

#pragma mark- 实现父类的方法
- (void)prepare {
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"努力加载中，冲鸭～" forState:MJRefreshStateRefreshing];
    [self setTitle:@"刷新完成" forState:MJRefreshStateWillRefresh];

    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i=0; i<51; i++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_Main%02ld",i];
        [images addObject:[UIImage imageNamed:imageName]];
    }
    _stateImages = [NSMutableDictionary dictionary];
    _stateImages[@(MJRefreshStateIdle)] = images;
    _stateImages[@(MJRefreshStatePulling)] = images;
    _stateImages[@(MJRefreshStateRefreshing)] = images;
    _stateImages[@(MJRefreshStateWillRefresh)] = images;
    
    _stateDurations = [NSMutableDictionary dictionary];
    _stateDurations[@(MJRefreshStateIdle)] = @(2);
    _stateDurations[@(MJRefreshStatePulling)] = @(2);
    _stateDurations[@(MJRefreshStateRefreshing)] = @(2);
    _stateDurations[@(MJRefreshStateWillRefresh)] = @(2);
    
//    if (_scrollView.top == 0) {}
//    if (kIs_iPhoneX) {
//        self.mj_h = 115;
//    }
    
    self.mj_h = 80;
    
    _gifImageView = [[UIImageView alloc] init];
    [self addSubview:_gifImageView];
    
    _customStatusLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.mj_h-20, kScreenWidth, 15)];
    _customStatusLable.font = kMainFontSize(10);
    _customStatusLable.textColor = [UIColor midTextColor];
    _customStatusLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_customStatusLable];
}

- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    //如果拖动的百分比大于1则显示为1
    if (self.scrollView.dragging) {
        if (pullingPercent >= 1) {
            pullingPercent = 0.9999;
        }
        
        if (self.state == MJRefreshStateIdle) {
            _customStatusLable.text = @"下拉刷新";
        }
    }
    
    //gifImageView 最宽90 60
    CGFloat width = 90*pullingPercent;
    CGFloat height = width*2.0/3.0;
    _gifImageView.frame = CGRectMake((kScreenWidth-width)/2, (60-height)/2.0, width, height);
    NSArray *images = self.stateImages[@(MJRefreshStateIdle)];
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    [_gifImageView stopAnimating];
    NSUInteger index = images.count*pullingPercent;
    if (index >= images.count) index = images.count-1;
    _gifImageView.image = images[index];
    [self layoutSubviews];
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    //自定义位置的提示刷新状态始终跟父类的保持一致
    _customStatusLable.text = self.stateLabel.text;
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        NSArray *images = _stateImages[@(state)];
        if (images.count == 0) return;
        [_gifImageView stopAnimating];
        if (images.count == 1) {
            _gifImageView.image = [images lastObject];
        }
        else{
            _gifImageView.animationImages = images;
            _gifImageView.animationDuration = [_stateDurations[@(state)] doubleValue];
            [_gifImageView startAnimating];
        }
    }
    else if(state == MJRefreshStateIdle) {
        [_gifImageView stopAnimating];
    }
}

- (void)endRefreshing{
    self.state = MJRefreshStateIdle;
    _customStatusLable.text = @"刷新完成";
}

@end
