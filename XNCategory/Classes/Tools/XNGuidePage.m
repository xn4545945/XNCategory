//
//  XNGuidePage.m
//  ORunTogether
//
//  Created by xuneng on 15/6/12.
//  Copyright (c) 2015年 xn. All rights reserved.
//

#import "XNGuidePage.h"

@implementation XNGuidePage
#pragma mark --------------------------引导页
- (void)handleOnboardingCompletion {
    // set that we have completed onboarding so we only do it once... for demo
    // purposes we don't want to have to set this every time so I'll just leave
    // this here...
    //    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserHasOnboardedKey];
    
    // animate the transition to the main application
//    [self dismissViewControllerAnimated:YES completion:nil];
}

+ (OnboardingViewController *)generateStartPageVCWithcompleteBtnClick:(completeBlock)complete{
    CGFloat fontsizeT = 18;
    NSString *fontNameT = @"Helvetica-Bold";
//    NSString *fontNameT = @"Helvetica Neue";
    
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Accumulate the e Energy through running to unlock a new planet." image:[UIImage imageNamed:@"page1"] buttonText:@"" action:nil];
    firstPage.bodyFontSize = fontsizeT;
    firstPage.bodyFontName = fontNameT;
    
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Run with the people in the vicinity." image:[UIImage imageNamed:@"page2"] buttonText:@"" action:nil];
    secondPage.movesToNextViewController = YES;
    secondPage.bodyFontSize = fontsizeT;
    secondPage.bodyFontName = fontNameT;
    
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Run by using the front camera of your smartphone." image:[UIImage imageNamed:@"page3"] buttonText:@"" action:nil];
    thirdPage.bodyFontSize = fontsizeT;
    thirdPage.bodyFontName = fontNameT;
    
    OnboardingContentViewController *fourthPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Make friends with people who also love running." image:[UIImage imageNamed:@"page4"] buttonText:@"Start" action:^{
//        [self handleOnboardingCompletion];
        if(complete){
            complete(@"StartPage");
        }
    }];
    
    fourthPage.buttonTextColor = [UIColor colorWithRed:118.0/255.0 green:196.0/255.0 blue:194.0/255.0 alpha:1.0];
    fourthPage.buttonBgNormal = [UIImage imageNamed:@"button_start"];
    fourthPage.buttonBgSelected = [UIImage imageNamed:@"button_start_hl"];
    fourthPage.buttonSize = CGSizeMake(150, 44);
    fourthPage.buttonFontSize = fontsizeT;
    fourthPage.buttonFontName =  @"Helvetica Neue";
    fourthPage.bodyFontSize = fontsizeT;
    fourthPage.bodyFontName = fontNameT;
    
    //总的背景
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:nil contents:@[firstPage, secondPage, thirdPage,fourthPage]];
    onboardingVC.shouldFadeTransitions = YES;  //滑动时透明
    onboardingVC.fadePageControlOnLastPage = YES;
    onboardingVC.backgroundColor = [UIColor colorWithRed:118.0/255.0 green:196.0/255.0 blue:194.0/255.0 alpha:1.0];
    //    onboardingVC.backgroundColor = [UIColor whiteColor];
    //    onboardingVC.shouldBlurBackground = YES;
    onboardingVC.shouldMaskBackground = NO;  //去掉背景的灰色遮罩层
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    /*
     onboardingVC.allowSkipping = YES;
     onboardingVC.skipHandler = ^{
     [self handleOnboardingCompletion];
     };
     */
    
    return onboardingVC;
}

+ (OnboardingViewController *)generateHowToUseVCWithcompleteBtnClick:(completeBlock)complete {
    CGFloat fontsizeT = 18;
    NSString *fontNameT = @"Helvetica-Bold";
    
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Fasten your smartphone on the running machine, and the camera in front of your smartphone will detect your motion automatically." image:[UIImage imageNamed:@"howToRun_intro1"] buttonText:@"" action:nil];
    firstPage.bodyFontSize = fontsizeT;
    firstPage.bodyFontName = fontNameT;
    
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Hold your smartphone in your hand, or put it in your pocket when you are running outside." image:[UIImage imageNamed:@"howToRun_intro2"] buttonText:@"" action:nil];
    secondPage.movesToNextViewController = YES;
    secondPage.bodyFontSize = fontsizeT;
    secondPage.bodyFontName = fontNameT;
    
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"" body:@"Tapping the screen with your finger is also a way to play this game." image:[UIImage imageNamed:@"howToRun_intro3"] buttonText:@"I Know" action:^{
//        [self handleOnboardingCompletion];
        if(complete){
            complete(@"StartPage");
        }
    }];
    
    thirdPage.buttonTextColor = [UIColor whiteColor];
    thirdPage.buttonBgNormal = [UIImage imageNamed:@"howToRun_button"];
    thirdPage.buttonBgSelected = [UIImage imageNamed:@"howToRun_button_hl"];
    thirdPage.buttonSize = CGSizeMake(150, 44);
    thirdPage.buttonFontName = @"Helvetica Neue";
    thirdPage.buttonFontSize = fontsizeT;
    thirdPage.bodyFontSize = fontsizeT;
    thirdPage.bodyFontName = fontNameT;
    
    //总的背景
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"howToRun_bg"] contents:@[firstPage, secondPage, thirdPage]];
    onboardingVC.shouldFadeTransitions = YES;  //滑动时透明
    onboardingVC.fadePageControlOnLastPage = YES;
    //    onboardingVC.backgroundColor = [UIColor colorWithRed:118.0/255.0 green:196.0/255.0 blue:194.0/255.0 alpha:1.0];
    //    onboardingVC.backgroundColor = [UIColor whiteColor];
    //    onboardingVC.shouldBlurBackground = YES;
    onboardingVC.shouldMaskBackground = NO;  //去掉背景的灰色遮罩层
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    /*
     onboardingVC.allowSkipping = YES;
     onboardingVC.skipHandler = ^{
     [self handleOnboardingCompletion];
     };
     */
    
    return onboardingVC;
}
@end
