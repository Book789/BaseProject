//
//  TextFieldTableViewCell.m
//  Project
//
//  Created by dc on 2022/4/22.
//

#import "TextFieldTableViewCell.h"

@interface TextFieldTableViewCell()

@property(nonatomic,strong)UITextField * textField;

@end

@implementation TextFieldTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        
           
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChange:) name:UITextFieldTextDidChangeNotification object:nil];

    }
    return self;
}
-(void)setupUI{

    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.font = [UIFont systemFontOfSize:16];
    self.textField.textColor = [UIColor redColor];
    [self.textField setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
    [self.textField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"placeholderLabel.font"];
    self.textField.placeholder = @"测试";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-15);
//        make.centerY.equalTo(self.contentView);
        make.width.mas_offset(@(100));

    }];
    
}
-(void)textFieldValueChange:(NSNotification *)noti{
    UITextField *currentTextField = (UITextField *)noti.object;
    NSLog(@"textField2 - 输入框内容改变,当前内容为: %@",currentTextField.text);
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
