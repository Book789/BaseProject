//
//  Protocol.h
//  Project
//
//  Created by a on 2022/4/28.
//

#import <Foundation/Foundation.h>


@protocol MHReactiveView <NSObject>

@optional
/// Binds the given view model to the view.
///
/// viewModel - The view model
- (void)bindViewModel:(id)viewModel;



///
/// 传递indexPath,且告诉该组(section)有多少行（row）
///
/// @param indexPath the indexPath.
/// @param rows the group have rows count.
///
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows;
@end

