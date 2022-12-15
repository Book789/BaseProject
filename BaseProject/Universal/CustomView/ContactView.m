//
//  MH_L_FamilyContactView.m
//  MeiSui
//
//  Created by dc on 2022/2/24.
//  Copyright © 2022 厦门东城世纪. All rights reserved.
//

#import "ContactView.h"
#import "LHUserModel.h"
#import "DataHelper.h"
#import "UILabel+label.h"


@interface ContactView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView *animateView;

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray<LHUserModel *> *contactArray;// 模拟数据

@property (nonatomic, copy)  NSArray *rowArray;

@property (nonatomic, copy)  NSArray * sectionArray;

@property (nonatomic, strong)  NSMutableArray * searchResultArray;

@property(nonatomic,strong)UIView *searchView;

@property(nonatomic,strong)UITextField *searchField;



@end

@implementation ContactView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        self.contactArray = [NSMutableArray array];
        self.searchResultArray = [NSMutableArray array];

        [self nb_settingUpSubViews];
        [self nb_animateForShowView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchResultValueChange) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}
-(void)nb_settingUpSubViews{
    
    _animateView = [[UIView alloc]init];
    _animateView.frame = CGRectMake(0, 138, kScreenWidth, kScreenHeight-138);
    _animateView.center = self.center;
    _animateView.layer.cornerRadius = 8;
    _animateView.layer.masksToBounds = YES;
    _animateView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_animateView];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_animateView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _animateView.bounds;
    maskLayer.path = maskPath.CGPath;
    _animateView.layer.mask = maskLayer;
    
    UILabel *  titleLabel = [UILabel labelWithFrame:CGRectMake(50, 20, _animateView.width-100, 22) textColor:kColorWithHex(0x333333) font:[UIFont  fontWithName: @"PingFangSC-Semibold" size:16] textAlignment:NSTextAlignmentCenter text:@""];
    [_animateView addSubview:titleLabel];

    UIButton * cancelButton  = [[UIButton alloc] initWithFrame:CGRectMake(15, 16, 30, 30)];
    [cancelButton setImage:[UIImage imageNamed:@"PackUp"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(nb_dismissViewAction) forControlEvents:UIControlEventTouchUpInside];
    [_animateView addSubview:cancelButton];
    
    
    _searchView = [[UIView alloc]initWithFrame:CGRectMake(15, titleLabel.bottom, _animateView.width-15, 44)];
    _searchView.backgroundColor = [UIColor whiteColor];
    _searchView.clipsToBounds = YES;
    [_animateView addSubview:_searchView];
    
    _searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, _searchView.width-30, 36)];
    _searchField.centerY = _searchView.height/2;
    _searchField.textColor = kColorWithHex(0x333333);
    _searchField.font = [UIFont  fontWithName: @"PingFang SC" size:14] ;
    _searchField.placeholder = @"搜索";
    _searchField.returnKeyType = UIReturnKeySearch;
    _searchField.backgroundColor = kColorWithHex(0xf5f5f5);
    _searchField.layer.cornerRadius = 18;
    _searchField.layer.masksToBounds = YES;
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 37, 36)];
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(7, 0, 30, 36)];
    leftImage.contentMode = UIViewContentModeCenter;
    leftImage.image = [UIImage imageNamed:@"search"];
    [leftView addSubview:leftImage];
    _searchField.leftView = leftView;
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    [_searchView addSubview:_searchField];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+12, _animateView.width, _animateView.height-titleLabel.bottom-12) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 56;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_animateView addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    if (@available(iOS 11.0, *)){
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    self.tableView.tableHeaderView = _searchView;

    
    NSArray *dataArray = @[
                           @{@"portrait":@"1",@"nickname":@"58"},
                           @{@"portrait":@"2",@"nickname":@"花无缺"},
                           @{@"portrait":@"3",@"nickname":@"东方不败"},
                           @{@"portrait":@"4",@"nickname":@"任我行"},
                           @{@"portrait":@"5",@"nickname":@"逍遥王"},
                           @{@"portrait":@"6",@"nickname":@"阿离"},
                           @{@"portrait":@"13",@"nickname":@"百草堂"},
                           @{@"portrait":@"8",@"nickname":@"三味书屋"},
                           @{@"portrait":@"9",@"nickname":@"彩彩"},
                           @{@"portrait":@"10",@"nickname":@"陈晨"},
                           @{@"portrait":@"11",@"nickname":@"多多"},
                           @{@"portrait":@"12",@"nickname":@"峨嵋山"},
                           @{@"portrait":@"7",@"nickname":@"哥哥"},
                           @{@"portrait":@"14",@"nickname":@"林俊杰"},
                           @{@"portrait":@"15",@"nickname":@"足球"},
                           @{@"portrait":@"16",@"nickname":@"赶集"},
                           @{@"portrait":@"17",@"nickname":@"搜房网"},
                           @{@"portrait":@"18",@"nickname":@"欧弟"}];
    for (NSDictionary *dic in dataArray) {
        LHUserModel *model = [LHUserModel  yy_modelWithDictionary:dic];
        [self.contactArray addObject:model];
    }

    self.rowArray = [DataHelper getContactListDataBy:self.contactArray];
    self.sectionArray = [DataHelper getContactListSectionBy:[self.rowArray mutableCopy]];

    [self.tableView reloadData];

}
#pragma mark -------- tableview --------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.searchField.text.length == 0 ) {
        return self.sectionArray.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchField.text.length == 0 ) {
        NSArray *  row = self.rowArray[section];
        return row.count;
        
    }
    return self.searchResultArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return self.searchField.text.length == 0 ? 30.0 : 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.searchField.text.length == 0) {
        UIView *header = [[UIView alloc] init];
        header.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
        label.text = [self.sectionArray objectAtIndex:section];
        label.textColor = [UIColor blackColor];
        [header addSubview:label];
        return header;
    }else{
        return [[UIView alloc] init];
    }
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (self.searchField.text.length == 0 ) {
        return self.sectionArray;
    }else{
        return @[];
    }
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [_tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    return index;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];

    if (self.searchField.text.length == 0) {

        LHUserModel *model = _rowArray[indexPath.section][indexPath.row];
        cell.detailTextLabel.text = model.nickname;
        
    }else{
        LHUserModel *model = self.searchResultArray[indexPath.row];
        cell.detailTextLabel.text = model.nickname;
    }
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LHUserModel *model;
    if (self.searchField.text.length == 0) {

        model = _rowArray[indexPath.section][indexPath.row];
        
    }else{
        model = self.searchResultArray[indexPath.row];
    }

}

- (void)nb_animateForShowView{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _animateView.y = kScreenHeight;
    [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
        _animateView.y  =  138;
    } completion:nil];
}
- (void)nb_dismissViewAction{

    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _animateView.y = kScreenHeight;
        _animateView.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)searchResultValueChange{
  
    [self.searchResultArray removeAllObjects];
    
    for (LHUserModel *model in self.contactArray) {
        if ([model.nickname containsString:self.searchField.text] ) {
            [self.searchResultArray addObject:model];
        }
    }
    [self.tableView reloadData];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
