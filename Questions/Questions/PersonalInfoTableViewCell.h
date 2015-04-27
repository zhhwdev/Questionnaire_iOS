//
//  PersonalInfoTableViewCell.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/27/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField  *NameTextField;
@property (strong, nonatomic) IBOutlet UITextField  *PhoneTextField;
@property (strong, nonatomic) IBOutlet UIButton     *MaleBtn;
@property (strong, nonatomic) IBOutlet UIButton     *FemaleBtn;
@property (strong, nonatomic) IBOutlet UITextField  *MajorTextField;
@property (strong, nonatomic) IBOutlet UITextField  *ClassTextField;
@end
