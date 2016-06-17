//
//  HYBlockAlertView.h
//  HYBlockAlertView
//
//  Created by ZhangZheming on 16/6/17.
//  Copyright © 2016年 HY. All rights reserved.
//
/*
 * this enum is show alert status
 */
typedef enum{
    HYBlockAlertViewWillPresent,
    HYBlockAlertViewDidPresent,
    HYBlockAlertViewWillDismiss,
    HYBlockAlertViewDidDismiss,
    HYBlockAlertViewOnWindow
}HYBlockAlertViewStatus;

#import <UIKit/UIKit.h>

@class HYBlockAlertView;
/*
 * call back block 
 * buttonIndex is selectbuttonIndex
 * status is show alert status
 */
typedef void(^HYBlockAlertViewBlock)(UIAlertView *blockAlertView, NSInteger buttonIndex,HYBlockAlertViewStatus status);

@interface HYBlockAlertView : UIAlertView
/*
 * you need to call this function and set delegate is nil, if you not call this function everything will be wrong
 */
- (void)block:(HYBlockAlertViewBlock)callBack;

@end
