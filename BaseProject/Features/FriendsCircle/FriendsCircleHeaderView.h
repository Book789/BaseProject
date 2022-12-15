//
//  FriendsCircleHeaderView.h
//  Project
//
//  Created by a on 2022/4/27.
//

#import <UIKit/UIKit.h>
#import "Protocol.h"
#import "MHMomentPhotosView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendsCircleHeaderView : UITableViewHeaderFooterView<MHReactiveView>

/**
 配图View
 */
@property (nonatomic, readwrite, weak) MHMomentPhotosView *photosView;

/// 段
@property (nonatomic, readwrite, assign) NSInteger section;

@property (nonatomic, copy) void(^photosImgClickBlock)(FriendsCircleHeaderView * headerView,NSMutableArray *imageArray, NSInteger index);

/// generate a header
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
