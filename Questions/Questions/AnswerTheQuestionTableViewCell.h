//
//  AnswerTheQuestionTableViewCell.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/18/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questionnaire.h"

#define ASK_ANSWER_TEXTFIELD_RECT   CGRectMake(24.0f, 350.0f, 360.0f, 44)
#define ASK_ANSWER_TEXTLAB_RECT     CGRectMake(390.0f, 350.0f, 300.0f, 44)


@interface AnswerTheQuestionTableViewCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel  *ContentLab;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@property (strong, nonatomic) IBOutlet UIButton *PrevBtn;
@property (strong, nonatomic) IBOutlet UIView   *QuestionPartView;
@property (strong, nonatomic) IBOutlet UITableView *AnswersTableView;
@property (strong, nonatomic) IBOutlet UIButton *ReturnBtn;
@property (strong, nonatomic) NSMutableArray *AnswersArray;
@property (strong, nonatomic) NSMutableArray *LocalAnswersArray;
@property QUESTION_TYPE CurrentQuestionType;
@property NSInteger AnswerCount;

@property (strong, nonatomic) UITextField *AskandAnswerTextField;
@property (strong, nonatomic) UILabel     *AskandAnswerTextLab;


@end
