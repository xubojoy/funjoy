//
//  HistoryCell.m
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "HistoryCell.h"
#import <Masonry/Masonry.h>
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
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    
    return self;
    
}

- (void)initUI{
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(general_space);
        make.top.mas_equalTo(general_padding);
        make.size.mas_equalTo(CGSizeMake(screen_width-2*general_space, 70));
    }];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"button_arrow_next"];
    [self.bgView addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
//        make.top.mas_equalTo(10);
        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        
    }];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    [self.bgView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(general_padding);
        make.top.mas_equalTo(general_padding);
        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-40);
        make.size.height.mas_equalTo(20);
    }];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    [self.bgView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(general_space);
        make.top.mas_equalTo(self.dateLabel.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-40);
        make.size.height.mas_equalTo(20);
    }];
    
}
- (void)setHistory:(History *)history{
    NSLog(@"------为啥没有数据---------%@",history);
    self.dateLabel.text = [NSString stringWithFormat:@"▶ %@",history.date];
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
