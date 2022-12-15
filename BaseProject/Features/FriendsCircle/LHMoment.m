//
//  LHMoment.m
//  Project
//
//  Created by a on 2022/4/27.
//

#import "LHMoment.h"
#import "MHComment.h"


@implementation LHMoment
- (NSMutableArray<MHComment *> *)commentsList
{
    if (_commentsList == nil) {
        _commentsList = [[NSMutableArray alloc] init];
    }
    return _commentsList;
}

- (NSMutableArray<LHUserModel *> *)attitudesList{
    
    if (_attitudesList == nil) {
        _attitudesList = [NSMutableArray array];
    }
    return _attitudesList;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createdAt"        : @"created_at",
             @"sourceAllowClick" : @"source_allowclick",
             @"sourceUrl"        : @"source_url",
             @"attitudesStatus"  : @"attitudes_status",
             @"attitudesCount"   : @"attitudes_count",
             @"attitudesList"    : @"attitudes_list",
             @"commentsCount"    : @"comments_count",
             @"commentsList"     : @"comments_list",
             @"picInfos"         : @"pic_infos"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{
             @"picInfos"        : [MHPicture class],
             @"commentsList"    : [MHComment class],
             @"attitudesList"   : [LHUserModel class]
             };
}
@end



