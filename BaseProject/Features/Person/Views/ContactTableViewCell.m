//
//  ContactTableViewCell.m
//  Project
//
//  Created by dc on 2022/4/22.
//

#import "ContactTableViewCell.h"

@interface ContactTableViewCell()

@property(nonatomic,strong)UIImageView * iconImageView;

@property(nonatomic,strong)UILabel * nameLabel;

@property(nonatomic,strong)UILabel *  descLabel;

@property(nonatomic,strong)UILabel *  timeLabel;


@end

@implementation ContactTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(16);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.mas_equalTo(36);
        }];

    }
    return self;
}
-(void)setupUI{

    
}



@end
