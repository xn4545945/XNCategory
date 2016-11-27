//
//  MZjumpVC.m
//  AskTeacher
//
//  Created by xuneng on 15/7/23.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//  集中放弹出页. 方便设置宽高及各种数据.

#import "MZjumpVC.h"
#import "MZFormSheetController.h"
#import "PopTableViewController.h"
#import "EditCheWei.h"

@implementation MZjumpVC


//选择付款方式
+(void)MZjump2ChooseTimeZoneFromVC:(UIViewController *)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        float tWidth = 320;//350
        float tHeight = 200;
        
        if (kDevice_Is_iPhone4s) {
            tWidth = 280; //300
        }
        
        //弹出. 方型
        PopTableViewController *mainVC = [[PopTableViewController alloc] init];
        mainVC.passDatasource = @[@"1小时",@"2小时",@"3小时",@"4小时",@"5小时",@"6小时",@"8小时",@"10小时",@"12小时",@"24小时"];
        mainVC.passTag = kEditOrder3RantTime;
        mainVC.winWidth = tWidth;
        mainVC.winHeight = tHeight;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:mainVC];
        formSheet.presentedFormSheetSize = CGSizeMake(tWidth, tHeight);
        formSheet.cornerRadius = 2.0; //圆角
        formSheet.shadowOpacity = 0.3;
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromBottom;
        formSheet.shouldDismissOnBackgroundViewTap = YES;
        formSheet.shouldCenterVertically = YES;
        formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
        [MZFormSheetController sharedBackgroundWindow].formSheetBackgroundWindowDelegate = vc;
        [vc mz_presentFormSheetController:formSheet animated:YES completionHandler:nil];
        
    });
    
}


//选择我的车
+(void)MZjump2ChooseMyCarFromVC:(UIViewController *)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        float tWidth = 320;
        float tHeight = 200;
        
        if (kDevice_Is_iPhone4s) {
            tWidth = 280;
        }
        
        //弹出. 方型
        PopTableViewController *mainVC = [[PopTableViewController alloc] init];
//        mainVC.passDatasource = @[@"我的车1",@"我的车2",@"我的车3",@"我的车4"];
        mainVC.passDatasource = nil;  //为空的话加载网络上的
        mainVC.passTag = kEditOrder4CarNo;
        mainVC.winWidth = tWidth;
        mainVC.winHeight = tHeight;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:mainVC];
        formSheet.presentedFormSheetSize = CGSizeMake(tWidth, tHeight);
        formSheet.cornerRadius = 2.0; //圆角
        formSheet.shadowOpacity = 0.3;
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromBottom;
        formSheet.shouldDismissOnBackgroundViewTap = YES;
        formSheet.shouldCenterVertically = YES;
        formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
        [MZFormSheetController sharedBackgroundWindow].formSheetBackgroundWindowDelegate = vc;
        [vc mz_presentFormSheetController:formSheet animated:YES completionHandler:nil];
        
    });
    
}

//选择付款方式
+(void)MZjump2ChoosePaymentFromVC:(UIViewController *)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        float tWidth = 320;//350
        //float tHeight = 200;
        float tHeight = 2*48;
        
        if (kDevice_Is_iPhone4s) {
            tWidth = 280; //300
        }
        
        NSString *balance = [[NSUserDefaults standardUserDefaults] valueForKey:@"balance"]; //取
        NSString *passStr = [NSString stringWithFormat:@"账户余额(%@元)",balance];
        
        //弹出. 方型
        PopTableViewController *mainVC = [[PopTableViewController alloc] init];
        mainVC.passDatasource = @[passStr,@"微信支付"];
        mainVC.passTag = kEditOrder5Payment;
        mainVC.winWidth = tWidth;
        mainVC.winHeight = tHeight;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:mainVC];
        formSheet.presentedFormSheetSize = CGSizeMake(tWidth, tHeight);
        formSheet.cornerRadius = 2.0; //圆角
        formSheet.shadowOpacity = 0.3;
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromBottom;
        formSheet.shouldDismissOnBackgroundViewTap = YES;
        formSheet.shouldCenterVertically = YES;
        formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
        [MZFormSheetController sharedBackgroundWindow].formSheetBackgroundWindowDelegate = vc;
        [vc mz_presentFormSheetController:formSheet animated:YES completionHandler:nil];
        
    });

}

/*
+(void)MZjump2ChooseCategory:(UIViewController *)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        float tWidth = 350;
        float tHeight = 180;
        
        if (kScreenWidth == 320) {
            tWidth = 300;
        }
        
        //弹出. 方型
        HomeChooseQuestionCategoryViewController *mainVC = [[HomeChooseQuestionCategoryViewController alloc] init];
        mainVC.winWidth = tWidth;
        mainVC.winHeight = tHeight;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:mainVC];
        formSheet.presentedFormSheetSize = CGSizeMake(tWidth, tHeight);
        formSheet.cornerRadius = 2.0; //圆角
        formSheet.shadowOpacity = 0.3;
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromBottom;
        formSheet.shouldDismissOnBackgroundViewTap = YES;
        formSheet.shouldCenterVertically = YES;
        formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
        [MZFormSheetController sharedBackgroundWindow].formSheetBackgroundWindowDelegate = vc;
        [vc mz_presentFormSheetController:formSheet animated:YES completionHandler:nil];
        
    });
    
}



+(void)MZjump2ExpertChoose:(UIViewController *)vc{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        float tWidth = 300;
        float tHeight = 300;
 
        
        //弹出. 方型
        expertChooseFieldViewController *mainVC = [[expertChooseFieldViewController alloc] init];
        mainVC.winWidth = tWidth;
        mainVC.winHeight = tHeight;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:mainVC];
        formSheet.presentedFormSheetSize = CGSizeMake(tWidth, tHeight);
        formSheet.cornerRadius = 2.0; //圆角
        formSheet.shadowOpacity = 0.3;
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromBottom;
        formSheet.shouldDismissOnBackgroundViewTap = YES;
        formSheet.shouldCenterVertically = YES;
        formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
        [MZFormSheetController sharedBackgroundWindow].formSheetBackgroundWindowDelegate = vc;
        [vc mz_presentFormSheetController:formSheet animated:YES completionHandler:nil];
        
    });
}
*/
@end
