//
//  ExplorerViewController.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "General.h"
#import "MainControlView.h"


@interface ExplorerViewController : UIViewController <UINavigationControllerDelegate,
                                                        UITableViewDataSource,
                                                        UITableViewDelegate,
                                                        UITabBarDelegate>
@property (strong, nonatomic) UITableView       *TableView;
@property (strong, nonatomic) MainControlView   *ControlView;
@end
