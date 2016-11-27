//
//  XNTips.h
//  ORunTogether
//
//  Created by xuneng on 15-2-11.
//  Copyright (c) 2015年 xn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CRToastInteractionBlockMy)(id inter);

@interface XNTips : NSObject

+(void)MBTipText:(NSString *)tips;

+(void)MBTipText:(NSString *)tips onView:(UIView *)view showTime:(float)time;

+(void)MBTipText:(NSString *)tips onView:(UIView *)view;

+(void)MBTipText:(NSString *)tips detialText:(NSString *)detialStr onView:(UIView *)view;

//+(void)MBTipJuhua:(NSString *)tips onView:(UIView *)view delegate:(id)delegate;

/**
 *  针对长文本进行换行
 *
 *  @param tips <#tips description#>
 *  @param view <#view description#>
 */
+(void)MBTipLongText:(NSString *)tips onView:(UIView *)view;
//+(void)CRToastText:(NSString *)text withInteractionTap:(CRToastInteractionBlockMy)inter;

/**
 *  弹出alert框提示. (在主线程中)
 *
 *  @param title <#title description#>
 */
+(void)alertWithTitle:(NSString *)title;
@end
