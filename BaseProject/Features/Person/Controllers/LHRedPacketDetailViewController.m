//
//  LHRedPacketDetailViewController.m
//  BaseProject
//
//  Created by dc on 2022/3/14.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "LHRedPacketDetailViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "NBRefreshGifHeader.h"


@interface LHRedPacketDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIImageView * imageView;

@property(nonatomic,strong)UIView * headerView;

@property(nonatomic,strong)NSArray *  dataArray;

@property(nonatomic,strong)UILabel * usernameLabel ;

@property(nonatomic,strong)UILabel *moneyLabel;

@property(nonatomic,strong)UILabel * descLabel;

@property(nonatomic,strong)UILabel * receiveDetailLabel;

@property(nonatomic,strong)UIView * markView;

@property(nonatomic,strong)UIImageView * iconImageView;

@property(nonatomic,strong)UIButton * walletButton;

@end

@implementation LHRedPacketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.fd_prefersNavigationBarHidden = YES;
    
    [self nb_initSubViews];
        
}

- (void)nb_initSubViews{
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, KNavigationBarHeight)];
    navView.backgroundColor = kColorWithHex(0xF9503D);
    [self.view addSubview:navView];
    
    
    //内容视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavigationBarHeight, kScreenWidth, kScreenHeight - kStatusBarHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 84;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 75, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 280)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = _headerView;
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,20)];
    _imageView.backgroundColor = kColorWithHex(0xF9503D);
//    [_imageView drawArcByRadian:20];
    [_headerView addSubview:_imageView];
    
    _usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, kScreenWidth-40, 25)];
    _usernameLabel.text = @"";
    _usernameLabel.textColor = kColorWithHex(0x333333);
    _usernameLabel.font = kMainFontSize(16);
    _usernameLabel.textAlignment = NSTextAlignmentCenter;
    [_headerView addSubview:_usernameLabel];
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_headerView.mas_centerX).offset(15.5);
        make.top.equalTo(_headerView.mas_top).offset(42);
        make.height.mas_equalTo(23);

    }];
    
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.layer.cornerRadius = 6;
        _iconImageView.layer.masksToBounds = YES;
        [_headerView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_usernameLabel.mas_left).offset(-8);
            make.top.equalTo(_headerView.mas_top).offset(42);
            make.width.height.mas_equalTo(23);
        }];
    
    _descLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, _imageView.bottom+15, kScreenWidth-40, 30)];
    _descLabel.textColor = kColorWithHex(0x999999);
    _descLabel.font = kMainFontSize(14);
    _descLabel.textAlignment = NSTextAlignmentCenter;
    _descLabel.text = @"恭喜发财，大吉大利！";
    [_headerView addSubview:_descLabel];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameLabel.mas_bottom).offset(11);
        make.left.right.equalTo(_headerView);
        make.height.mas_equalTo(20);
    }];


    _moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, _usernameLabel.bottom+15, kScreenWidth-40, 55)];
    _moneyLabel.textColor = kColorWithHex(0xDD5442);
    _moneyLabel.font = kMainFontSize(36);
    _moneyLabel.textAlignment = NSTextAlignmentCenter;
    _moneyLabel.text = @"0M豆";
    _moneyLabel.attributedText = [_moneyLabel.text specifiedString:@"元" withFont:kMainFontSize(14)];
    [_headerView addSubview:_moneyLabel];
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descLabel.mas_bottom).offset(11);
        make.left.right.equalTo(_headerView);
        make.height.mas_equalTo(50);
    }];


    _walletButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _walletButton.titleLabel.font = kMainFontSize(14);
    [_walletButton setTitleColor:kColorWithHex(0xFFAF14) forState:UIControlStateNormal];
    [_walletButton setTitle:@"已存入余额，可直接消费 >" forState:UIControlStateNormal];
    [_headerView addSubview:_walletButton];
    [_walletButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moneyLabel.mas_bottom).offset(11);
        make.left.right.equalTo(_headerView);
        make.height.mas_equalTo(20);
    }];
    [_walletButton addTarget:self action:@selector(pushWallet) forControlEvents:UIControlEventTouchUpInside];



    
    _markView = [[UIView alloc]initWithFrame:CGRectZero];
    _markView.backgroundColor = kColorWithHex(0xf5f5f5);
    [_headerView addSubview:_markView];
    [_markView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_headerView.mas_bottom).offset(-58);
        make.right.left.equalTo(_headerView);
        make.height.mas_equalTo(10);
    }];
    
    _receiveDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, kScreenWidth-40, 25)];
    _receiveDetailLabel.text = @"";
    _receiveDetailLabel.textColor = kColorWithHex(0x666666);
    _receiveDetailLabel.font = kMainFontSize(14);
    _receiveDetailLabel.textAlignment = NSTextAlignmentLeft;
    [_headerView addSubview:_receiveDetailLabel];
    [_receiveDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_headerView.mas_bottom);
        make.left.equalTo(_headerView.mas_left).offset(13);
        make.right.equalTo(_headerView.mas_right);
        make.height.mas_equalTo(48);
    }];


//    (self)
    NBRefreshGifHeader *refreshHeaderView = [NBRefreshGifHeader headerWithRefreshingBlock:^{
//        [weakSelf nb_httpGetRedPackDetail];
    }];
//    refreshHeaderView.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    refreshHeaderView.stateLabel.textColor = [UIColor whiteColor];
    refreshHeaderView.lastUpdatedTimeLabel.textColor = [UIColor whiteColor];
    _tableView.mj_header = refreshHeaderView;

    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -250, kScreenWidth, 350)];
    bgImageView.backgroundColor = kColorWithHex(0xF9503D);
    [refreshHeaderView addSubview:bgImageView];
    [refreshHeaderView sendSubviewToBack:bgImageView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
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
