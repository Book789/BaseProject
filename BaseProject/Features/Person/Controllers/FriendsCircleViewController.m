//
//  FriendsCircleViewController.m
//  Project
//
//  Created by a on 2022/4/26.
//

#import "FriendsCircleViewController.h"
#import "FriendsCircleHeaderView.h"
#import "FriendsCircleFooterView.h"
#import "YYCategories.h"
#import "LHMoment.h"
#import "LHMomentItemViewModel.h"

#import <GKCover.h>
#import "GKPhotoBrowser.h"



@interface FriendsCircleViewController ()<UITableViewDelegate,UITableViewDataSource,GKPhotoBrowserDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)NSMutableArray * dataArray;

@property (nonatomic, strong) UIView *fromView;

/** 这里用weak是防止GKPhotoBrowser被强引用，导致不能释放 */
@property (nonatomic, weak) GKPhotoBrowser *browser;

@property (nonatomic, assign) NSInteger     currentIndex;

@property (nonatomic, assign) BOOL isLandscape;

@property (nonatomic, weak) UIView *actionSheet;

@end

@implementation FriendsCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"朋友圈";
    
    /// 获取数据
    NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"WeChat_Moments_%zd.json",1]];
    NSError *err;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
    }
    NSArray * momentsArray = [dictionary objectForKey:@"moments"];
    momentsArray = [NSArray yy_modelArrayWithClass:[LHMoment class] json:momentsArray];
    
    self.dataArray = [NSMutableArray array];
    for (LHMoment * momment in momentsArray) {
    
        LHMomentItemViewModel * itemViewModel = [[LHMomentItemViewModel alloc] initWithMoment:momment];
    /// 传递命令
//    itemViewModel.reloadSectionSubject = self.reloadSectionSubject;
//    itemViewModel.commentSubject = self.commentSubject;
//    itemViewModel.profileInfoCommand = self.profileInfoCommand;
//    itemViewModel.attributedTapCommand = self.attributedTapCommand;
//        itemViewModel.shareTapCommand = self.shareTapCommand;

        [self.dataArray addObject:itemViewModel];
    }
    
//    NSArray *viewModels = @[];
//    /// 转化数据
//    if (momentsData && momentsData.moments.count) { ///做个判断
//        viewModels = [momentsData.moments.rac_sequence map:^MHMomentItemViewModel *(MHMoment * momment) {
//            @strongify(self);
//            MHMomentItemViewModel *itemViewModel = [[MHMomentItemViewModel alloc] initWithMoment:momment];
//            /// 传递命令
//            itemViewModel.reloadSectionSubject = self.reloadSectionSubject;
//            itemViewModel.commentSubject = self.commentSubject;
//            itemViewModel.profileInfoCommand = self.profileInfoCommand;
//            itemViewModel.attributedTapCommand = self.attributedTapCommand;
//            itemViewModel.shareTapCommand = self.shareTapCommand;
//            return itemViewModel;
//        }].array;
//    }
//

    
    
    [self setupUI];
    
}
-(void)setupUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 49;
    _tableView.tableFooterView = [UIView new];
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
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom).offset(-SafeAreaBottomHeight);
    }];

}
#pragma mark----UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FriendsCircleHeaderView *headerView = [FriendsCircleHeaderView headerViewWithTableView:tableView];
    /// 传递section 后期需要用到
    headerView.section = section;
    [headerView bindViewModel:self.dataArray[section]];
    headerView.photosImgClickBlock = ^(FriendsCircleHeaderView * _Nonnull headerView, NSMutableArray * _Nonnull imageArray, NSInteger index) {
        
        NSMutableArray *photos = [NSMutableArray new];
        [imageArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GKPhoto *photo = [GKPhoto new];
            photo.url = obj;
            photo.sourceImageView = headerView.photosView.subviews[idx];
            [photos addObject:photo];

        }];
        
        GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:index];
        browser.showStyle = GKPhotoBrowserShowStyleZoom;        // 缩放显示
        browser.hideStyle = GKPhotoBrowserHideStyleZoomScale;   // 缩放隐藏
        browser.loadStyle = GKPhotoBrowserLoadStyleIndeterminateMask; // 不明确的加载方式带阴影
        browser.maxZoomScale = 20.0f;
        browser.doubleZoomScale = 2.0f;
        browser.isAdaptiveSafeArea = YES;
        browser.hidesCountLabel = YES;
        browser.pageControl.hidden = NO;
        browser.saveBtn.hidden = YES;
        browser.delegate = self;
        [browser showFromVC:self];
        self.browser = browser;
    };
    return headerView;
}
// custom view for footer. will be adjusted to default or specified footer height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [FriendsCircleFooterView footerViewWithTableView:tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    LHMomentItemViewModel *itemViewModel = self.dataArray[section];
    /// 这里每次刷新都会走两次！！！ Why？？？
    NSLog(@"KKKKKK ------- %ld ",section);
    return itemViewModel.height;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
#pragma mark - GKPhotoBrowserDelegate
- (void)photoBrowser:(GKPhotoBrowser *)browser didChangedIndex:(NSInteger)index {
    
}
- (void)photoBrowser:(GKPhotoBrowser *)browser willLayoutSubViews:(NSInteger)index {
    UIView *contentView = browser.contentView;

    [self.fromView removeFromSuperview];

    if (browser.contentView.size.width > browser.contentView.size.height) { // 横屏
        [contentView addSubview:self.fromView];
        self.fromView.frame = CGRectMake(0, 0, contentView.bounds.size.width, contentView.bounds.size.height);
    }else {
        [browser.view addSubview:self.fromView];
        self.fromView.frame = CGRectMake(0, 0, contentView.bounds.size.width, contentView.bounds.size.height);
    }

    self.actionSheet.width = contentView.frame.size.width;
    [self.actionSheet.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.width = contentView.frame.size.width;
    }];

//    [GKCover layoutSubViews];
}
-(void)dealloc{
    
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
