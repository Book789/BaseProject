//
//  LHVIew.m
//  Project
//
//  Created by a on 2022/5/30.
//

#import "LHSegmentedView.h"

@interface LHSegmentedView ()

/**
 TabItem选中切换时，是否显示动画
 */
@property (nonatomic, assign) BOOL itemSelectedBgSwitchAnimated;

@property (nonatomic, strong) UIScrollView *scrollView;

/**
 item 选中背景图片 或下标横线
 */
@property (nonatomic, strong) UIImageView *itemSelectedBgImageView;
/**
 
 */
@property (nonatomic, assign) CGFloat itemWidth;

/**
 是否字体适应宽度
 */
@property (nonatomic, assign) BOOL itemFitTextWidth;

@property (nonatomic, assign) CGFloat itemFitTextWidthSpacing;

@end

@implementation LHSegmentedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _itemColorChangeFollowContentScroll = YES;
        _itemFontChangeFollowContentScroll = YES;
        _selectedItemIndex = -1;

//        _itemTitleSelectedFont = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
//        self.itemTitleFont = [UIFont systemFontOfSize:14];


    }
    return self;
}
-(UIImageView*)itemSelectedBgImageView {
    if (!_itemSelectedBgImageView) {
        _itemSelectedBgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _itemSelectedBgImageView;
}

-(void)setItems:(NSArray<LHItem *> *)items{
    // 将老的item从superview上删除
    [_items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _items = [items copy];
    
    // 初始化每一个item
    for (LHItem *item in self.items) {
        item.titleColor = self.itemTitleColor;
        item.titleSelectedColor = self.itemTitleSelectedColor;
        item.titleFont = self.itemTitleFont;
        item.badge = 5;
        
//        [item setContentHorizontalCenterWithVerticalOffset:5 spacing:5];
//
//        item.badgeTitleFont = self.badgeTitleFont;
//        item.badgeTitleColor = self.badgeTitleColor;
//        item.badgeBackgroundColor = self.badgeBackgroundColor;
//        item.badgeBackgroundImage = self.badgeBackgroundImage;
        
//        [item setNumberBadgeMarginTop:self.numberBadgeMarginTop
//                    centerMarginRight:self.numberBadgeCenterMarginRight
//                  titleHorizonalSpace:self.numberBadgeTitleHorizonalSpace
//                   titleVerticalSpace:self.numberBadgeTitleVerticalSpace];
//        [item setDotBadgeMarginTop:self.dotBadgeMarginTop
//                 centerMarginRight:self.dotBadgeCenterMarginRight
//                        sideLength:self.dotBadgeSideLength];
        //添加双击事件
        [item addTarget:self action:@selector(praiseBtnRepeatTapped:) forControlEvents:UIControlEventTouchDownRepeat];
        
        [item addTarget:self action:@selector(tabItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 更新每个item的位置
    [self updateItemsFrame];
    
    // 更新item的大小缩放
    [self updateItemsScaleIfNeeded];

}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self updateItemsFrame];
    [self updateFrameOfSelectedBgWithIndex:self.selectedItemIndex];
//    [self updateSeperators];
    if (self.scrollView) {
        self.scrollView.frame = self.bounds;
    }
}
- (void)updateItemsFrame {
    if (self.items.count == 0) {
        return;
    }
    // 将item从superview上删除
    [self.items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 将item的选中背景从superview上删除
    [self.itemSelectedBgImageView removeFromSuperview];

    if (self.scrollView) {
        // 支持滚动
        [self.scrollView addSubview:self.itemSelectedBgImageView];
        CGFloat x = self.leftAndRightSpacing;
        for (int i = 0; i < self.items.count; i++) {
            LHItem *item = self.items[i];
            CGFloat width = 0;
            // item的宽度为一个固定值
            if (self.itemWidth > 0) {
                width = self.itemWidth;
            }
            // item的宽度为根据字体大小和spacing进行适配
            if (self.itemFitTextWidth) {
                CGSize size = [item.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                    attributes:@{NSFontAttributeName : self.itemTitleSelectedFont}
                                                       context:nil].size;
                width = ceilf(size.width) + self.itemFitTextWidthSpacing;
            }
            
            item.frame = CGRectMake(x, 0, width, self.frame.size.height);
            item.tag = i;
            x += width;
            [self.scrollView addSubview:item];
        }
        self.scrollView.contentSize = CGSizeMake(x + self.leftAndRightSpacing, self.scrollView.frame.size.height);
        [self setSelectedItemCenter];
    } else {
        // 不支持滚动
        [self addSubview:self.itemSelectedBgImageView];
        CGFloat x = self.leftAndRightSpacing;
        CGFloat itemWidth = (self.frame.size.width - self.leftAndRightSpacing * 2) / self.items.count;
        for (int i = 0; i < self.items.count; i++) {
            LHItem *item = self.items[i];
            item.frame = CGRectMake(x, 0, itemWidth, self.frame.size.height);
            item.tag = i;
            
            x += itemWidth;
            [self addSubview:item];
        }
    }
}
- (void)updateItemsScaleIfNeeded {
    if (self.itemTitleSelectedFont &&
        self.itemFontChangeFollowContentScroll &&
        self.itemTitleSelectedFont.pointSize != self.itemTitleFont.pointSize) {
        [self.items makeObjectsPerformSelector:@selector(setTitleFont:) withObject:self.itemTitleSelectedFont];
        for (LHItem *item in self.items) {
            if (!item.selected) {
                item.transform = CGAffineTransformMakeScale(self.itemTitleUnselectedFontScale,
                                                            self.itemTitleUnselectedFontScale);
            }
        }
    }
}


- (void)setSelectedItemIndex:(NSInteger)selectedItemIndex {
    if (self.items.count == 0 || selectedItemIndex < 0 || selectedItemIndex >= self.items.count) {
        return;
    }
    
    if (_selectedItemIndex >= 0) {
        LHItem *oldSelectedItem = self.items[_selectedItemIndex];
        oldSelectedItem.selected = NO;
        if (self.itemFontChangeFollowContentScroll) {
            // 如果支持字体平滑渐变切换，则设置item的scale
            oldSelectedItem.transform = CGAffineTransformMakeScale(self.itemTitleUnselectedFontScale,
                                                                   self.itemTitleUnselectedFontScale);
        } else {
            // 如果支持字体平滑渐变切换，则直接设置字体
            oldSelectedItem.titleFont = self.itemTitleFont;
        }
    }
    
    LHItem *newSelectedItem = self.items[selectedItemIndex];
    newSelectedItem.selected = YES;
    if (self.itemFontChangeFollowContentScroll) {
        // 如果支持字体平滑渐变切换，则设置item的scale
        newSelectedItem.transform = CGAffineTransformMakeScale(1, 1);
    } else {
        // 如果支持字体平滑渐变切换，则直接设置字体
        if (self.itemTitleSelectedFont) {
            newSelectedItem.titleFont = self.itemTitleSelectedFont;
        }
    }
    
//    NSLog(@"itemSelectedBgScrollFollowContent-->%d", self.itemSelectedBgScrollFollowContent);
    if (self.itemSelectedBgScrollFollowContent) {
        // item的选中背景位置会跟随contentView的拖动进行变化
        if (_selectedItemIndex < 0) {
            // 仅在首次显示的时候更新它的位置，之后会根据contentView的拖动进行移动
            [self updateFrameOfSelectedBgWithIndex:selectedItemIndex];
        }
    } else {
        // item的选中背景位置不会跟随contentView的拖动进行变化
        
        if (self.itemSelectedBgSwitchAnimated && _selectedItemIndex >= 0) {
            [UIView animateWithDuration:0.25f animations:^{
                [self updateFrameOfSelectedBgWithIndex:selectedItemIndex];
            }];
        } else {
            [self updateFrameOfSelectedBgWithIndex:selectedItemIndex];
        }
    }

    if ([self.delegate respondsToSelector:@selector(segmentdView:didSelectedItemAtIndex:)]) {
        [self.delegate segmentdView:self didSelectedItemAtIndex:selectedItemIndex];
    }
    _selectedItemIndex = selectedItemIndex;
    // 如果tabbar支持滚动，将选中的item放到tabbar的中央
    [self setSelectedItemCenter];
}
- (void)updateFrameOfSelectedBgWithIndex:(NSInteger)index {
    if (index < 0) {
        return;
    }
    LHItem *item = self.items[index];
    CGFloat width = item.frameWithOutTransform.size.width - self.itemSelectedBgInsets.left - self.itemSelectedBgInsets.right;
    CGFloat height = item.frameWithOutTransform.size.height - self.itemSelectedBgInsets.top - self.itemSelectedBgInsets.bottom;
    self.itemSelectedBgImageView.frame = CGRectMake(item.frameWithOutTransform.origin.x + self.itemSelectedBgInsets.left,
                                                    item.frameWithOutTransform.origin.y + self.itemSelectedBgInsets.top,
                                                    width,
                                                    height);
}
-(void)setItemSelectedBgInsets:(UIEdgeInsets)itemSelectedBgInsets{
    _itemSelectedBgInsets = itemSelectedBgInsets;

}
- (void)setSelectedItemCenter{
    if (!self.scrollView) {
        return;
    }
    // 修改偏移量
    CGFloat offsetX = self.selectedItem.center.x - self.scrollView.frame.size.width * 0.5f;
    
    // 处理最小滚动偏移量
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    // 处理最大滚动偏移量
    CGFloat maxOffsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"scrollViewDidEndDecelerating");
    self.selectedItemIndex = page;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat scrollViewWidth = scrollView.frame.size.width;
    if (offsetX < 0) {
        return;
    }
    if (offsetX > scrollView.contentSize.width - scrollViewWidth) {
        return;
    }
    
    NSInteger leftIndex = offsetX / scrollViewWidth;
    NSInteger rightIndex = leftIndex + 1;
    LHItem *leftItem = self.items[leftIndex];
    LHItem *rightItem;
    if (rightIndex < self.items.count) {
        rightItem = self.items[rightIndex];
    }
    
    // 计算右边按钮偏移量
    CGFloat rightScale = offsetX / scrollViewWidth;
    // 只想要 0~1
    rightScale = rightScale - leftIndex;
    CGFloat leftScale = 1 - rightScale;
    
    if (scrollView.isDragging || scrollView.isDecelerating) {
        if (self.itemFontChangeFollowContentScroll && self.itemTitleUnselectedFontScale != 1.0f) {
            CGFloat diff = self.itemTitleUnselectedFontScale - 1;
            leftItem.transform = CGAffineTransformMakeScale(rightScale * diff + 1, rightScale * diff + 1);
            rightItem.transform = CGAffineTransformMakeScale(leftScale * diff + 1, leftScale * diff + 1);
        }
        
        if (self.itemColorChangeFollowContentScroll) {
            static CGFloat normalRed, normalGreen, normalBlue;
            static CGFloat selectedRed, selectedGreen, selectedBlue;
            [self.itemTitleColor getRed:&normalRed green:&normalGreen blue:&normalBlue alpha:nil];
            [self.itemTitleSelectedColor getRed:&selectedRed green:&selectedGreen blue:&selectedBlue alpha:nil];
            // 获取选中和未选中状态的颜色差值
            CGFloat redDiff = selectedRed - normalRed;
            CGFloat greenDiff = selectedGreen - normalGreen;
            CGFloat blueDiff = selectedBlue - normalBlue;
            // 根据颜色值的差和偏移量，设置tabItem的标题颜色
            leftItem.titleLabel.textColor = [UIColor colorWithRed:leftScale * redDiff + normalRed
                                                            green:leftScale * greenDiff + normalGreen
                                                             blue:leftScale * blueDiff + normalBlue
                                                            alpha:1];
            rightItem.titleLabel.textColor = [UIColor colorWithRed:rightScale * redDiff + normalRed
                                                             green:rightScale * greenDiff + normalGreen
                                                              blue:rightScale * blueDiff + normalBlue
                                                             alpha:1];
        }
    }
    if (self.itemSelectedBgScrollFollowContent) {
        CGRect frame = self.itemSelectedBgImageView.frame;
        CGFloat xDiff = rightItem.frameWithOutTransform.origin.x - leftItem.frameWithOutTransform.origin.x;
        frame.origin.x = rightScale * xDiff + leftItem.frameWithOutTransform.origin.x + self.itemSelectedBgInsets.left;
        
        CGFloat widthDiff = rightItem.frameWithOutTransform.size.width - leftItem.frameWithOutTransform.size.width;
        if (widthDiff != 0) {
            CGFloat leftSelectedBgWidth = leftItem.frameWithOutTransform.size.width - self.itemSelectedBgInsets.left - self.itemSelectedBgInsets.right;
            frame.size.width = rightScale * widthDiff + leftSelectedBgWidth;
        }
        
        self.itemSelectedBgImageView.frame = frame;
    }
}
- (void)praiseBtnRepeatTapped:(LHItem *)btn
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(doubleTapItem:) object:btn];
    [self doubleTapItem:btn];
}

//点击两次
- (void)doubleTapItem:(LHItem *)item {
    if ([self.delegate respondsToSelector:@selector(segmentdView:didDoubleTapItemAtIndex:)]) {
        [self.delegate segmentdView:self didDoubleTapItemAtIndex:item.tag];
    }
}

- (void)tabItemClicked:(LHItem *)item {
    if (self.selectedItemIndex == item.tag) {
        return;
    }
    BOOL will = YES;
    if ([self.delegate respondsToSelector:@selector(segmentdView:willSelectItemAtIndex:)]) {
        will = [self.delegate segmentdView:self willSelectItemAtIndex:item.tag];
    }
    if (will) {
        self.selectedItemIndex = item.tag;
    }
}

- (void)setItemTitleSelectedFont:(UIFont *)itemTitleSelectedFont {
    _itemTitleSelectedFont = itemTitleSelectedFont;
    self.selectedItem.titleFont = itemTitleSelectedFont;
    [self updateItemsScaleIfNeeded];
}
- (void)setScrollEnabledAndItemWidth:(CGFloat)width {
    if (!self.scrollView) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.scrollView];
    }
    self.itemWidth = width;
    self.itemFitTextWidth = NO;
    self.itemFitTextWidthSpacing = 0;
    [self updateItemsFrame];
}

- (void)setScrollEnabledAndItemFitTextWidthWithSpacing:(CGFloat)spacing {
    if (!self.scrollView) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.scrollView];
    }
    self.itemFitTextWidth = YES;
    self.itemFitTextWidthSpacing = spacing;
    self.itemWidth = 0;
    [self updateItemsFrame];
}
/**
 *  获取未选中字体与选中字体大小的比例
 */
- (CGFloat)itemTitleUnselectedFontScale {
    if (_itemTitleSelectedFont) {
        return self.itemTitleFont.pointSize / _itemTitleSelectedFont.pointSize;
    }
    return 1.0f;
}
- (LHItem *)selectedItem {
    if (self.selectedItemIndex < 0) {
        return nil;
    }
    return self.items[self.selectedItemIndex];
}

#pragma mark - ItemTitle

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    _itemTitleColor = itemTitleColor;
    [self.items makeObjectsPerformSelector:@selector(setTitleColor:) withObject:itemTitleColor];
}

- (void)setItemTitleSelectedColor:(UIColor *)itemTitleSelectedColor {
    _itemTitleSelectedColor = itemTitleSelectedColor;
    [self.items makeObjectsPerformSelector:@selector(setTitleSelectedColor:) withObject:itemTitleSelectedColor];
}
- (void)gradientWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(GradientType)type {
    
    self.itemSelectedBgImageView.image = [UIImage createImageWithSize:btnSize gradientColors:clrs percentage:percent gradientType:type];
    
}

@end
