//
//  MHMomentPhotoItemViewModel.h
//  MHDevelopExample
//
//  Created by senba on 2017/7/12.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHPicture.h"

@interface MHMomentPhotoItemViewModel : NSObject

/// picture
@property (nonatomic, readwrite, strong) MHPicture *picture;


/// init
- (instancetype)initWithPicture:(MHPicture *)picture;

@end
