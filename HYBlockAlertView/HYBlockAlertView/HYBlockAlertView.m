//
//  HYBlockAlertView.m
//  HYBlockAlertView
//
//  Created by ZhangZheming on 16/6/17.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYBlockAlertView.h"

@interface HYBlockAlertView ()<UIAlertViewDelegate>
@property (nonatomic, copy) HYBlockAlertViewBlock callBack;
@property (nonatomic) HYBlockAlertViewStatus status;

@end

@implementation HYBlockAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)block:(HYBlockAlertViewBlock)callBack
{
    self.callBack = callBack;
    self.delegate = self;
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.status = HYBlockAlertViewOnWindow;
    if (self.callBack != nil) {
        self.callBack(alertView,buttonIndex,self.status);
    }
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    self.status = HYBlockAlertViewWillPresent;
    if (self.callBack != nil) {
        self.callBack(alertView,alertView.cancelButtonIndex,self.status);
    }
}

// before animation and showing view
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    self.status = HYBlockAlertViewWillPresent;
    if (self.callBack != nil) {
        self.callBack(alertView,9999,self.status);
    }
}

// after animation
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    self.status = HYBlockAlertViewDidPresent;
    if (self.callBack != nil) {
        self.callBack(alertView,9999,self.status);
    }
}

// before animation and hiding view
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.status = HYBlockAlertViewWillDismiss;
    if (self.callBack != nil) {
        self.callBack(alertView,buttonIndex,self.status);
    }
}

 // after animation
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.status = HYBlockAlertViewDidDismiss;
    if (self.callBack != nil) {
        self.callBack(alertView,buttonIndex,self.status);
    }
}

@end
