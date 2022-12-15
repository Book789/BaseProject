//
//  LHPersonViewController.m
//  BaseProject
//
//  Created by dc on 2022/2/24.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "LHPersonViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "UIDynamicViewController.h"


@interface LHPersonCollectionViewCell:UICollectionViewCell


@end

@implementation LHPersonCollectionViewCell



@end

@interface LHPersonViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView * collectionView;

@property(nonatomic,strong)NSMutableArray * dataArray;


@end

@implementation LHPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 12; //垂直间隔
    layout.minimumInteritemSpacing = 12; //水平间隔
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 0, 15);
    layout.itemSize = CGSizeMake(85, 100);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, layout.itemSize.height+15) collectionViewLayout:layout];
    _collectionView.bounces = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[LHPersonCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    
}
#pragma mark- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    LHPersonCollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIDynamicViewController * water = [[UIDynamicViewController alloc] init];
    [self.navigationController pushViewController:water animated:YES];


}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return nil;
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HTUploadLifeFooterId" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor whiteColor];
        return footer;
    }

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
