//
//  UIButton+XN.h
//  ORunTogether
//
//  Created by xuneng on 15/5/22.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XN)
/**
 *  为不同状态下的按钮设置背景色
 *
 *  @param backgroundColor <#backgroundColor description#>
 *  @param state           <#state description#>
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
