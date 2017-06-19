//
//  nextTableViewCell.m
//  pull
//
//  Created by 罗浩 on 2017/6/14.
//  Copyright © 2017年 qiwei. All rights reserved.
//

#import "nextTableViewCell.h"
#import "Masonry.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
@implementation nextTableViewCell
{
    UILabel *lable;
    UILabel *bottomLabel;
    UIImageView *picImageView;
    UIView *bottomView;
    UIView *topView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //self.contentView.bounds = [UIScreen mainScreen].bounds;
        topView = [UIView new];
        topView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.offset(10);
            make.size.mas_equalTo(CGSizeMake(70, 30));
        }];
        
        lable = [UILabel new];
        lable.textColor = [UIColor redColor];
        lable.numberOfLines = 0;
        //[lable sizeToFit];
        [self.contentView addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(topView);
            make.right.offset(-10);
            make.top.equalTo(topView.mas_bottom).offset(5);
        }];
        
        bottomView = [UIView new];
        bottomView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lable.mas_bottom).offset(10);
            make.left.offset(10);
            make.size.mas_equalTo(CGSizeMake(70, 30));
        }];
        
        UIImageView *imageView = [UIImageView new];
        picImageView = imageView;
        [self.contentView addSubview:picImageView];
        [picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(topView);
            make.top.equalTo(bottomView.mas_bottom).offset(10);
        }];
        
        bottomLabel = [UILabel new];
        bottomLabel.numberOfLines = 0;
        //bottomLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:bottomLabel];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(topView);
            //make.right.offset(-10);
            make.width.offset(SCREEN_WIDTH - 20);
            make.top.equalTo(picImageView.mas_bottom).offset(5);
            make.bottom.offset(-10);
        }];
        
    }
    return self;
}

- (void)setTheText:(NSString *)theText
{
    lable.text = theText;
    bottomLabel.text = theText;
    
    
}
- (void)setIndex:(NSInteger)index
{
    [picImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        if (index == 1)
        {
            make.height.offset(100);
        }else
        {
            make.height.offset(250);
        }
    }];
    UIImage *image = (index == 1)?[UIImage imageNamed:@"login_logo"]:[UIImage imageNamed:@"111"];
    picImageView.image = image;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
