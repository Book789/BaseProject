//
//  LHItem.m
//  Project
//
//  Created by a on 2022/5/30.
//

#import "LHItem.h"

@interface LHItem()

@property (nonatomic, strong) UIButton *badgeButton;

@end

@implementation LHItem

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.badgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.badgeButton.userInteractionEnabled = NO;
        self.badgeButton.clipsToBounds = YES;
        self.badgeButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.badgeButton];

    }
    return self;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _frameWithOutTransform = frame;
    [self updateBadge];
//    if (self.doubleTapView) {
//        self.doubleTapView.frame = self.bounds;
//    }
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [self setTitle:_title forState:UIControlStateNormal];
}
-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.titleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

- (void)setTitleSelectedColor:(UIColor *)titleSelectedColor {
    _titleSelectedColor = titleSelectedColor;
    [self setTitleColor:titleSelectedColor forState:UIControlStateSelected];
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    if ([self imageForState:UIControlStateNormal] && self.contentVerticalAlignment) {
//        CGSize titleSize = self.titleLabel.frame.size;
//        CGSize imageSize = self.imageView.frame.size;
//        titleSize = CGSizeMake(ceilf(titleSize.width), ceilf(titleSize.height));
//        CGFloat totalHeight = (imageSize.height + titleSize.height + self.spacing);
//        self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height - self.verticalOffset), 0, 0, - titleSize.width);
//        self.titleEdgeInsets = UIEdgeInsetsMake(self.verticalOffset, - imageSize.width, - (totalHeight - titleSize.height), 0);
//    } else {
//        self.imageEdgeInsets = UIEdgeInsetsZero;
//        self.titleEdgeInsets = UIEdgeInsetsZero;
//    }
    
}
- (void)setBadge:(NSInteger)badge {
    _badge = badge;
    [self updateBadge];
}
- (void)updateBadge {
    if (self.badge == 0) {
        self.badgeButton.hidden = YES;
    } else {
        NSString *badgeStr = @(self.badge).stringValue;
        if (self.badge > 99) {
            badgeStr = @"99+";
        } else if (self.badge < -99) {
            badgeStr = @"-99+";
        }
        CGSize selfSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:@{NSFontAttributeName : self.titleLabel.font}
                                             context:nil].size;

        
        CGSize size = [badgeStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:@{NSFontAttributeName : self.badgeButton.titleLabel.font}
                                             context:nil].size;
        CGFloat width = ceilf(size.width) + 2;
        CGFloat height = ceilf(size.height) + 2;
        width = MAX(width, height);
        self.badgeButton.frame = CGRectMake(self.width/2+selfSize.width/2 - width/2 + 5,
                                            2,
                                            width,
                                            height);
        self.badgeButton.layer.cornerRadius = self.badgeButton.bounds.size.height / 2;
        [self.badgeButton setTitle:badgeStr forState:UIControlStateNormal];
        self.badgeButton.hidden = NO;
    }

}
@end
