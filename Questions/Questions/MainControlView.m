//
//  MainControlView.m
//  Questions
//
//  Created by CHIN-KANG CHANG on 4/13/15.
//  Copyright (c) 2015 HippoColors. All rights reserved.
//

#import "MainControlView.h"

@implementation MainControlView
-(MainControlView*)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self init_AddBtn];
        [self init_DownloadBtn];
    }
    return self;
}

-(void) init_AddBtn
{
    CGRect Frame = self.bounds;
    Frame.size.height = ADD_BTN_RECT_WIDTH;
    Frame.size.width = ADD_BTN_RECT_WIDTH;
    _AddBtn = [[UIButton alloc] initWithFrame:Frame];
    [_AddBtn setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    [_AddBtn setCenter:CGPointMake(self.frame.size.width / 4, self.frame.size.height / 2)];
    NSLog(@"_AddBtn = %@", _AddBtn);
    [self addSubview:_AddBtn];
}


-(void) init_DownloadBtn
{
    CGRect Frame = self.bounds;
    Frame.origin.x += ADD_BTN_RECT_WIDTH;
    Frame.size.height = ADD_BTN_RECT_WIDTH;
    Frame.size.width = ADD_BTN_RECT_WIDTH;
    _DownloadBtn = [[UIButton alloc] initWithFrame:Frame];
    [_DownloadBtn setImage:[UIImage imageNamed:@"download.png"] forState:UIControlStateNormal];
    [_DownloadBtn setCenter:CGPointMake((self.frame.size.width / 4) * 3, self.frame.size.height / 2)];
    [self addSubview:_DownloadBtn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
