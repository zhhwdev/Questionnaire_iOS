//
//  UseViewController.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "UseViewController.h"
#import "General.h"

@interface UseViewController () {
    NSInteger _CurrentIndex;
}

@end

@implementation UseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self init_TheQuestionnaire];
    [self init_TableView];
    [self init_ReplyAnswerArray];
    [self init_Btns];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)init_Btns
{
    _NextBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40 - 135, self.view.frame.size.height - 40 - 65, 135, 65)];
    [_NextBtn setBackgroundColor:MAIN_COLOR];
    [_NextBtn addTarget:self action:@selector(NextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_NextBtn setTitle:@"下一題" forState:UIControlStateNormal];
    [_NextBtn.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [_NextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_NextBtn.layer setCornerRadius:10.0f];
    [self.view addSubview:_NextBtn];
    
    _PrevBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, self.view.frame.size.height - 40 - 65, 135, 65)];
    [_PrevBtn setBackgroundColor:MAIN_COLOR];
    [_PrevBtn addTarget:self action:@selector(PrevBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_PrevBtn setTitle:@"上一題" forState:UIControlStateNormal];
    [_PrevBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_PrevBtn.layer setCornerRadius:10.0f];
    [_PrevBtn.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:_PrevBtn];
    
    _ReturnBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, self.view.frame.size.height - 40 - 65, 135, 65)];
    _ReturnBtn.center = CGPointMake(self.view.frame.size.width / 2, _NextBtn.center.y);
    [_ReturnBtn setBackgroundColor:[UIColor redColor]];
    [_ReturnBtn addTarget:self action:@selector(ReturnBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_ReturnBtn setTitle:@"跳出" forState:UIControlStateNormal];
    [_ReturnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ReturnBtn.layer setCornerRadius:10.0f];
    [_ReturnBtn.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:_ReturnBtn];
    
}

-(void)init_TableView
{
    _TableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _TableView.delegate = self;
    _TableView.dataSource = self;
    _TableView.allowsSelection = NO;
    [_TableView setPagingEnabled:YES];
    _TableView.scrollEnabled = NO;
    [_TableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]]];
    
    [self.view addSubview:_TableView];
}

-(void) init_TheQuestionnaire
{
    _TheQuestionnaire = [[Questionnaire alloc] initWithTheQuestionnaireID:@"1234567890"];
    
}

-(void) init_ReplyAnswerArray
{
    _ReplyAnswerArray = [[NSMutableArray alloc] initWithArray:[_TheQuestionnaire GetAllQuestion] copyItems:YES];
    NSLog(@"%@", [_ReplyAnswerArray objectAtIndex:0]);
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_TheQuestionnaire GetQuestionCount] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"AnswerTheQuestionTableViewCell";
    
    AnswerTheQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AnswerTheQuestionTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (indexPath.row >= [_TheQuestionnaire GetQuestionCount]) {
        
        [cell.QuestionBackView setHidden:YES];
        [cell.ContentLab setHidden:YES];
        [cell.QuestionPartView setHidden:YES];
        [cell.AnswersTableView setHidden:YES];
        [cell.AskandAnswerTextField setHidden:YES];
        [cell.AskandAnswerTextLab setHidden:YES];
        
        [_ReturnBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_PrevBtn setHidden:YES];
        [_NextBtn setHidden:YES];
        
    } else {
        
        NSInteger QuestionIndex = (indexPath.row);
        _CurrentIndex = QuestionIndex;
        cell.ContentLab.text = [_TheQuestionnaire GetQuestionTitleWithIndex:QuestionIndex];
        cell.backgroundColor = [UIColor clearColor];
        
        
        if (indexPath.row == 0) {
            [_PrevBtn setHidden:YES];
        } else {
            [_PrevBtn setHidden:NO];
        }
        
        cell = [self setupTableviewCell:cell
                       WithQuestionType:(QUESTION_TYPE)[_TheQuestionnaire GetQuestionTypeWithIndex:QuestionIndex]
                       andQuestionIndex:QuestionIndex];
        
        

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"AddItemClicked");
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    UseViewController* UseVC = [sb instantiateViewControllerWithIdentifier:@"UseViewController"];
    [self presentViewController:UseVC animated:YES completion:nil];
    [_TableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(AnswerTheQuestionTableViewCell*) setupTableviewCell : (AnswerTheQuestionTableViewCell*) CurrentCell
                                     WithQuestionType : (QUESTION_TYPE) QuestionType
                                     andQuestionIndex : (NSInteger) index
{
    NSLog(@"QuestionType = %d", QuestionType);
    
    CurrentCell.delegate = self;
    
    switch (QuestionType) {
        case QUESTION_TYPE_ASK_ANSWER:
        {
            
            [CurrentCell.AnswersTableView  setHidden:YES];
            [CurrentCell.AskandAnswerTextField  setHidden:NO];
            [CurrentCell.AskandAnswerTextLab  setHidden:NO];
            
            NSString *CommentText = [_TheQuestionnaire GetCommentStringWithIndex:index];
            CommentText = [CommentText stringByReplacingOccurrencesOfString:@"***" withString:@""];
            [CurrentCell.AskandAnswerTextLab setText:CommentText];
            
        }
            break;
            
        case QUESTION_TYPE_SINGLE_CHOISE:
            
            [CurrentCell.AnswersTableView  setHidden:NO];
            CurrentCell.AnswerCount = [_TheQuestionnaire GetAnswerCountWithIndex:index];
            CurrentCell.AnswersArray = [NSMutableArray arrayWithArray:[[_ReplyAnswerArray valueForKey:@"options"] objectAtIndex:index]];
            
            CurrentCell.CurrentQuestionType = QuestionType;
            [CurrentCell.AnswersTableView  reloadData];
            
            [CurrentCell.AskandAnswerTextField  setHidden:YES];
            [CurrentCell.AskandAnswerTextLab  setHidden:YES];
            
            break;
            
        case QUESTION_TYPE_SINGLE_CHOISE_WITH_COMMENT:
            
            [CurrentCell.AnswersTableView  setHidden:NO];
            CurrentCell.AnswerCount = [_TheQuestionnaire GetAnswerCountWithIndex:index];
            //CurrentCell.AnswersArray = [NSMutableArray arrayWithArray:[_TheQuestionnaire GetAnswersArrayWithIndex:index]];
            CurrentCell.AnswersArray = [NSMutableArray arrayWithArray:[[_ReplyAnswerArray valueForKey:@"options"] objectAtIndex:index]];
            
            CurrentCell.CurrentQuestionType = QuestionType;
            [CurrentCell.AnswersTableView  reloadData];
            
            [CurrentCell.AskandAnswerTextField  setHidden:YES];
            [CurrentCell.AskandAnswerTextLab  setHidden:YES];
            
            break;
        default:
            break;
    }
    return CurrentCell;
}

-(void) ReturnBtnClicked
{
    NSLog(@"ReturnBtnClicked");
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) NextBtnClicked
{
    //NSLog(@"NextBtnClicked %d", [self GetCurrentCell]);
    if ([self GetCurrentCell] + 1 >= [_TheQuestionnaire GetQuestionCount]) {

        NSIndexPath *Indexpath = [NSIndexPath indexPathForRow:([self GetCurrentCell] + 1) inSection:0];        
        [_TableView scrollToRowAtIndexPath:Indexpath atScrollPosition:UITableViewScrollPositionTop animated:YES];

    } else {
        NSIndexPath *Indexpath = [NSIndexPath indexPathForRow:([self GetCurrentCell] + 1) inSection:0];
        [_TableView scrollToRowAtIndexPath:Indexpath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
}


-(void) PrevBtnClicked
{
    NSLog(@"PrevBtnClicked");
    
    NSIndexPath *Indexpath = [NSIndexPath indexPathForRow:([self GetCurrentCell] - 1) inSection:0];
    [_TableView scrollToRowAtIndexPath:Indexpath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(NSInteger) GetCurrentCell
{
    return (NSInteger)((_TableView.contentOffset.y / self.view.frame.size.height));
}


-(void) OptionHasBeenSelected:(NSArray*) OptionArray
{
    [self SetReplyAnswerArrayAfterAnswerWithOptionArray:OptionArray];
}

-(void) SetReplyAnswerArrayAfterAnswerWithOptionArray : (NSArray*) OptionArray
{
    
    NSMutableDictionary *QuestionObj = [[NSMutableDictionary alloc] initWithDictionary:[_ReplyAnswerArray objectAtIndex:_CurrentIndex]];
    [QuestionObj setValue:OptionArray forKey:@"options"];
    [_ReplyAnswerArray replaceObjectAtIndex:_CurrentIndex withObject:QuestionObj];

}

@end
