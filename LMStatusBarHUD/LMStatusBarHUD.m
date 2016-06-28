//
//  LMStatusBarHUD.m
//  LM-状态栏指示器
//
//  Created by limin on 16/6/27.
//  Copyright © 2016年 limin. All rights reserved.
//IOS 1.2.6  1:大版本，2功能更新版本 6:bug修复版本号
//0.0.0 出现bug。变为 0.0.1－－0.0.12 增加新功能 0.1.0-－0.1.12  面向别人的东西变了， 1.0.0-－1.0.13
#import "LMStatusBarHUD.h"
#define LMMsgFont [UIFont systemFontOfSize:12]
#define LMScreenW [UIScreen mainScreen].bounds.size.width
/** 消息停留时间*/
static CGFloat const LMMsgDuration = 2.0;
/** 消息显示／隐藏时间*/
static CGFloat const LMAniDuration = 0.25;
@implementation LMStatusBarHUD
/** 全局窗口，自动销毁*/
static UIWindow *window_;
/** 定时器对象*/
static NSTimer *timer_;
/**创建窗口 */
+(void)showWindow
{
    //frame
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, LMScreenW, windowH);
    //显示窗口
    window_.hidden = YES;//防止窗口残留
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //执行动画
    frame.origin.y = 0;
    [UIView animateWithDuration:LMAniDuration animations:^{
        window_.frame = frame;
    }];
}
/** 显示自定义信息*/
+(void)showMessage:(NSString *)message image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    //添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:message forState:UIControlStateNormal];
    [btn.titleLabel setFont:LMMsgFont];
    
    if(image)
    {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
   
    btn.frame = window_.bounds;
    [window_ addSubview:btn];
    
    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LMMsgDuration target:self selector:@selector(hideMessage) userInfo:nil repeats:NO];
    
}
/** 显示成功信息*/
+(void)showSucess:(NSString *)sucess
{
    UIImage *check = [UIImage imageNamed:@"LMStatusBarHUD.bundle/check"];
    
    [LMStatusBarHUD showMessage:sucess image:check];
}
/** 显示错误信息*/
+(void)showError:(NSString *)error
{
    UIImage *errorImage = [UIImage imageNamed:@"LMStatusBarHUD.bundle/error"];
    
    [LMStatusBarHUD showMessage:error image:errorImage];
    
}
/** 显示正在处理的信息*/
+(void)showMessage:(NSString *)message
{
    [LMStatusBarHUD showMessage:message image:nil];
}
/** 隐藏正在处理的信息*/
+(void)hideMessage
{
    
    [UIView animateWithDuration:LMAniDuration animations:^{
        //
        CGRect frame = window_.frame;
        
        //执行动画
        frame.origin.y = -window_.frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
/** 显示正在处理的信息*/
+(void)showLoading:(NSString *)loading
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    //添加文字
    UILabel *label = [[UILabel alloc]initWithFrame:window_.bounds];
    label.font = LMMsgFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = loading;
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat msgW = [loading sizeWithAttributes:@{NSFontAttributeName:LMMsgFont}].width;
    CGFloat centerX = (LMScreenW-msgW)*0.5-20;
    loadingView.center = CGPointMake(centerX, 10);
    [window_ addSubview:loadingView];
}

@end
