//
//  TableViewCell.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell


- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s",__PRETTY_FUNCTION__);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



- (TableViewCell*)initWithStyle:(UITableViewCellStyle)style
                       reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        _QuestionTitleLab.lineBreakMode = NSLineBreakByClipping;
        _QuestionTitleLab.numberOfLines = 2;
    }
    return self;
}

@end
