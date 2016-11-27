//
//  XNTips.m
//  ORunTogether
//
//  Created by xuneng on 15-2-11.
//  Copyright (c) 2015年 xn. All rights reserved.
//  收集整理各种提示

#import "XNTips.h"
#import "MBProgressHUD.h"
//#import "CRToast.h"

@implementation XNTips

//自定义默认时间
+(void)MBTipText:(NSString *)tips{
    [self MBTipText:tips onView:[UIApplication sharedApplication].keyWindow];
}

//自定义默认时间
+(void)MBTipText:(NSString *)tips onView:(UIView *)view showTime:(float)time{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tips;
        //hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:time];
    });
}

//默认时间1.7
+(void)MBTipText:(NSString *)tips onView:(UIView *)view{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tips;
        hud.userInteractionEnabled = NO;  //界面不然点击的解决办法
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.7];
    });
}

//默认时间1.7
+(void)MBTipText:(NSString *)tips detialText:(NSString *)detialStr onView:(UIView *)view{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tips;
        hud.detailsLabelText = detialStr;
        hud.userInteractionEnabled = NO;  //界面不然点击的解决办法
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.7];
    });
}

//默认时间1.7
+(void)MBTipLongText:(NSString *)tips onView:(UIView *)view{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.margin = 15.f;//20
        
        UILabel *aLabel= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
        aLabel.numberOfLines = 0;
        //    aLabel.backgroundColor = [UIColor whiteColor];
        aLabel.textColor = [UIColor whiteColor];
        //    aLabel.textAlignment = NSTextAlignmentCenter;
        aLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
//        aLabel.font = [UIFont systemFontOfSize:16];
        
        //宽度不变，根据字的多少计算label的高度
        NSString *str = tips;
        CGSize size = [str sizeWithFont:aLabel.font constrainedToSize:CGSizeMake(aLabel.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        //根据计算结果重新设置UILabel的尺寸
        [aLabel setFrame:CGRectMake(0, 0, 160, size.height)];
        aLabel.text = str;
//        if (size.width < 150) {
        aLabel.textAlignment = NSTextAlignmentCenter;
//        }
        
        hud.customView = aLabel;
        hud.userInteractionEnabled = NO;  //界面不然点击的解决办法
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.7];
    });
}


//菊花带文字. 作参考.
+(void)MBTipJuhua:(NSString *)tips onView:(UIView *)view delegate:(id)delegate{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:view animated:YES]; //self.navigationController.view
        hud.labelText = tips;
        hud.delegate = delegate;
        hud.userInteractionEnabled = NO;   //界面不然点击的解决办法
        hud.removeFromSuperViewOnHide = YES;
        [hud show:YES];
        [hud hide:YES afterDelay:1.7];
    });
}

//菊花带文字. 作参考.
+(void)alertWithTitle:(NSString *)title{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
        [alert show];
    });
    
}


/*
//接收点击事件
+(void)CRToastText:(NSString *)text withInteractionTap:(CRToastInteractionBlockMy)inter{
    NSMutableDictionary *myOptions = [@{
                                        kCRToastTextKey : text,
                                        kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                        kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
                                        kCRToastAnimationInDirectionKey : @(0),            //demo
                                        kCRToastAnimationOutDirectionKey : @(0),
                                        kCRToastNotificationPresentationTypeKey : @(CRToastPresentationTypeCover),  //覆盖状态条
                                        } mutableCopy];
    
    //设置交互事件
    myOptions[kCRToastInteractionRespondersKey] = @[[CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap
                                                                                                    automaticallyDismiss:YES block:^
                                                     (CRToastInteractionType interactionType){
                                                         if(inter){
                                                             
                                                             inter(@"Tap");
                                                             
                                                         }
                                                     }]];
    
    [CRToastManager showNotificationWithOptions:myOptions completionBlock:nil]; //显示
}
*/
@end
