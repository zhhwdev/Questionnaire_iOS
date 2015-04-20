//
//  UseViewController.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerTheQuestionTableViewCell.h"
#import "Questionnaire.h"
#import "JSONFileManager.h"

@interface UseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) Questionnaire *TheQuestionnaire;
@property (strong, nonatomic) UITableView   *TableView;



@end
