//
//  UseViewController.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "UseViewController.h"

@interface UseViewController ()

@end

@implementation UseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    [self init_TableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)init_TableView
{
    _TableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _TableView.delegate = self;
    _TableView.dataSource = self;
    _TableView.allowsSelection = NO;
    [_TableView setPagingEnabled:YES];
    _TableView.scrollEnabled = YES;
    
    [self.view addSubview:_TableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
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
    /*
    UILabel *QuestionLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 675, 100)];
    QuestionLab.font = [UIFont systemFontOfSize:30.0f];
    QuestionLab.text = @"這邊是問題區";
    [QuestionLab setTextColor:[UIColor whiteColor]];
    [cell.QuestionPartView addSubview:QuestionLab];
    */
    cell.ContentLab.text = @"1這邊是問題區 2這邊是問題區 3這邊是問題區 4這邊是問題區 5這邊是問題區 6這邊是問題區 7這邊是問題區 8這邊是問題區 9這邊是問題區 1這邊是問題區 2這邊是問題區 3這邊是問題區 4這邊是問題區 5這邊是問題區";
    cell.backgroundColor = [UIColor whiteColor];
    [cell.NextBtn addTarget:self action:@selector(NextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [cell.PrevBtn addTarget:self action:@selector(PrevBtnClicked) forControlEvents:UIControlEventTouchUpInside];
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

-(void) NextBtnClicked
{
    NSLog(@"NextBtnClicked %d", [self GetCurrentCell]);
    
    NSIndexPath *Indexpath = [NSIndexPath indexPathForRow:([self GetCurrentCell] + 1) inSection:0];
    [_TableView scrollToRowAtIndexPath:Indexpath atScrollPosition:UITableViewScrollPositionTop animated:YES];
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

@end
