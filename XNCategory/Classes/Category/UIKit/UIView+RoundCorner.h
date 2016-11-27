//
//  UIView+RoundCorner.h
//
//  Created by xuneng on 15/8/7.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundCorner)
/**
 *  设置view为圆角 (默认圆角1像素, 边框颜色主色调, 圆角2)
 *
 *  @return 设置圆角剪裁后的view
 */
- (UIView *)roundCorner;

/**
 *  设置view为圆行剪裁
 *
 *  @return 设置圆角剪裁后的view
 */
-(UIView *)circularClipping;

/**
 *  适用于View及其所有子类
 *
 *  @return 设置圆角剪裁后的view
 */
- (UIView *)roundCornerWithBorderWidth:(float) bw borderColor:(UIColor *) bColor cornerRadius:(float)cornerRadius;
@end
