//
//  MHComment.m
//  Project
//
//  Created by a on 2022/4/28.
//

#import "MHComment.h"

@implementation MHComment

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createdAt"        : @"created_at",
             @"momentIdstr"      : @"moment_idstr",
             @"toUser"           : @"to_user",
             @"fromUser"         : @"from_user"
             };
}

@end
