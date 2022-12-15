//
//  LHUserModel.m
//  Project
//
//  Created by dc on 2022/4/21.
//

#import "LHUserModel.h"

@implementation LHUserModel

+ (NSDictionary *)modelCustomPropertyMapper {
  
    return @{@"nickname"         : @"screen_name",
             @"profileImageUrl"    : @"profile_image_url",
             @"avatarLarge"        : @"avatar_large"
             };
}

@end
