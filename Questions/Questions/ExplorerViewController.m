//
//  ExplorerViewController.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "ExplorerViewController.h"
#import "UseViewController.h"
#import "InfoTableViewController.h"
#import <CoreData/CoreData.h>


#define CONTROLVIEW_HEIGHT 200.0f

@interface ExplorerViewController ()

@end

@implementation ExplorerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    [self.view setBackgroundColor:MAIN_COLOR];
    
    [self init_TableView];
    [self init_ControlView];
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)init_TableView
{
    _TableView =[[UITableView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              self.view.frame.size.width,
                                                              self.view.frame.size.height)];
    _TableView.dataSource = self;
    _TableView.delegate = self;
    [_TableView setBackgroundColor:[UIColor whiteColor]];
    [_TableView setSeparatorColor:[UIColor clearColor]];
    [self.view addSubview:_TableView];
}

-(void)init_ControlView
{
    _ControlView = [[MainControlView alloc] initWithFrame:CGRectMake(0,
                                                                     self.view.frame.size.height - CONTROLVIEW_HEIGHT,
                                                                     self.view.frame.size.width,
                                                                     CONTROLVIEW_HEIGHT)];
    [_ControlView.AddBtn addTarget:self action:@selector(AddBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_ControlView.DownloadBtn addTarget:self action:@selector(DownloadBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_ControlView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]]];
    [self.view addSubview:_ControlView];
}

-(void) AddBtnClicked
{
    NSLog(@"AddBtnClicked");
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    InfoTableViewController* InfoVC = [sb instantiateViewControllerWithIdentifier:@"NewQuestionViewController"];
    [self presentViewController:InfoVC animated:YES completion:nil];
}


-(void) DownloadBtnClicked
{
    NSLog(@"DownloadBtnClicked");
    //InfoTableViewController *InfoVC = [[InfoTableViewController alloc] init];
    //[self.navigationController pushViewController:InfoVC animated:YES];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"QuestionCell";
    
    //TableViewCell *cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //cell.leftUtilityButtons = [self leftButtons];
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    
    cell.QuestionTitleLab.text = @"淡江大學人際關係訪問表";
    //[cell.GotoInfoBtn addTarget:self action:@selector(infoBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    
    
    [rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR icon:[UIImage imageNamed:@"sheet3_white.png"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR icon:[UIImage imageNamed:@"outbox4_white.png"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR icon:[UIImage imageNamed:@"chart53_white.png"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR icon:[UIImage imageNamed:@"bin9_white.png"]];
    //[rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR title:@"More"];
    //[rightUtilityButtons sw_addUtilityButtonWithColor: MAIN_COLOR title:@"Delete"];
    
    
    return rightUtilityButtons;
}
/*
- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"sheet3_white.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"list.png"]];
    
    
    return leftUtilityButtons;
}
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_CELL_HEIGHT;
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


-(void) infoBtnClicked
{
    NSLog(@"infoBtnClicked");
    InfoTableViewController *InfoVC = [[InfoTableViewController alloc] init];
    [self.navigationController pushViewController:InfoVC animated:YES];
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bookmark" message:@"Save to favorites successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            break;
        }
        case 1:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Email sent" message:@"Just sent the image to your INBOX" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            break;
        }
        case 2:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Facebook Sharing" message:@"Just shared the pattern image on Facebook" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            break;
        }
        case 3:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter Sharing" message:@"Just shared the pattern image on Twitter" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
        }
        default:
            break;
    }
}


//
// To set navigation bar invisable
//

-(void) navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    
 if (viewController == self) {
 
 [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
 
 [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"no_navbar"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
 
 self.navigationController.navigationBarHidden = YES;
 [self.navigationController.navigationBar setTranslucent:YES];
 [self.navigationController.navigationBar.layer setMasksToBounds:YES];
 
 
 } else {
 
 [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
 [self.navigationController.navigationBar.layer setMasksToBounds:NO];
 [self.navigationController.navigationBar setTranslucent:NO];
 self.navigationController.navigationBarHidden = NO;
 
 
 }
 
 }


@end
