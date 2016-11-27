//
//  ViewController.m
//  XNCategory
//
//  Created by xuneng on 16/8/11.
//  Copyright © 2016年 xn4545945. All rights reserved.
//

#import "UIKitTestController.h"
#import "FoundationTestController.h"


#import "UIImage+DrawImage.h"
#import "UIImage+ResizeImage.h"
#import "UIImageView+RunAnimation.h"
#import "UIView+AccessFrameComponent.h"
#import "UIView+RoundCorner.h"


@interface UIKitTestController ()

@end

@implementation UIKitTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //跳转到Foundation测试
    UIButton *toFoundationBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 150, 44)];
    [toFoundationBtn setTitle:@"FoundationTest" forState:UIControlStateNormal];
    toFoundationBtn.backgroundColor = [UIColor orangeColor];
    [toFoundationBtn addTarget:self action:@selector(toFoundationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toFoundationBtn];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //绘制一个纯色的image
    [self drawImage];
    
    //创建一个拉伸不变形的image
    [self resizeImage];
    
    //UIImageView播放动画
    [self runAnimation];
    
    //便捷设置与访问frame
    [self accessFrameComponent];
    
    //圆角
    [self roundCorner];
}

#pragma mark - test
-(void)drawImage{
//    UIImageView *imgIV = [[UIImageView alloc] initWithImage:[UIImage drawImageWithColor:[UIColor greenColor] size:CGSizeMake(100, 100)]];  //自定义颜色
    UIImageView *imgIV = [[UIImageView alloc] initWithImage:[UIImage drawPlaceHolderImage]];
    imgIV.frame = CGRectMake(0, 20, 150, 100);
    [self.view addSubview:imgIV];
}

-(void)resizeImage{
    UIImageView *imgIV = [[UIImageView alloc] initWithImage:[UIImage resizableImageNamed:@"chat_bg.png"]];
    imgIV.frame = CGRectMake(0, 200, 300, 80); //拉伸不变形
    [self.view addSubview:imgIV];
}

-(void)runAnimation{
    UIImageView *imgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 54, 54)];
    [imgIV runAnimationWithCount:6 name:@"runningman_" delatTime:0.1 repeatCount:INT_MAX];
//    [imgIV runAnimationWithCount:6 name:@"runningman_" delatTime:0.1 repeatCount:1];
    [self.view addSubview:imgIV];
}

-(void)accessFrameComponent{
    UIView *testView = [[UIView alloc] init];
    testView.frame = CGRectMake(0, 0, 50, 50);
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    
    //直接对x,y,width,height进行设置(也可获取)
    testView.x = 50;
    testView.y = 100;
    testView.width = 100;
//    testView.height = 100;
    
    NSLog(@"%f",testView.height);
}

-(void)roundCorner{
    //圆角
    UIImageView *imgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 91, 91)];
    imgIV.image = [UIImage imageNamed:@"imageTest.png"];
    [imgIV roundCorner];
    [self.view addSubview:imgIV];
    
    //圆形
    UIImageView *imgIV1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, 91, 91)];
    imgIV1.image = [UIImage imageNamed:@"imageTest.png"];
    [imgIV1 circularClipping];
    [self.view addSubview:imgIV1];
    
    //自定义
    UIImageView *imgIV2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 400, 91, 91)];
    imgIV2.image = [UIImage imageNamed:@"imageTest.png"];
    [imgIV2 roundCornerWithBorderWidth:2.0 borderColor:[UIColor greenColor] cornerRadius:20];
    [self.view addSubview:imgIV2];
    
}

#pragma mark - other
-(void)toFoundationBtnClick{
    FoundationTestController *toVC = [[FoundationTestController alloc] init];
    [self presentViewController:toVC animated:YES completion:NULL];
}

@end
