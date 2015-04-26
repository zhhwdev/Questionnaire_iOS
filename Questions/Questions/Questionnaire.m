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
    
    /*
    NSLog(@"dic = %@", _QuestionInfo);
    NSLog(@"question count = %d", [self GetQuestionCount]);
    NSLog(@"question of 1st %@", [self GetQuestionTitleWithIndex:0]);
    NSLog(@"question type of 1st = %d", [self GetQuestionTypeWithIndex:0]);
    NSLog(@"answer count of 1st %d", [self GetAnswerCountWithIndex:0]);
    NSLog(@"answer count of 1st %@", [self GetAnswersArrayWithIndex:0]);
    */
}

-(NSArray*) GetAllQuestion
{
    return [_QuestionInfo valueForKey:@"questions"];
}

-(NSInteger) GetQuestionCount
{
    return ([[_QuestionInfo valueForKey:@"questions"] count]);
}

-(NSString*) GetQuestionTitleWithIndex : (NSInteger) index
{
    //NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    
    return [[[_QuestionInfo valueForKey:@"questions"] objectAtIndex:index] valueForKey:@"question"];
}

-(NSInteger) GetQuestionTypeWithIndex : (NSInteger) index
{
    //NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    return [[[[_QuestionInfo valueForKey:@"questions"] objectAtIndex:index] valueForKey:@"type"] integerValue];
}

-(NSInteger) GetAnswerCountWithIndex : (NSInteger) index
{
    //NSString *IndexStrForKey = [NSString stringWithFormat:@"%d", index];
    return [[[[_QuestionInfo valueForKey:@"questions"] objectAtIndex:index] valueForKey:@"options"] count]; // minus index, question and type
}


-(NSArray*) GetAnswersArrayWithIndex : (NSInteger) index
{
    
    return [[[_QuestionInfo valueForKey:@"questions"] objectAtIndex:index] valueForKey:@"options"]; // minus index, question and type
}


-(NSString*) GetCommentStringWithIndex : (NSInteger) index //Only for type 1
{
    
    return [[[[[_QuestionInfo valueForKey:@"questions"] objectAtIndex:index] valueForKey:@"options"] firstObject] valueForKey:@"comment"]; // minus index, question and type
}



@end
