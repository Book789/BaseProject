//
//  LHBackgroundScrollView.m
//  Project
//
//  Created by a on 2022/5/26.
//

#import "LHBackgroundScrollView.h"

@interface LHBackgroundScrollView()

@property(nonatomic,strong)UIScrollView * scrollerView;

@property(nonatomic,assign)BOOL isAnimation;

@property(nonatomic,strong)UIImageView * leftImageView;

@property(nonatomic,strong)UIImageView * rightImageView;


@end

@implementation LHBackgroundScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        self.scrollerView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollerView.userInteractionEnabled = NO;
        [self addSubview:self.scrollerView];
        

        UIImageView * leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width+5, self.height)];
        leftImageView.contentMode = UIViewContentModeScaleAspectFill;

        [self.scrollerView addSubview:leftImageView];
        self.leftImageView = leftImageView;
        
        UIImageView * rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width+5, 0, self.width+5, self.height)];
        rightImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollerView addSubview:rightImageView];
        self.rightImageView = rightImageView;


        [self setAnimation];
    }
    return self;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    self.leftImageView.image = image;
    self.rightImageView.image = image;
    
}
-(void)startAnimation{
    if (self.isAnimation) {
        return;
    }
    self.isAnimation = YES;
    [self setAnimation];
}
-(void)stopAnimation{
    self.isAnimation = NO;
}

-(void)setAnimation{
    
    if (!self.isAnimation) {
        return;
    }
    
    [UIView animateWithDuration:0.01 animations:^{
        self.scrollerView.contentOffset = CGPointMake(self.scrollerView.contentOffset.x+1, 0);
    }completion:^(BOOL finished) {
        if (self.scrollerView.contentOffset.x==kScreenWidth+5) {
            self.scrollerView.contentOffset = CGPointMake(0, 0);
        }
        [self setAnimation];
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollerView.frame = self.bounds;
    self.scrollerView.contentSize = CGSizeMake(self.width*2+10, self.height);

}

@end
