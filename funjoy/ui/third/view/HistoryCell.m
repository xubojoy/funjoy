//
//  HistoryCell.m
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "HistoryCell.h"
#import "UILabel+Custom.h"
@implementation HistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    [self initUI];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView

{
    
    static NSString *identifier = @"status";
    // 1.缓存中取
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        
        cell = [[HistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.contentView.backgroundColor = [ColorUtils colorWithHexString:common_content_color];
        self.backgroundColor = [ColorUtils colorWithHexString:common_content_color];
        [self initUI];
    }
    
    return self;
    
}

- (void)initUI{
//    self.bgView = [[UIView alloc] init];
//    self.bgView.backgroundColor = [UIColor whiteColor];
//    self.bgView.layer.cornerRadius = 10;
//    self.bgView.layer.masksToBounds = YES;
//    [self.contentView addSubview:self.bgView];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(general_space);
//        make.top.mas_equalTo(general_padding);
//        make.size.mas_equalTo(CGSizeMake(screen_width-2*general_space, 70));
//    }];
    
//    UIImageView *arrowImageView = [[UIImageView alloc] init];
//    arrowImageView.image = [UIImage imageNamed:@"button_arrow_next"];
//    [self.bgView addSubview:arrowImageView];
//    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.bgView.mas_centerY);
////        make.top.mas_equalTo(10);
//        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-10);
//        make.size.mas_equalTo(CGSizeMake(16, 16));
//
//    }];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.textColor = [ColorUtils colorWithHexString:@"#bdbdbd"];
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    self.dateLabel.font = [UIFont systemFontOfSize:font_13_size];
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(general_padding);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    UIImageView *roundImageView = [[UIImageView alloc] init];
    roundImageView.backgroundColor = [ColorUtils colorWithHexString:@"#6c6c6c"];
    [self.contentView addSubview:roundImageView];
    [roundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.dateLabel.mas_right).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(10, 10));
        
    }];
    roundImageView.layer.cornerRadius = 5;
    roundImageView.layer.masksToBounds = YES;
    
    UIView *upLine = [[UIView alloc] init];
    upLine.backgroundColor = [ColorUtils colorWithHexString:@"#6c6c6c"];
    [self.contentView addSubview:upLine];
    [upLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(roundImageView.mas_centerX);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.width.mas_equalTo(splite_line_height);
    }];

    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.backgroundColor = [ColorUtils colorWithHexString:@"#6c6c6c"];
    self.contentLabel.textColor = [ColorUtils colorWithHexString:@"#c6c6c6"];
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    self.contentLabel.font = [UIFont systemFontOfSize:font_13_size];
    self.contentLabel.yf_contentInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(roundImageView.mas_right).mas_offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-30);
        make.height.mas_equalTo(40);
    }];
    self.contentLabel.layer.cornerRadius = 20;
    self.contentLabel.layer.masksToBounds = YES;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"button_arrow_next"];
    [self.contentView addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        
    }];

    
}
- (void)setHistory:(History *)history{
    NSLog(@"------为啥没有数据---------%@",history);
    NSArray *dateArray = [history.date componentsSeparatedByString:@"年"];
    self.dateLabel.text = [NSString stringWithFormat:@"%@年",dateArray[0]];
    self.contentLabel.text = history.title;
}

//- (void)renderCellWithHistory:(History *)history{
//
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
