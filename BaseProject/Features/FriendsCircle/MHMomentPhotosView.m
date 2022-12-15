//
//  MHMomentPhotosView.m
//  MHDevelopExample
//
//  Created by senba on 2017/7/7.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "MHMomentPhotosView.h"
#import "MHMomentPhotoView.h"
#import "LHMomentItemViewModel.h"


#define MHMomentMaxCols(__photosCount) ((__photosCount==4)?2:3)

@interface MHMomentPhotosView ()
/// viewModel
@property (nonatomic, readwrite, strong) LHMomentItemViewModel *viewModel;
@end

@implementation MHMomentPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 预先创建9个图片控件 避免动态创建
        for (int i = 0; i<9; i++) {
            UIImageView *photoView = [[UIImageView alloc] init];
            photoView.backgroundColor = self.backgroundColor;
            photoView.hidden = YES;
            photoView.contentMode = UIViewContentModeScaleAspectFill;
            photoView.userInteractionEnabled = YES;
            photoView.tag = i;
            [self addSubview:photoView];
            
            // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(_tapPhoto:)];
            [photoView addGestureRecognizer:recognizer];
        }
    }
    return self;
}


/// bind data
- (void)bindViewModel:(LHMomentItemViewModel *)viewModel{

    self.viewModel = viewModel;
    
    CGFloat photoViewWH = LHMomentPhotosViewItemWidth();
    
    /// 设置显示or隐藏以及布局
    NSUInteger count =  viewModel.picInfos.count;
    
    if (count==0) [self _hideAllImageViews];
    
    int maxCols = MHMomentMaxCols(count);
    for (int i = 0; i<9; i++) {
        MHMomentPhotoView *photoView = self.subviews[i];
        
        if (i < count)
        {
            /// 显示隐藏
            photoView.hidden = NO;
            
            if(count == 1)
            {   /// 一张图的情况
                photoView.frame = self.bounds;
            }else{
                /// 其他情况
                photoView.width = photoViewWH;
                photoView.height = photoViewWH;
                photoView.x = (i % maxCols) * (photoViewWH + MHMomentPhotosViewItemInnerMargin);
                photoView.y = (i / maxCols) * (photoViewWH + MHMomentPhotosViewItemInnerMargin);
            }
            // 绑定数据viewModel.picture.bmiddle.url
//            [photoView yy_setImageWithURL:viewModel.picInfos[i].picture.bmiddle.url
// placeholder:[UIImage imageNamed:@"9ccc7942jw1e8qgp5bmzyj2050050aa8.jpg"]];
////            [photoView bindViewModel:viewModel.picInfos[i]];
            @weakify(self)
                [photoView yy_setImageWithURL:viewModel.picInfos[i].picture.bmiddle.url
                                   placeholder:[UIImage imageNamed:@"9ccc7942jw1e8qgp5bmzyj2050050aa8.jpg"]                        options:YYWebImageOptionProgressive
                                    completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                                          @strongify(self);

//                                          if (image && stage == YYWebImageStageFinished) {
//                                              int width = viewModel.picInfos[i].picture.bmiddle.width;
//                                              int height = viewModel.picInfos[i].picture.bmiddle.height;
//                                              CGFloat scale = (height / width) / (self.height / self.width);
//                                              if (scale < 0.99 || isnan(scale)) {
//                                                  // 宽图把左右两边裁掉
//                                                  self.contentMode = UIViewContentModeScaleAspectFill;
//                                                  self.layer.contentsRect = CGRectMake(0, 0, 1, 1);
//                                              } else {
//                                                  // 高图只保留顶部
//                                                  self.contentMode = UIViewContentModeScaleToFill;
//                                                  self.layer.contentsRect = CGRectMake(0, 0, 1, (float)width / height);
//                                              }
////                                              self.image = image;
//                                              self.layer.contents = (id)image.CGImage;
//                                              if (from != YYWebImageFromMemoryCacheFast) {
//                                                  CATransition *transition = [CATransition animation];
//                                                  transition.duration = 0.15;
//                                                  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//                                                  transition.type = kCATransitionFade;
//                                                  [self.layer addAnimation:transition forKey:@"contents"];
//                                              }
//                                          }
                                      }];

            
        } else {
            // 隐藏
            /// 这里我重写了子控件的 hidden方法 目的是取消 图片下载请求
            photoView.hidden = YES;
        }
    }
    
}

/// 隐藏所有图片
- (void)_hideAllImageViews {
    for (MHMomentPhotoView *imageView in self.subviews) {
        imageView.hidden = YES;
    }
}

#pragma mark - 事件处理
- (void)_tapPhoto:(UITapGestureRecognizer *)sender{
    
    NSMutableArray * photos= [NSMutableArray array];
    [self.viewModel.picInfos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MHMomentPhotoItemViewModel * model = obj;
        [photos addObject:model.picture.bmiddle.url];
    }];
    if (self.photosImgClickBlock) {
        self.photosImgClickBlock(photos, sender.view.tag);
    }


}


@end
