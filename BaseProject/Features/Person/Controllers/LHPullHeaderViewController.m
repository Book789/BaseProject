//
//  LHPullHeaderViewController.m
//  Project
//
//  Created by a on 2022/5/5.
//

#import "LHPullHeaderViewController.h"
#import "UIDynamicViewController.h"


@interface LHPullHeaderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UIImageView * headerView;

@property(nonatomic,strong)NSMutableArray * dataArray;


@end

@implementation LHPullHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.alpha = 0;
    
    self.navigationItem.title = @"我的";

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-SafeAreaBottomHeight) style:UITableViewStylePlain];
    _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 49;
//    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorColor = [UIColor separatorColor];
//    _tableView.sectionIndexColor = [UIColor subTextColor];
//    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    if (@available(iOS 11.0, *)){
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    [self.view addSubview:_tableView];

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];

    //改变tableView的内边距
    //这里创建的视图Y和高没有卵用，希望知道的同志告知一下
    self.headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0,-200, self.view.frame.size.width, 200)];
    self.headerView.image = [UIImage imageNamed:@"c37c9d6227218efb255051a2e16a58e8"];
    self.headerView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.8];
    //在这里创建的视图一定要添加到tableView上，而不是给头视图赋值
    [self.tableView addSubview:self.headerView];

//    想要宽高等比例缩放加上这句代码
    self.headerView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerView.clipsToBounds = YES;
    
    
    UIStackView * stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 20)];
    stackView.backgroundColor = [UIColor whiteColor];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentLeading;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.spacing = 10;
    [self.headerView addSubview:stackView];
    
    
    UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    iconImageView.backgroundColor= [UIColor greenColor];
    [stackView addArrangedSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(20);
    }];
    //逆序遍历数组元素并删除
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"3",@"1",@"2",@"3",@"3",@"5"]];
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"3"]||[obj isEqualToString:@"2"]) {
            [array removeObject:obj];
        }
            
    }];
    NSLog(@"%@",array);
//    iconImageView.hidden = YES;
    
    UIImageView * iconImageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    iconImageView1.backgroundColor= [UIColor yellowColor];
    [stackView addArrangedSubview:iconImageView1];
    [iconImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
    }];
    iconImageView1.hidden = YES;


    UIImageView * iconImageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    iconImageView2.backgroundColor= [UIColor orangeColor];
    [stackView addArrangedSubview:iconImageView2];
    [iconImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
    }];



//    NSLayoutConstraint *b_consWidth = [NSLayoutConstraint constraintWithItem:iconImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:iconImageView1 attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
//    [stackView addConstraint:b_consWidth];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIDynamicViewController * water = [[UIDynamicViewController alloc] init];
    [self.navigationController pushViewController:water animated:YES];

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    CGFloat yOffset  = scrollView.contentOffset.y;
//
//    //导航栏渐变
//    if (yOffset >= -245) {
//        CGFloat navAlpha = (245+yOffset)/170;
//        self.navigationController.navigationBar.alpha = navAlpha;
//    }else{
//        if (self.navigationController.navigationBar.alpha != 0) {
//            self.navigationController.navigationBar.alpha = 0;
//        }
//    }
//    NSLog(@"%.2f",yOffset);
//
//    if (yOffset < -200) {
//        CGRect f = self.headerView.frame;
//        f.origin.y = yOffset;
//        f.size.height =  -yOffset;
//        self.headerView.frame = f;
//    }
//
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
