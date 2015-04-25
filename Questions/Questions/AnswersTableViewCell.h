//
//  AnswersTableViewCell.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/19/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>

#define OPTION_COMMENT_DEFAULT_RECT CGRectMake(90.0f, 80.0f, 200.0f, 44)
#define OPTION_LABEL_DEFAULT_RECT   CGRectMake(300.0f, 80.0f, 100.0f, 44)


@interface AnswersTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *AnswerLab;
@property (strong, nonatomic) IBOutlet UIButton *ChoosenBtn;
@property (strong, nonatomic) IBOutlet UITextField *CommentTextField;
@property (strong, nonatomic) IBOutlet UILabel *CommentLab;

@end
