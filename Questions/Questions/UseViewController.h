//
//  UseViewController.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerTheQuestionTableViewCell.h"
#import "PersonalInfoTableViewCell.h"
#import "Questionnaire.h"
#import "JSONFileManager.h"

typedef enum {
    PERSONAL_INFO_NAME_TAG,
    PERSONAL_INFO_MOBILE_TAG,
    PERSONAL_INFO_MAJOR_TAG,
    PERSONAL_INFO_CLASS_TAG,
} PERSONAL_INFO_TEXTFIELD_TAG;

@interface UseViewController : UIViewController <UITableViewDataSource,
                                                    UITableViewDelegate,
                                                    AnswerTheQuestionDelegate,
                                                    UITextFieldDelegate>

@property (strong, nonatomic) Questionnaire *TheQuestionnaire;
@property (strong, nonatomic) UITableView   *TableView;

@property (strong, nonatomic) NSMutableArray *ReplyAnswerArray;

@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@property (strong, nonatomic) IBOutlet UIButton *PrevBtn;
@property (strong, nonatomic) IBOutlet UIButton *ReturnBtn;

@end
