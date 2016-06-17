//
//  ViewController.m
//  HYBlockAlertView
//
//  Created by ZhangZheming on 16/6/17.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "ViewController.h"
#import "HYBlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(showHYBlockAlertView) withObject:nil afterDelay:1.f];
}

- (void)showHYBlockAlertView
{
    HYBlockAlertView *alertView = [[HYBlockAlertView alloc] initWithTitle:@"HYBlockAlertView" message:@"This is HYBlockAlertView, a block alert view" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"好", nil];
    [alertView block:^(id cc, NSInteger buttonIndex, HYBlockAlertViewStatus status) {
        switch (status) {
            case HYBlockAlertViewWillPresent:
                NSLog(@"HYBlockAlertViewWillPresent");
                break;
            case HYBlockAlertViewDidPresent:
                NSLog(@"HYBlockAlertViewDidPresent");
                break;
            case HYBlockAlertViewOnWindow:
                NSLog(@"HYBlockAlertViewOnWindow");
                NSLog(@"%@,%d,%d",cc,buttonIndex,status);
                break;
            case HYBlockAlertViewWillDismiss:
                NSLog(@"HYBlockAlertViewWillDismiss");
                break;
            case HYBlockAlertViewDidDismiss:
                NSLog(@"HYBlockAlertViewDidDismiss");
                break;
            default:
                break;
        }
    }];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
