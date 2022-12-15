//
//  LHCalendarView.m
//  Project
//
//  Created by a on 2022/6/1.
//

#import "LHCalendarView.h"
#import "LHCalendarCollectionViewCell.h"

@interface LHCalendarView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *  collectionView;

@property (nonatomic, strong) LHCalendarModel * model;

@end

@implementation LHMouthModel



@end


@implementation LHCalendarModel



@end

@implementation LHCalendarView

-(instancetype)initWithFrame:(CGRect)frame{
  
    if (self=[super initWithFrame:frame]) {
        

        NSArray * titleArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        for (int i= 0; i < titleArray.count; i++) {
            UILabel * desLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/7*i, 0, kScreenWidth/7, 35)];
            desLabel.text = titleArray[i];
            desLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:desLabel];
        }
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 2;
        flowLayout.minimumInteritemSpacing = 2;
        flowLayout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
        flowLayout.itemSize =  CGSizeMake(([UIScreen mainScreen].bounds.size.width - 16)/7, 60);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 35,self.width, self.height-35) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.bounces = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        [_collectionView registerClass:[LHCalendarCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

        [self addSubview:_collectionView];
        
        [self loadData];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 56;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LHCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.model.monthArray[indexPath.row].day;
//    if ((indexPath.row < _model.cellStartNum) || (indexPath.row >= (_model.days.count + _model.cellStartNum))) {
//        cell.model = nil;
//    }else{
//        DayModel *model = _model.days[indexPath.row - _model.cellStartNum];
//        cell.model = model;
//    }
    return cell;
}

-(void)loadData{
    
    LHCalendarModel * model = [[LHCalendarModel alloc] init];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday) fromDate:[NSDate date]];
    model.year = components.year;
    model.month = components.month;
    model.monthArray = [NSMutableArray array];
    
    NSInteger lastMonthDays = [self daysOfYear:components.year withMonth:components.month-1];
    for (NSInteger i = lastMonthDays+1-(7-components.weekday) ; i <=lastMonthDays; i++) {
        LHMouthModel * mouthModel = [[LHMouthModel alloc]init];
        mouthModel.day = @(i).description;
        mouthModel.dayOfMouth = components.month-1;
        [model.monthArray addObject:mouthModel];
    }
    
    NSInteger monthDays = [self daysOfYear:components.year withMonth:components.month];
    for (NSInteger i = 1 ; i <= monthDays; i++) {
        LHMouthModel * mouthModel = [[LHMouthModel alloc]init];
        if (i==1) {
            mouthModel.day = [NSString stringWithFormat:@"%ld月",components.month];
        }else{
            mouthModel.day = @(i).description;
        }
        mouthModel.dayOfMouth = components.month;
        [model.monthArray addObject:mouthModel];
    }
    NSInteger days = 56 - model.monthArray.count;
    for (NSInteger i = 1 ; i <=days; i++) {
        LHMouthModel * mouthModel = [[LHMouthModel alloc]init];
        if (i==1) {
            mouthModel.day = [NSString stringWithFormat:@"%ld月",components.month+1];
        }else{
            mouthModel.day = @(i).description;
        }
        mouthModel.dayOfMouth = components.month+1;
        [model.monthArray addObject:mouthModel];
    }

    self.model = model;
    [self.collectionView reloadData];
}
#pragma mark -- 获取某年某月月有多少天
- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

#pragma mark - 获取年，月，日，星期
//注：日历获取在9.x之后的系统使用currentCalendar会出异常。在8.0之后使用系统新API。
-(NSInteger )getDataFromDate:(NSDate *)date type:(NSString * )type{
   
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday) fromDate:date];
    if ([type isEqualToString:@"year"]) {
        return components.year;
    }else if ([type isEqualToString:@"month"]) {
        return components.month;
    }else if ([type isEqualToString:@"day"]) {
        return components.day;
    }else if ([type isEqualToString:@"week"]) {
        return components.weekday;
    }else{
        return 0;
    }
}
#pragma mark - 获取某年某月的天数
- (NSInteger)daysOfYear:(NSInteger)year withMonth:(NSInteger)month{
  
    if (month==13) {
        month = 12;
        year = year +1;
    }
    if (month==0) {
        month = 12;
        year = year -1;
    }

    if ([@[@"1",@"3",@"5",@"7",@"8",@"10",@"12"] containsObject:@(month).description]) {
        return 31;
    }
   
    if ([@[@"4",@"6",@"9",@"11"] containsObject:@(month).description]) {
        return 30;
    }
        if(year % 4 == 0){
        return 29;
    }
 
    return 28;
}
@end

