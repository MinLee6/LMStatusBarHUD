//
//  ViewController.m
//  LMStatusBarHUDDemo
//
//  Created by limin on 16/6/28.
//  Copyright © 2016年 limin. All rights reserved.
//

#import "ViewController.h"
#import "LMStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)sucessClick:(id)sender
{
    [LMStatusBarHUD showSucess:@"修改成功"];
    
}

-(IBAction)errorClick:(id)sender
{
    [LMStatusBarHUD showError:@"加载失败"];
}

-(IBAction)showClick:(id)sender
{
    
    [LMStatusBarHUD showMessage:@"显示"];
    
}

-(IBAction)hideClick:(id)sender
{
    [LMStatusBarHUD hideMessage];
}
-(IBAction)loadingClick:(id)sender
{
    
    [LMStatusBarHUD showLoading:@"加载"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
