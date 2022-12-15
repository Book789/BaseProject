//
//  CustomerBezierPath.m
//  Project
//
//  Created by a on 2022/5/11.
//

#import "CustomerBezierPath.h"

@implementation CustomerBezierPath
- (NSMutableArray *)pointsArray {
    if (!_pointsArray) {
        _pointsArray = [NSMutableArray array];
    }
    return _pointsArray;
}
@end
