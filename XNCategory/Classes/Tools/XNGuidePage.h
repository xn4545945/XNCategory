//
//  XNGuidePage.h
//  ORunTogether
//
//  Created by xuneng on 15/6/12.
//  Copyright (c) 2015年 xn. All rights reserved.
//  封装引导页面

#import <Foundation/Foundation.h>
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"

typedef void (^completeBlock)(id complete);

@interface XNGuidePage : NSObject

/**
 *  生成"开始页"
 *
 *  @param complete 点击完成按钮后的事件
 *
 *  @return <#return value description#>
 */
+ (OnboardingViewController *)generateStartPageVCWithcompleteBtnClick:(completeBlock)complete;

/**
 *  生成"如何使用页"
 *
 *  @param complete 点击完成按钮后的事件
 *
 *  @return <#return value description#>
 */
+ (OnboardingViewController *)generateHowToUseVCWithcompleteBtnClick:(completeBlock)complete;
@end
