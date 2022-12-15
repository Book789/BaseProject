//
//  LHSheetView.m
//  BaseProject
//
//  Created by dc on 2022/3/28.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "LHSheetView.h"

@interface LHSheetTableViewCell : UITableViewCell


@end

@implementation LHSheetTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = kColorWithHex(0xf0f0f0);
        self.textLabel.frame = self.frame;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = kMainFontSize(16);
        self.textLabel.textColor =  kColorWithHex(0x007AFF);
        
    }
    return self;
}


@end


@interface LHSheetView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView * sheetView;

@property(nonatomic,strong)UILabel * titleLabel;

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation LHSheetView

- (instancetype)initWithTitle:(nullable NSString *)title delegate:(nullable id<LHSheetViewDelegate>)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... {
  
    if (self=[super init]) {
        NSMutableArray * buttonTitleArray = [NSMutableArray array];
        [buttonTitleArray addObject:otherButtonTitles];

        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            NSString *otherString;
            while ((otherString = va_arg(args, NSString *)))
            {
                //依次取得所有参数
                NSLog(@"%@",otherString);
                [buttonTitleArray addObject:otherString];
            }
        }
        va_end(args);
        self.dataArray = buttonTitleArray;
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    
        self.sheetView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth-20, 150)];
        self.sheetView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.sheetView];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [self.sheetView addSubview:blurEffectView];


        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.sheetView.width, 10)  style:UITableViewStylePlain];
        _tableView.layer.cornerRadius = 10;
        _tableView.backgroundColor = kColorWithHex(0xf0f0f0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 49;
        self.tableView.scrollEnabled = NO;
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorColor = kColorWithHex(0xE0E0E0);
        if (@available(iOS 11.0, *)){
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
        [self.sheetView addSubview:_tableView];
        [_tableView registerClass:[LHSheetTableViewCell class] forCellReuseIdentifier:@"LHSheetTableViewCell"];
        
        CGFloat heigh = SafeAreaBottomHeight;
        if (cancelButtonTitle) {
            heigh = heigh +49+10;
        }
        if (buttonTitleArray.count>0) {
            heigh = heigh +49*buttonTitleArray.count;
        }
        if (title) {
            heigh = heigh +44;
            
            headerView.height = 44;
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.sheetView.width, 44)];
            self.titleLabel.textColor = kColorWithHex(0x999999);
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.font = kMainFontSize(14);
            self.titleLabel.text = title;
            [headerView addSubview:self.titleLabel];
            
        }
        
        if (heigh+KNavigationBarHeight+kStatusBarHeight>kScreenHeight) {
            heigh = kScreenHeight-KNavigationBarHeight-kStatusBarHeight;
            self.tableView.scrollEnabled = YES;
        }
        if (cancelButtonTitle) {
            self.tableView.height = heigh-49-10-SafeAreaBottomHeight;
        }else{
            self.tableView.height = heigh-SafeAreaBottomHeight;
        }
        self.sheetView.frame = CGRectMake(10, kScreenHeight-heigh, kScreenWidth-20, heigh);
        blurEffectView.frame = self.sheetView.bounds;


        
        if (cancelButtonTitle) {
           
            UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.sheetView.height-44-SafeAreaBottomHeight, self.sheetView.width, 49)];
            cancelButton.backgroundColor =  kColorWithHex(0xf0f0f0);
            cancelButton.layer.cornerRadius = 5;
            cancelButton.clipsToBounds = YES;
            cancelButton.titleLabel.font = kMainBoldFontSize(16);
            [cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
            [cancelButton setTitleColor:kColorWithHex(0x007AFF) forState:UIControlStateNormal];
            [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
            [self.sheetView addSubview:cancelButton];
        }

        

    }

    return self;
}
#pragma mark------UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    LHSheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LHSheetTableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)showInView:(UIView *)view{
    [view addSubview:self];
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    self.sheetView.y = kScreenHeight;
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        self.sheetView.y = kScreenHeight-self.sheetView.height;
    }];

}
-(void)dismiss{

    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        self.sheetView.y = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    } ];

}
@end

