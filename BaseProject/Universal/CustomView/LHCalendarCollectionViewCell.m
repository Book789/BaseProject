//
//  LHCalendarCollectionViewCell.m
//  Project
//
//  Created by a on 2022/6/1.
//

#import "LHCalendarCollectionViewCell.h"

@implementation LHCalendarCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.textLabel.font = kMainFontSize(16);
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

@end
