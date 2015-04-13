//
//  TableViewCell.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TABLE_CELL_HEIGHT 150
@interface TableViewCell : UITableViewCell
- (TableViewCell*)initWithStyle:(UITableViewCellStyle)style
                reuseIdentifier:(NSString *)reuseIdentifier;
@property (strong, nonatomic) IBOutlet UILabel *QuestionTitleLab;
@property (strong, nonatomic) IBOutlet UIButton *GotoInfoBtn;

@end
