//
//  GraffitiView.m
//  Project
//
//  Created by a on 2022/5/11.
//

#import "GraffitiView.h"
#import "CustomerBezierPath.h"

#define kMaxGraffitiGiftCount  300
#define kGiftWidth  32
#define kGiftDistance  32
@interface GraffitiView()

@property(nonatomic,strong)UIView * grafiitiTipView;

@property (nonatomic, strong) NSMutableArray *lineArray;

@property (nonatomic, assign) CGPoint upPoint;

@property (nonatomic, strong) NSMutableArray<NSMutableArray *> *imageArray;

@property (nonatomic, assign) NSInteger countGiftCount;

@end

@implementation GraffitiView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.grafiitiTipView];
        [self.grafiitiTipView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
- (UIView *)grafiitiTipView {
    if (!_grafiitiTipView) {
        _grafiitiTipView = [[UIView alloc] initWithFrame:CGRectZero];
        UIImageView *tipImage = [UIImageView new];
        tipImage.image = [UIImage imageNamed:@"_t_live_icon_gestures daub"];
        [_grafiitiTipView addSubview:tipImage];
        [tipImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(187);
            make.centerX.equalTo(_grafiitiTipView);
            make.width.height.mas_equalTo(110);
        }];
        
        UILabel *tipLabel = [UILabel new];
        tipLabel.textColor = [UIColor whiteColor];
        tipLabel.font = kMainFontSize(12);
        tipLabel.text = @"触摸手绘，创意连连";
        [_grafiitiTipView addSubview:tipLabel];
        [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_grafiitiTipView);
            make.top.equalTo(tipImage.mas_bottom).mas_offset(5);
        }];
    }
    return _grafiitiTipView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
    if (self.isShow) {
        return;
    }
    
    self.grafiitiTipView.hidden = YES;
    
    if (self.countGiftCount >= kMaxGraffitiGiftCount) {
        return;
    }
    
    //1、每次触摸的时候都应该去创建一条贝塞尔曲线
    CustomerBezierPath *path = [CustomerBezierPath new];
//    path.giftItem = self.currentGiftItem;
    NSMutableArray *images = [NSMutableArray array];
    
    //2、移动画笔
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [path moveToPoint:point];
    [self.lineArray addObject:path];
    NSLog(@" ???start %f-%f", point.x, point.y);
    self.upPoint = point;
    [path.pointsArray addObject:[NSValue valueWithCGPoint:point]];
    self.countGiftCount += 1;
    
    YYAnimatedImageView *picImgView = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, kGiftWidth, kGiftWidth)];
    picImgView.backgroundColor = [UIColor clearColor];
//    [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloadSucceed];
//    [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloadFailed];
//    [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloading];
    picImgView.contentMode = UIViewContentModeScaleAspectFill;
//    [picImgView fm_setContentMode:UIViewContentModeScaleAspectFill forRequestState:FM_WebImageDownloadSucceed];
//        if ([[MHLiveGiftManager shareManager] hasDownloadGiftImage:self.currentGiftItem.giftUrl]) { //使用本地图片yyanimateImageView iOS12不支持 ；第一次显示会显示不出来后面才能显示， yy的bug 代码不跑
//            NSURL *url =  [[MHLiveGiftManager shareManager] localGiftImageUrl:self.currentGiftItem.giftUrl];
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            UIImage *image = [UIImage imageWithData:data];
////            [picImgView setImageURL:url];
//            [picImgView setImage:image];
//        } else {

    [picImgView yy_setImageWithURL:[NSURL URLWithString:self.giftUrl] placeholder:nil];
//            [picImgView fm_setImageWithURL:self.currentGiftItem.giftUrl];
//        }
    
    picImgView.center = point;
    [self addSubview:picImgView];
    
    [images addObject:picImgView];
    [self.imageArray addObject:images];
    
    if (self.valueChagneBlock) {
//        self.value += self.currentGiftItem.price.integerValue;
//        self.valueChagneBlock(self.value);
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    if (self.isShow) {
        return;
    }
    
    if (self.countGiftCount >= kMaxGraffitiGiftCount) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //间距
    CGFloat xDist = (self.upPoint.x - point.x);
    CGFloat yDist = (self.upPoint.y - point.y);
    CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist));
    NSLog(@"distance  %f", distance);
    if (distance < kGiftDistance) {
        return;
    }

    CGPoint tempPoint = self.upPoint;
    if (distance >= kGiftDistance) {
        CGFloat r = atan(fabs(yDist/xDist));
        NSLog(@"r %f", r);
        CGFloat x = kGiftDistance * cos(r);
        CGFloat y = kGiftDistance * sin(r);
        
        if (point.x > self.upPoint.x) {
        } else {
            x = -x;
        }
        if (point.y > self.upPoint.y) {
            
        } else {
            y = -y;
        }
        
        NSInteger count = distance / kGiftDistance;
        for (int i = 0; i <count; ++i) {
            CGFloat xDistm = tempPoint.x + x;
            CGFloat yDistm = tempPoint.y + y;
            tempPoint = CGPointMake(xDistm, yDistm);
            
            YYAnimatedImageView *picImgView = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, kGiftWidth, kGiftWidth)];
            picImgView.backgroundColor = [UIColor clearColor];
//            [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloadSucceed];
//            [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloadFailed];
//            [picImgView fm_setBackGroundColor:[UIColor clearColor] forRequestState:FM_WebImageDownloading];
            picImgView.contentMode = UIViewContentModeScaleAspectFill;
//            [picImgView fm_setContentMode:UIViewContentModeScaleAspectFill forRequestState:FM_WebImageDownloadSucceed];
//                if ([[MHLiveGiftManager shareManager] hasDownloadGiftImage:self.currentGiftItem.giftUrl]) {
//                    NSURL *url = [[MHLiveGiftManager shareManager] localGiftImageUrl:self.currentGiftItem.giftUrl];
//                    [picImgView setImageURL:url];
////                    [picImgView setImageWithURL:url placeholder:[UIImage imageNamed:@"_t_live_icon_delete_bef"] options:YYWebImageOptionIgnorePlaceHolder completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
////                        NSLog(@"???4.4.0 lee %@  %@", url, error);
////                    }];
//                } else {

            [picImgView yy_setImageWithURL:[NSURL URLWithString:self.giftUrl] placeholder:nil];
//                    [picImgView fm_setImageWithURL:self.currentGiftItem.giftUrl];
//                }

            picImgView.center = tempPoint;
            [self addSubview:picImgView];
            CustomerBezierPath *path = self.lineArray.lastObject;
            NSMutableArray *images = self.imageArray.lastObject;
            [images addObject:picImgView];
            [path addLineToPoint:CGPointMake(xDistm, yDistm)];
            [path.pointsArray addObject:[NSValue valueWithCGPoint:tempPoint]];
            NSLog(@"point %f-%f", xDistm, yDistm);
            self.countGiftCount += 1;
            
            if (self.valueChagneBlock) {
//                self.value += self.currentGiftItem.price.integerValue;
//                self.valueChagneBlock(self.value);
            }
        }
    }
    self.upPoint = tempPoint;
}



@end
