//
//  Questionnaire.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/18/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONFileManager.h"

typedef enum {
    QUESTION_TYPE_DEFAULT,
    QUESTION_TYPE_ASK_ANSWER,
    QUESTION_TYPE_CHOOSE_ANSWER,
}QUESTION_TYPE;

@interface Questionnaire : NSObject
-(Questionnaire*) initWithTheQuestionnaireID : (NSString*) QuestionnaireID;
-(NSInteger) GetQuestionCount;
-(NSString*) GetQuestionTitleWithIndex : (NSInteger) index;
-(NSInteger) GetQuestionTypeWithIndex : (NSInteger) index;

@property (strong, nonatomic) NSDictionary  *QuestionInfo;


@end
