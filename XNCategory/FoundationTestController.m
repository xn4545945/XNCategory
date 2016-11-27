//
//  FoundationTestController.m
//  XNCategory
//
//  Created by xuneng on 2016/11/25.
//  Copyright © 2016年 xn4545945. All rights reserved.
//

#import "FoundationTestController.h"

@interface FoundationTestController ()

@end

@implementation FoundationTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //back
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 150, 44)];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    backBtn.backgroundColor = [UIColor orangeColor];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    //时间处理
    
    
    //字符串处理
    
}

#pragma mark - test



#pragma mark - other
-(void)backBtnClick{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
