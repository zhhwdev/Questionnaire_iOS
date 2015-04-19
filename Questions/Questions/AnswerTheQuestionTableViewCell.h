//
//  AnswerTheQuestionTableViewCell.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/18/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTheQuestionTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *ContentLab;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@property (strong, nonatomic) IBOutlet UIButton *PrevBtn;
@property (strong, nonatomic) IBOutlet UIView *QuestionPartView;

@end
