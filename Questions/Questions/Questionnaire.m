//
//  Questionnaire.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/18/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "Questionnaire.h"

@implementation Questionnaire

-(Questionnaire*) initWithTheQuestionnaireID : (NSString*) QuestionnaireID
{
    self = [super init];
    if (self) {
        [self init_QuestionInfoWithID:QuestionnaireID];
    }
    return self;
}


-(void)init_QuestionInfoWithID:(NSString*) QuestionnaireID
{
    _QuestionInfo = [JSONFileManager JSON_ReadJSONFileWithFileName:QuestionnaireID];
    NSLog(@"dic = %@", _QuestionInfo);
    NSLog(@"question count = %d", [self GetQuestionCount]);
    NSLog(@"question of 1st %@", [self GetQuestionTitleWithIndex:1]);
    NSLog(@"question type of 1st %d", [self GetQuestionTypeWithIndex:1]);
    NSLog(@"answer count of 1st %d", [self GetAnswerCountWithIndex:1]);
}

-(NSInteger) GetQuestionCount
{
    return ([[_QuestionInfo valueForKey:@"questions"] count]);
}

-(NSString*) GetQuestionTitleWithIndex : (NSInteger) index
{
    NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    return [[[_QuestionInfo valueForKey:@"questions"] valueForKey:IndexStrForKey] valueForKey:@"question"];
}

-(NSInteger) GetQuestionTypeWithIndex : (NSInteger) index
{
    NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    return [[[[_QuestionInfo valueForKey:@"questions"] valueForKey:IndexStrForKey] valueForKey:@"type"] integerValue];
}

-(NSInteger) GetAnswerCountWithIndex : (NSInteger) index
{
    NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    return [[[_QuestionInfo valueForKey:@"questions"] valueForKey:IndexStrForKey] count] - 3; // minus index, question and type
}

/* TODO:
-(NSArray*) GetAnswersArrayWithIndex : (NSInteger) index
{
    NSInteger answerCount = [self GetAnswerCountWithIndex:index];
    NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    
    return [[[_QuestionInfo valueForKey:@"questions"] valueForKey:IndexStrForKey] count] - 3; // minus index, question and type
}
*/

@end
