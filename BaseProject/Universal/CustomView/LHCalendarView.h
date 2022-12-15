//
//  LHCalendarView.h
//  Project
//
//  Created by a on 2022/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHCalendarView : UIView

@end

@interface LHMouthModel : NSObject
/**
 周几
 */
@property(nonatomic,copy)NSString * dayOfWeek;

/**
 几号
 */
@property(nonatomic,copy)NSString * day;
/**
 属于几月份
 */
@property(nonatomic,assign)NSInteger dayOfMouth;

@end


NS_ASSUME_NONNULL_END
@interface LHCalendarModel : NSObject

/**
 * 年
 */
@property(nonatomic,assign)NSInteger year;

/**
 * 月
 */
@property(nonatomic,assign)NSInteger month;

/**
 每个月多少天
 */
@property(nonatomic,assign)NSInteger days;



@property(nonatomic,strong)NSMutableArray <LHMouthModel *> * _Nullable monthArray;

@end

