//
//  MainControlView.h
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ADD_BTN_RECT_WIDTH 100

@interface MainControlView : UIView
-(MainControlView*)initWithFrame:(CGRect)frame;

@property (strong, nonatomic) UIButton *AddBtn;
@property (strong, nonatomic) UIButton *DownloadBtn;
@end
