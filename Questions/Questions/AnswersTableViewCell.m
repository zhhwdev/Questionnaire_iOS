//
//  AnswersTableViewCell.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/19/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "AnswersTableViewCell.h"

@implementation AnswersTableViewCell

- (void)awakeFromNib {
    _CommentTextField = [[UITextField alloc] initWithFrame:OPTION_COMMENT_DEFAULT_RECT];
    [_CommentTextField setBorderStyle:UITextBorderStyleLine];
    [self.contentView addSubview:_CommentTextField];
    
    _CommentLab = [[UILabel alloc] initWithFrame:OPTION_LABEL_DEFAULT_RECT];
    [_CommentLab setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:_CommentLab];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
