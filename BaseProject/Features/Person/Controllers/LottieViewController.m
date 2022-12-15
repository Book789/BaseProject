//
//  LottieViewController.m
//  Project
//
//  Created by dc on 2022/3/30.
//

#import "LottieViewController.h"
#import <Lottie/Lottie.h>
#import <SDCycleScrollView.h>
#import "LHBackgroundScrollView.h"
#import "LMJHorizontalScrollText.h"
#import "SHInfiniteShufflingLabel.h"


@interface LottieViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) LHBackgroundScrollView * scroll;

@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *imagesURLStrings = @[

    @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",

    @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",

    @"http://c.hiphotos.baidu.com/image/w=400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"

    ];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 320, 320, 180)imageURLStringsGroup:imagesURLStrings]; // 模拟网络延时情景

    cycleScrollView2.pageControlAliment =SDCycleScrollViewPageContolAlimentRight;

    cycleScrollView2.delegate = self;

//    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.pageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
//    cycleScrollView2.placeholderImage = [UIImageimageNamed:@"placeholder"];
    [self.view addSubview:cycleScrollView2];


    LHBackgroundScrollView * scroll = [[LHBackgroundScrollView alloc] initWithFrame:CGRectMake(0, cycleScrollView2.bottom, kScreenWidth, 100)];
    scroll.image = [UIImage imageNamed:@"c37c9d6227218efb255051a2e16a58e8"];
    [self.view addSubview:scroll];
    self.scroll = scroll;

    LMJHorizontalScrollText * textView = [[LMJHorizontalScrollText alloc] initWithFrame:CGRectMake(30, scroll.bottom, self.view.bounds.size.width-60, 20)];
    textView.speed = 0.03;
    textView.textFont = kMainFontSize(14);
    textView.textColor = kColorWithHex(0x333333);
    textView.moveMode           = LMJTextScrollContinuous;
    textView.text = @"41岁对大部分球员而言绝对算是超龄服役，但马努的决定还是令许多马刺球迷猝不及防，毕竟他和球队还有一年合同，以他的竞技状态还可以为球队提供场内外急需的能量——尤其是在度过如此风雨飘摇的一个赛季后 ";
    [self.view addSubview:textView];

    SHInfiniteShufflingLabel *label = [[SHInfiniteShufflingLabel alloc] initWithFrame:CGRectMake(30, textView.bottom+20, self.view.frame.size.width-60, 44)];
        label.backgroundColor = UIColor.whiteColor;
        [label setTextArray:@[@"1.上岛咖啡就是看劳动法就是盛开的积分是劳动法",
                              @"2.SDK和索拉卡的附近是了的开发房贷",
                              @"3.收快递费就SDK废旧塑料的发三楼的靠近非塑料袋开发计算量大开发就"] InteralTime:2.0 Direction:SHRollingDirectionUp];
        label.didSelect = ^(NSInteger index, NSString *text) {
            NSLog(@"---%ld----%@",index,text);
        };
        [self.view addSubview:label];
    /**
     另外，动画可以获取时间，播放进度，播放速度，循环播放等参数，当然也可以设置这些参数

     如：animationDuration animationProgress animationSpeed loopAnimation pause  play
     playWithCompletion 监听播放完毕动画的时机

     */
    LOTAnimationView*animationView = [LOTAnimationView  animationNamed:@"IM_audio"];
    animationView.backgroundColor = [UIColor redColor];
    animationView.frame = CGRectMake(100, 150, 200, 21);
    animationView.contentMode = UIViewContentModeScaleToFill;
    animationView.loopAnimation = YES;
    [self.view addSubview:animationView];
    [animationView play];

//    UIDatePicker
//添加点击手势
//    [calculateView addTapActionTouch:^{
//
//    }];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.scroll startAnimation];
}
#pragma mark----SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
