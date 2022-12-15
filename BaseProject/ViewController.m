//
//  ViewController.m
//
//

#import "ViewController.h"
#import "UILabel+label.h"
#import <Masonry.h>
#import "LHRedPacketDetailViewController.h"
#import "LHAleartView.h"
#import "LHSheetView.h"
#import "LHWaterfallFlowViewController.h"
#import "LottieViewController.h"
#import "TextFieldTableViewCell.h"
#import "FriendsCircleViewController.h"
#import "LHPullHeaderViewController.h"
#import "GraffitiView.h"
#import "LHCustomSwitch.h"
#import "UIDynamicViewController.h"
#import "LHCalendarView.h"
#import "LHCustomSwitch.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "SDWebImage/SDWebImage.h"
#import "Lz4Compress.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LHSegmentedViewDelegate>

@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) NSArray * dataArray;

@property(nonatomic,strong) UIImageView * avarImageView;


@end

@implementation ViewController
-(void)viewDidUnload{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    
    self.fd_prefersNavigationBarHidden = YES;
    NSArray * array = @[@"1",@"3",@"5"];
    NSArray * array1 = @[@"3",@"1",@"5"];
    if ([array isEqual:array1]) {
        NSLog(@"两个数组相等");
    }else{
        NSLog(@"两个数组不相等");
    }
    self.avarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.avarImageView];
    
    NSURL* url = [NSURL URLWithString:@"https://shsk-shverse-sit.s3.cn-north-1.amazonaws.com.cn/dynamic/files/0500513949800001.bmp"];
    NSData * data = [NSData dataWithContentsOfURL:url];

    self.avarImageView.image = [UIImage imageWithData:data];
    
    [self.avarImageView sd_setImageWithURL:[NSURL URLWithString:@"https://shsk-shverse-sit.s3.cn-north-1.amazonaws.com.cn/dynamic/files/0500513949800001.bmp"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {

    }];
            

    NSData* scr = [Lz4Compress compress:UIImagePNGRepresentation([UIImage imageNamed:@"1024.png"])];
        NSLog(@"scr: %.2f",scr.length/1024.0/1024.0);

   
//    LHCalendarView * calendar = [[LHCalendarView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 400)];
//    [self.view addSubview:calendar];
    
    
//    LottieViewController * lottie = [LottieViewController new];
//    lottie.itemTitle = @"动画";
//
//    LHWaterfallFlowViewController * water = [LHWaterfallFlowViewController new];
//    water.itemTitle = @"红包";
//
//
//    LHPullHeaderViewController * pull = [LHPullHeaderViewController new];
//    pull.itemTitle = @"下拉";
//
////    LottieViewController * lottie1 = [LottieViewController new];
////    lottie1.itemTitle = @"动画1";
////
////    LottieViewController * lottie2 = [LottieViewController new];
////    lottie2.itemTitle = @"动画2";
////
////    LottieViewController * lottie3 = [LottieViewController new];
////    lottie3.itemTitle = @"动画3";
////
////    LottieViewController * lottie4 = [LottieViewController new];
////    lottie4.itemTitle = @"动画4";
//
//
//
//
//
//    self.viewControllers = @[lottie,water,pull];
//
////    self.viewControllers = @[lottie,water,pull,lottie1,lottie2,lottie3,lottie4];
//    [self setContentScrollEnabledAndTapSwitchAnimated:YES];
//    self.segmentedView.frame = CGRectMake(kScreenWidth/2-100, 100, 200, 44);
//    self.segmentedView.backgroundColor = kColorWithHex(0xf5f5f5);
//    self.segmentedView.itemSelectedBgScrollFollowContent = YES;
//    self.segmentedView.itemTitleColor = kColorWithHex(0x666666);
//    self.segmentedView.itemTitleSelectedColor = kColorWithHex(0x333333);
//    self.segmentedView.itemTitleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];;
//    self.segmentedView.itemTitleSelectedFont = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
////    [self.segmentedView setScrollEnabledAndItemFitTextWidthWithSpacing:10];
//    [self.segmentedView gradientWithSize:CGSizeMake(20, 5) colorArray:@[kColorWithHex(0xFF444C),kColorWithHex(0xFF6A4F)] percentageArray:@[@(0.0),@(1.0)] gradientType:GradientFromLeftToRight];
//
//    self.segmentedView.itemSelectedBgInsets = UIEdgeInsetsMake(self.segmentedView.height - 7, 20, 3, 20);
//
//    return;

    
//    _dataArray = @[@"仿红包详情UI",
//                   @"系统UIAlertView",
//                   @"自定义alertView",
//                   @"系统UISheetView",
//                   @"自定义sheetView",
//                   @"LottieViewController",
//                   @"瀑布流",
//                   @"下拉放大头部",
//                   @"朋友圈",
//                   @"定位授权",
//                   @"手绘礼物",
//                   @"碰撞动画"];
//
//
//
//
//
//    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//    _tableView.backgroundColor = [UIColor whiteColor];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.rowHeight = 49;
//    _tableView.tableFooterView = [UIView new];
//    _tableView.showsVerticalScrollIndicator = NO;
//    _tableView.separatorColor = [UIColor separatorColor];
////    _tableView.sectionIndexColor = [UIColor subTextColor];
////    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
//    if (@available(iOS 11.0, *)){
//        _tableView.estimatedSectionHeaderHeight = 0;
//        _tableView.estimatedSectionFooterHeight = 0;
//    }
//    [self.view addSubview:_tableView];
//    [_tableView registerClass:[TextFieldTableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.equalTo(self.view.mas_top);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-SafeAreaBottomHeight);
//    }];
////    [_tableView.mj_footer beginRefreshing];
////    [_tableView.mj_footer endRefreshing];
//
//    _tableView.mj_header =  [MJRefreshStateHeader headerWithRefreshingBlock:^{
//
//    }];
//    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
////        [weakSelf nb_httpGetNoUseCouponList:NO];
//    }];
//
//    UISwitch * switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(0, 100, 38, 22)];
//    [_tableView addSubview:switchButton];
//
//    LHCustomSwitch * button = [[LHCustomSwitch alloc] initWithFrame:CGRectMake(0, 131, 38, 22)];
//    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [_tableView addSubview:button];
//    button.onImage = [UIImage createImageWithSize:button.frame.size gradientColors:@[kColorWithHex(0xFF444C),kColorWithHex(0xFF6A4F)]];
    
//    self.emptyView.state = LHEmptyViewStateLoading;
}
-(void)click:(LHCustomSwitch*)button{
    NSLog(@"%ld",button.on);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            LHRedPacketDetailViewController * redPacket = [LHRedPacketDetailViewController new];
            [self.navigationController pushViewController:redPacket animated:YES];
            
        }
            break;
        case 1:
        {
            UIAlertView * alerView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"提示" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
            [alerView show];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"即时通信 IM 提供全球接入、单聊、群聊、消息推送、资料关系链托管、帐号鉴权等全方位解决方案，并提供完备的 App 接入、后台管理接口。" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }];
                UIAlertAction *skipAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];

                UIAlertAction *skip1Action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertController addAction:cancelAction];
                [alertController addAction:skipAction];
               [alertController addAction:skip1Action];
                [self presentViewController:alertController animated:YES completion:nil];

        }
            break;
        case 2:
        {
            LHAleartView * alerView = [[LHAleartView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的\"设置-隐私-照片\"选项中，允许山海大陆访问你的照片" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
            [alerView show];
        }
            break;
        case 3:
        {
            UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"提示"
              delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@""
              otherButtonTitles:@"微博",@"微信", nil];
            [sheet showInView:self.view];
            
        }
            break;
        case 4:
        {
            LHSheetView * alerView = [[LHSheetView alloc] initWithTitle:@"提示"
                                                               delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"危险"
                                                               otherButtonTitles:@"微博",@"微信", nil];
            [alerView showInView:self.view];
        }
            break;
        case 5:
        {
            LottieViewController * water = [LottieViewController new];
            [self presentViewController:water animated:YES completion:^{
                
            }];
        }
            break;
        case 6:
        {
            LHWaterfallFlowViewController * water = [LHWaterfallFlowViewController new];
            [self presentViewController:water animated:YES completion:^{

            }];
            

        }
            break;
        case 7:
        {
            LHPullHeaderViewController * water = [LHPullHeaderViewController new];
            [self.navigationController pushViewController:water animated:YES];

        }
            break;

        case 8:
        {
            FriendsCircleViewController * water = [FriendsCircleViewController new];
            [self.navigationController pushViewController:water animated:YES];
            
        }
            break;
        case 10:
        {
            GraffitiView * water = [[GraffitiView alloc]initWithFrame:self.view.bounds];
            water.giftUrl = @"http://img1.szdc666.com/eaaacc84565940918d650473d86a36a9.gif";
            [self.view addSubview:water];
        }
            break;
        case 11:
        {
            UIDynamicViewController * water = [[UIDynamicViewController alloc] init];
            [self.navigationController pushViewController:water animated:YES];
        }
            break;



            


            
        default:
            break;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [MBProgressHUD showMessage:@"加载失败"];
    [UIView fm_showTextHUD:@"加载失败"];
//    [self showHudTipStr:@"个性后缀仅支持英文字母、数字、横线(-)以及下划线(_)"];
}

-(void)valueForKeyPath{
    
    NSArray *array= [NSArray arrayWithObjects:@"2.0",@"2.3",@"3.0",@"4.0",@"10",nil];

    //求和
//    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue]；
//
    //平均值
//    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue]；
// 最大值
//    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue]；
//最小值
//    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue]；

    
//    [[personArray valueForKeyPath:@"@avg.age"] integerValue]；
//    [[personArray valueForKeyPath:@"@max.age"] integerValue]；
//    [[personArray valueForKeyPath:@"@min.age"] integerValue]；
    
    //数组 值去重
//    NSArray *deleltNewA = [array valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
    //数组 去重后获取值
//    NSArray *deleltNewA = [array valueForKeyPath:@"@distinctUnionOfObjects.name"];




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
