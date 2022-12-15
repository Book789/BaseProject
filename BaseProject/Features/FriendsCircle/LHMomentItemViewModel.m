//
//  LHMomentItemViewModel.m
//  Project
//
//  Created by a on 2022/4/27.
//

#import "LHMomentItemViewModel.h"
#import "LHUserModel.h"
#import "NSMutableAttributedString+MHMoment.h"
#import "LHConstant.h"

@implementation LHMomentItemViewModel

- (instancetype)initWithMoment:(LHMoment *)moment{
    if (self = [super init]) {
        /// 内容宽度
        CGFloat limitWidth = LHMomentCommentViewWidth();
        
        /// 单行文字公有一个container
        YYTextContainer *singleRowContainer = [YYTextContainer containerWithSize:YYTextContainerMaxSize];
        singleRowContainer.maximumNumberOfRows = 1;
        
        /// 高亮背景
        YYTextBorder *border = [YYTextBorder new];
        border.cornerRadius = 0;
        border.insets = UIEdgeInsetsMake(0, -1, 0, -1);
        border.fillColor = MHMomentTextHighlightBackgroundColor;
        
        /// ----------- 模型属性 -----------
        self.moment = moment;
        
        /// 昵称
        if (!kStringIsEmpty(moment.user.nickname)) {
            /// 富文本
            NSMutableAttributedString *screenNameAttr = [[NSMutableAttributedString alloc] initWithString:moment.user.nickname];
            screenNameAttr.yy_font = kMainFontSize(16);
            screenNameAttr.yy_color = MHMomentScreenNameTextColor;
            screenNameAttr.yy_lineBreakMode = NSLineBreakByCharWrapping;
            screenNameAttr.yy_alignment = NSTextAlignmentLeft;
            /// 设置高亮
            YYTextHighlight *highlight = [YYTextHighlight new];
            /// 传递点击事件需要的数据
//            highlight.userInfo = @{LHMomentUserInfoKey:moment.user};
            [highlight setBackgroundBorder:border];
            [screenNameAttr yy_setTextHighlight:highlight range:screenNameAttr.yy_rangeOfAll];
            /// 实现布局好宽高 以及属性
            YYTextContainer *screenNameLableContainer = [YYTextContainer containerWithSize:CGSizeMake(limitWidth, MAXFLOAT)];
            screenNameLableContainer.maximumNumberOfRows = 1;
            YYTextLayout *screenNameLableLayout = [YYTextLayout layoutWithContainer:screenNameLableContainer text:screenNameAttr.copy];
            self.screenNameLableLayout = screenNameLableLayout;
        }
        
        /// 正文有值
        if (!kStringIsEmpty(moment.text)){
            NSMutableAttributedString *textAttr = [[NSMutableAttributedString alloc] initWithString:moment.text];
            textAttr.yy_font = kMainFontSize(16);
            textAttr.yy_color = MHMomentContentTextColor;
            textAttr.yy_lineBreakMode = NSLineBreakByCharWrapping;
            textAttr.yy_alignment = NSTextAlignmentLeft;
            
            /// 去正则匹配
            [textAttr mh_regexContentWithWithEmojiImageFontSize:15];
            
            /// 实现布局好宽高 以及属性
            /// PS:用这个方法计算尺寸 要比 [self.textAttr mh_sizeWithLimitWidth:limitWidth]这个计算的值要准确的多
            YYTextContainer *contentLableContainer = [YYTextContainer containerWithSize:CGSizeMake(limitWidth, MAXFLOAT)];
            contentLableContainer.maximumNumberOfRows = 0;
            YYTextLayout *contentLableLayout = [YYTextLayout layoutWithContainer:contentLableContainer text:textAttr.copy];
            self.contentLableLayout = contentLableLayout;
        }
        
//        /// 配图
        self.picInfos = [moment.picInfos.rac_sequence map:^MHMomentPhotoItemViewModel *(MHPicture * picture) {
            MHMomentPhotoItemViewModel *viewModel = [[MHMomentPhotoItemViewModel alloc] initWithPicture:picture];
            return viewModel;
        }].array;
        
        
        /// 位置
        if (!kStringIsEmpty(self.moment.location)) {
            /// 富文本
            NSMutableAttributedString *location  = [[NSMutableAttributedString alloc] initWithString:self.moment.location];
            location.yy_font = kMainFontSize(16);
            location.yy_color = MHMomentScreenNameTextColor;
            /// 高亮
            YYTextHighlight *highlight = [YYTextHighlight new];
            [highlight setBackgroundBorder:border];
            /// 传递数据
//            highlight.userInfo = @{LHMomentLocationNameKey : self.moment.location};
            [location yy_setTextHighlight:highlight range:location.yy_rangeOfAll];
            /// 布局
            YYTextLayout *locationLableLayout = [YYTextLayout layoutWithContainer:singleRowContainer text:location.copy];
            self.locationLableLayout = locationLableLayout;
        }
        
        /// 来源(考虑到来源可能会被电击 这里设置为富文本)
        if (!kStringIsEmpty(self.moment.source)) {
            NSMutableAttributedString *source  = [[NSMutableAttributedString alloc] initWithString:self.moment.source];
            source.yy_font = kMainFontSize(16);
            source.yy_color = MHMomentCreatedAtTextColor;
            if (self.moment.sourceAllowClick > 0 && self.moment.sourceUrl.length>0) {
                /// 允许点击
                source.yy_color = MHMomentScreenNameTextColor;
                YYTextHighlight *highlight = [YYTextHighlight new];
                [highlight setBackgroundBorder:border];
                /// 传递数据
//                if (self.moment.sourceUrl) highlight.userInfo = @{LHMomentLinkUrlKey : self.moment.sourceUrl};
                [source yy_setTextHighlight:highlight range:source.yy_rangeOfAll];
            }
            
            YYTextLayout *sourceLableLayout = [YYTextLayout layoutWithContainer:singleRowContainer text:source.copy];
            self.sourceLableLayout = sourceLableLayout;
        }

        //// 点赞列表
//        if(self.moment.attitudesList.count>0){
//            /// 需要
//            MHMomentAttitudesItemViewModel *attitudes = [[MHMomentAttitudesItemViewModel alloc] initWithMoment:moment];
//            [self.dataSource addObject:attitudes];
//
//        }
//        if (self.moment.commentsList.count>0) {
//            [self.dataSource addObjectsFromArray:[self.moment.commentsList.rac_sequence map:^MHMomentCommentItemViewModel *(MHComment * comment) {
//                MHMomentCommentItemViewModel *viewModel = [[MHMomentCommentItemViewModel alloc] initWithComment:comment];
//                return viewModel;
//            }].array];
//        }
        
        
        /// ----------- 尺寸属性 -----------
        /// 头像
        CGFloat avatarViewX = 15;
        CGFloat avatarViewY = 15;
        CGFloat avatarViewW = LHMomentAvatarWH;
        CGFloat avatarViewH = LHMomentAvatarWH;
        self.avatarViewFrame = CGRectMake(avatarViewX, avatarViewY, avatarViewW, avatarViewH);
        
        /// 昵称
        CGFloat screenNameLableX = CGRectGetMaxX(self.avatarViewFrame)+LHMomentContentInnerMargin;
        CGFloat screenNameLableY = avatarViewY;
        CGFloat screenNameLableW = self.screenNameLableLayout.textBoundingSize.width;
        CGFloat screenNameLableH = self.screenNameLableLayout.textBoundingSize.height;
        self.screenNameLableFrame = CGRectMake(screenNameLableX, screenNameLableY, screenNameLableW, screenNameLableH);
  
        /// 由于要点击 全文/展开 更新子控件的尺寸 , 故抽取出来
        [self _updateSubviewsFrameWithExpand:NO];
        
        ////  ---------- 初始化单条说说的上的所有事件处理 ------------
//        [self initialize];
    }
    return self;
}
/**
 更新内部控件尺寸模型 （点击全文or收起）
 @param expand 全文/收起
 */
- (void)_updateSubviewsFrameWithExpand:(BOOL)expand{
    
    self.expand = expand;
    
    CGFloat limitWidth = LHMomentCommentViewWidth();
    
    /// 正文
    CGFloat contentLableX = self.screenNameLableFrame.origin.x;
    /// -4 修正间距
    CGFloat contentLableY = CGRectGetMaxY(self.screenNameLableFrame)+LHMomentContentInnerMargin-4;
    /// 需要计算正文的size default 正文为空
    CGSize contentLableSize = CGSizeZero;
    
    /// 全文/收起按钮
    CGFloat expandBtnX = contentLableX;
    /// 这里事先设置
    CGFloat expandBtnY = contentLableY;
    CGFloat expandBtnW = MHMomentExpandButtonWidth;
    CGFloat expandBtnH = 0;
    
    /// 这里要分情况
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(limitWidth, MAXFLOAT)];
    YYTextLayout *layout = nil;
    if (!kStringIsEmpty(self.moment.text)) {
        
        /// 显示部分正文 （按钮显示 `全文`）(默认是全部显示)
        contentLableSize = self.contentLableLayout.textBoundingSize;
        
        /// 计算尺寸
        /// 首先判断是否大于正文显示行数的是否超过最大允许的最大行数值
        /// PS： 目前还没有做
        if (self.contentLableLayout.rowCount > LHMomentContentTextMaxCriticalRow) {
            /// 容错
            self.expand = NO;
            /// 就显示单行
            container.maximumNumberOfRows = 1;
            layout = [YYTextLayout layoutWithContainer:container text:self.contentLableLayout.text];
            /// 全文/收起 高度为0
            expandBtnH = .0f;
        }else if(self.contentLableLayout.rowCount > LHMomentContentTextMaxCriticalRow){
            /// 重新计算
            if(!expand){
                /// 点击收起 -- 显示全文
                container.maximumNumberOfRows = LHMomentContentTextMaxCriticalRow;
                layout = [YYTextLayout layoutWithContainer:container text:self.contentLableLayout.text];
                contentLableSize = layout.textBoundingSize;
            }
            /// 全文/收起 高度
            expandBtnH = MHMomentExpandButtonHeight;
        }
        
        /// 全文/收起Y
        expandBtnY = contentLableY + contentLableSize.height +LHMomentContentInnerMargin;
    }

    /// 正文
    self.contentLableFrame = CGRectMake(contentLableX, contentLableY, contentLableSize.width, contentLableSize.height);
    
    /// 全文/收起
    self.expandBtnFrame = CGRectMake(expandBtnX, expandBtnY, expandBtnW, expandBtnH);
    
    /// pictureView
    CGFloat pictureViewX = contentLableX;
    CGFloat pictureViewTopMargin = (expandBtnH>0)?LHMomentContentInnerMargin:0;
    CGFloat pictureViewY = CGRectGetMaxY(self.expandBtnFrame)+pictureViewTopMargin;
    CGSize pictureViewSize = [self _pictureViewSizeWithPhotosCount:self.moment.picInfos.count];
    
    self.photosViewFrame = (CGRect){{pictureViewX , pictureViewY},pictureViewSize};
    /// 分享View
//    self.shareInfoViewFrame = (self.moment.type == MHMomentExtendTypeShare) ? CGRectMake(pictureViewX, pictureViewY, (MH_SCREEN_WIDTH - pictureViewX - MHMomentContentLeftOrRightInset) , MHMomentShareInfoViewHeight) : CGRectZero;
    
    /// videoView
    self.videoViewFrame = (self.moment.type == MHMomentExtendTypeVideo) ? CGRectMake(pictureViewX, pictureViewY, LHMomentVideoViewWidth , LHMomentVideoViewHeight) : CGRectZero;
    
    /// 地理位置
    CGFloat locationLableX = contentLableX;
    /// 顶部
    CGFloat locationLabelTopMargin = (pictureViewSize.height>0)?LHMomentContentInnerMargin:0;
    
    /// 计算高度
    CGFloat locationLableTempMaxY = CGRectGetMaxY(self.photosViewFrame);
    CGFloat locationLableY = MAX(locationLableTempMaxY, CGRectGetMaxY(self.videoViewFrame))+locationLabelTopMargin;
    self.locationLableFrame = CGRectMake(locationLableX, locationLableY, self.locationLableLayout.textBoundingSize.width, self.locationLableLayout.textBoundingSize.height);
    
    
    /// 更多按钮
    CGFloat operationMoreBtnX = kScreenWidth - LHMomentContentLeftOrRightInset - LHMomentOperationMoreBtnWH +(LHMomentOperationMoreBtnWH - 25)*.5f;
    CGFloat operationMoreBtnTopMargin = (self.locationLableFrame.size.height>0)?(LHMomentContentInnerMargin-5):0;
    CGFloat operationMoreBtnY = CGRectGetMaxY(self.locationLableFrame)+operationMoreBtnTopMargin;
    CGFloat operationMoreBtnW = LHMomentOperationMoreBtnWH;
    CGFloat operationMoreBtnH = LHMomentOperationMoreBtnWH;
    self.operationMoreBtnFrame = CGRectMake(operationMoreBtnX, operationMoreBtnY, operationMoreBtnW, operationMoreBtnH);

    /// 评论or点赞 向上箭头 (由于评论Or点赞成功 headerView高度都会变化 ，故需要抽出去)
    [self _updateUpArrowViewFrameForOperationMoreChanged];
}

- (void)updateUpArrow{
    [self _updateUpArrowViewFrameForOperationMoreChanged];
}

/// 由于更多按钮的事件生效（PS：点赞成功/失败 Or 评论成功/失败）都会导致headerView的高度changeed
- (void)_updateUpArrowViewFrameForOperationMoreChanged
{
    BOOL isAllowShowUpArrowView = (self.moment.commentsList.count>0||self.moment.attitudesList.count>0);
    
    CGFloat upArrowViewX = self.screenNameLableFrame.origin.x;
    /// -5是为了适配
    CGFloat upArrowViewTopMargin = isAllowShowUpArrowView?(LHMomentContentInnerMargin-5):0;
    CGFloat upArrowViewY = CGRectGetMaxY(self.operationMoreBtnFrame)+upArrowViewTopMargin;
    CGFloat upArrowViewW = LHMomentUpArrowViewWidth;
    CGFloat upArrowViewH = isAllowShowUpArrowView?LHMomentUpArrowViewHeight:0;
    self.upArrowViewFrame = CGRectMake(upArrowViewX, upArrowViewY, upArrowViewW, upArrowViewH);
    
    /// 整个header的高度
    self.height = CGRectGetMaxY(self.upArrowViewFrame);
}

/// pictureView的整体size
- (CGSize)_pictureViewSizeWithPhotosCount:(NSUInteger)photosCount{
    // 0张图 CGSizeZero
    if (photosCount==0) return CGSizeZero;
    
    /// 考虑屏幕尺寸为 320的情况
    CGFloat pictureViewItemWH = LHMomentPhotosViewItemWidth();
    
    /// 这里需要考虑一张图片等比显示的情况
    if(photosCount==1){
        CGSize picSize = CGSizeZero;
        CGFloat maxWidth = LHMomentPhotosViewSingleItemMaxWidth();
        CGFloat maxHeight = MHMomentPhotosViewSingleItemMaxHeight;
        
        MHPicture *pic = self.moment.picInfos.firstObject;
        MHPictureMetadata *bmiddle = pic.bmiddle;
        
        if (pic.keepSize || bmiddle.width < 1 || bmiddle.height < 1) {
            /// 固定方形
            picSize = CGSizeMake(maxWidth, maxWidth);
        } else {
            /// 等比显示
            if (bmiddle.width < bmiddle.height) {
                picSize.width = (float)bmiddle.width / (float)bmiddle.height * maxHeight;
                picSize.height = maxHeight;
            } else {
                picSize.width = maxWidth;
                picSize.height = (float)bmiddle.height / (float)bmiddle.width * maxWidth;
            }
        }
        return picSize;
    }

    /// 大于1的情况 统统显示 九宫格样式
    NSUInteger maxCols = LHMomentMaxCols(photosCount);
    
    // 总列数
    NSUInteger totalCols = photosCount >= maxCols ?  maxCols : photosCount;
    
    // 总行数
    NSUInteger totalRows = (photosCount + maxCols - 1) / maxCols;
    
    // 计算尺寸
    CGFloat photosW = totalCols * pictureViewItemWH + (totalCols - 1) * MHMomentPhotosViewItemInnerMargin;
    CGFloat photosH = totalRows * pictureViewItemWH + (totalRows - 1) * MHMomentPhotosViewItemInnerMargin;
    return CGSizeMake(photosW, photosH);
}


@end
