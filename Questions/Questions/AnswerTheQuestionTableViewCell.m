//
//  AnswerTheQuestionTableViewCell.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/18/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "AnswerTheQuestionTableViewCell.h"
#import "AnswersTableViewCell.h"

@implementation AnswerTheQuestionTableViewCell

- (void)awakeFromNib {
    
    // Initialization code
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [_AnswersTableView setSeparatorColor:[UIColor clearColor]];
    [_AnswersTableView setScrollEnabled:NO];
    _AnswersTableView.delegate = self;
    _AnswersTableView.dataSource = self;
    [_AnswersTableView setBackgroundColor:[UIColor clearColor]];
    
    _AskandAnswerTextField = [[UITextField alloc] initWithFrame:ASK_ANSWER_TEXTFIELD_RECT];
    [_AskandAnswerTextField setBorderStyle:UITextBorderStyleLine];
    [_AskandAnswerTextField setHidden:YES];
    [_AskandAnswerTextField setUserInteractionEnabled:YES];
    [_AskandAnswerTextField setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:_AskandAnswerTextField];
    
    _AskandAnswerTextLab = [[UILabel alloc] initWithFrame:ASK_ANSWER_TEXTLAB_RECT];
    [_AskandAnswerTextLab setFont:[UIFont systemFontOfSize:30.0f]];
    [_AskandAnswerTextLab setHidden:YES];
    [self.contentView addSubview:_AskandAnswerTextLab];
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _AnswerCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"AnswersTableViewCell";
    
    AnswersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AnswersTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Set option cell
    cell.AnswerLab.text = [[_AnswersArray valueForKey:@"key"] objectAtIndex:indexPath.row];
    [cell.ChoosenBtn addTarget:self action:@selector(ChoosenBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.ChoosenBtn.tag = indexPath.row;
    
    
    //NSLog(@"%s !!! - %d", __PRETTY_FUNCTION__, [[[_AnswersArray valueForKey:@"value"] objectAtIndex:indexPath.row] boolValue]);
    if ([[[_AnswersArray valueForKey:@"value"] objectAtIndex:indexPath.row] boolValue]) {
        [cell.ChoosenBtn setImage:[UIImage imageNamed:@"circular203.png"] forState:UIControlStateNormal];
    } else {
        [cell.ChoosenBtn setImage:[UIImage imageNamed:@"close32.png"] forState:UIControlStateNormal];
    }
    
    
    // If there is comment for the option
    if ([[[_AnswersArray valueForKey:@"commentEnable"] objectAtIndex:indexPath.row] boolValue]) {
        
        [cell.CommentTextField setHidden:NO];
        [cell.CommentTextField setUserInteractionEnabled:YES];

        if ([[[_AnswersArray valueForKey:@"comment"] objectAtIndex:indexPath.row] length] > 3) {
            [cell.CommentLab setHidden:NO];
            
            NSString *CommentLabText = [[_AnswersArray valueForKey:@"comment"] objectAtIndex:indexPath.row];
            NSRange Range = [CommentLabText rangeOfString:@"***"];
            if (Range.location != 0) {
                NSLog(@"!!! TODO: Move the label in front of the textField");
            }
            CommentLabText = [CommentLabText stringByReplacingOccurrencesOfString:@"***" withString:@""];
            [cell.CommentLab setText:CommentLabText];
            [cell.CommentLab sizeToFit];
            
        } else {
            [cell.CommentLab setHidden:YES];
        }


    } else {
        
        [cell.CommentLab setHidden:YES];
        [cell.CommentTextField setHidden:YES];
        
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[[_AnswersArray valueForKey:@"commentEnable"] objectAtIndex:indexPath.row] boolValue]) {
        return 150.0f;
    }
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self SelectOptionWithIndex:indexPath.row];
}

-(void) ChoosenBtnClicked:(id)sender
{
    //NSLog(@"ChoosenBtn %d", ((UIButton*) sender).tag);
    NSInteger index = ((UIButton*) sender).tag;
    
    [self SelectOptionWithIndex:index];
}



-(void) SelectOptionWithIndex : (NSInteger) OptionIndex
{
    
    // TODO: To handle single selection
    switch (_CurrentQuestionType) {
        case QUESTION_TYPE_SINGLE_CHOISE:
        case QUESTION_TYPE_SINGLE_CHOISE_WITH_COMMENT:
        {
            for (NSInteger index = 0; index < [_AnswersArray count]; index++) {
                NSMutableDictionary *Dictionary = [[NSMutableDictionary alloc] initWithDictionary:[_AnswersArray objectAtIndex:index]];
                if ([[Dictionary valueForKey:@"value"] boolValue]) {
                    [Dictionary setValue:[NSNumber numberWithBool:NO] forKey:@"value"]; // Set option as selected
                    [_AnswersArray replaceObjectAtIndex:index withObject:Dictionary];
                }
                
            }
            NSMutableDictionary *CurrentAnswer = [[NSMutableDictionary alloc] initWithDictionary:[_AnswersArray objectAtIndex:OptionIndex]];
            [CurrentAnswer setValue:[NSNumber numberWithBool:YES] forKey:@"value"]; // Set option as selected
            [_AnswersArray replaceObjectAtIndex:OptionIndex withObject:CurrentAnswer];
            [_AnswersTableView reloadData];
        }
            
            break;
            
        case QUESTION_TYPE_MULTI_CHOISE:
        case QUESTION_TYPE_MULTI_CHOISE_WITH_COMMENT:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    [_delegate OptionHasBeenSelected:_AnswersArray];
}




@end
