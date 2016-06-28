//
//  LMStatusBarHUD.h
//  LM-状态栏指示器
//
//  Created by limin on 16/6/27.
//  Copyright © 2016年 limin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMStatusBarHUD : NSObject
/** 显示自定义信息*/
+(void)showMessage:(NSString *)message image:(UIImage *)image;
/** 显示成功信息*/
+(void)showSucess:(NSString *)sucess;
/** 显示错误信息*/
+(void)showError:(NSString *)error;
/** 显示普通信息*/
+(void)showMessage:(NSString *)message;
/** 隐藏正在处理的信息*/
+(void)hideMessage;
/** 显示正在处理的信息*/
+(void)showLoading:(NSString *)loading;
@end
