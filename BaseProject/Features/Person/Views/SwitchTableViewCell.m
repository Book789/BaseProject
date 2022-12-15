//
//  SwitchTableViewCell.m
//  Project
//
//  Created by dc on 2022/4/22.
//

#import "SwitchTableViewCell.h"
#import "LHCustomSwitch.h"

@interface  SwitchTableViewCell()


@property (nonatomic,strong)LHCustomSwitch * switchButton;

@end
@implementation SwitchTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{

    LHCustomSwitch * switchButton = [LHCustomSwitch new];
    [self.contentView addSubview:switchButton];
    [switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.mas_equalTo(22);
        make.width.mas_equalTo(38);
    }];
//    switchButton.selectBlock = ^(BOOL boolean) {
//        NSString * str = boolean?@"1":@"0";
////        BLOCK_SAFE_CALLS(weakSelf.selectIndexBlock,weakSelf.tag,str);
//    };
    self.switchButton = switchButton;
    
    _nameLabel = [UILabel new];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(switchButton.mas_left).offset(-10);
    }];
    _nameLabel.textColor = kColorWithHex(0x333333);
    _nameLabel.font = kMainFontSize(16);
}

//-(void)setSwithOn:(BOOL)swithOn{
//    _swithOn = swithOn;
//    self.switchV.selected = swithOn;
//}



@end
