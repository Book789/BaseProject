//
//  LHWaterfallFlowViewController.m
//  Project
//
//  Created by dc on 2022/3/30.
//

#import "LHWaterfallFlowViewController.h"
#import "LHCollectionViewCustomLayout.h"

@interface LHWaterfallFlowViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSArray *items;

@end

@implementation LHWaterfallFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSetupView];
}
-(void)initSetupView{
    
    LHCollectionViewCustomLayout *layout = [[LHCollectionViewCustomLayout alloc] init];
     
     // 创建CollectionView
     CGFloat collectionW = self.view.frame.size.width;
     CGFloat collectionH = 200;
     CGRect frame = CGRectMake(0, 150, collectionW, collectionH);


    _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    _collectionView.bounces = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    
}
#pragma mark- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    UICollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

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
