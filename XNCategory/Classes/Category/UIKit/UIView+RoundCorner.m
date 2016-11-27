//
//  UIView+RoundCorner.m
//  AskTeacher
//
//  Created by xuneng on 15/8/7.
//  Copyright (c) 2015年 xn4545945. All rights reserved.

//  圆角及剪裁. (适用于UIView及UIView的子类, 如UIImageView, UIButton等)

#import "UIView+RoundCorner.h"
#import "common.pch"

@implementation UIView (RoundCorner)

- (UIView *)roundCorner{
    
    return [self roundCornerWithBorderWidth:1.0 borderColor:kMainColor cornerRadius:2];
}

-(UIView *)circularClipping{
    return [self roundCornerWithBorderWidth:1.0 borderColor:[UIColor whiteColor] cornerRadius:self.frame.size.width / 2];
}

- (UIView *)roundCornerWithBorderWidth:(float) bw borderColor:(UIColor *) bColor cornerRadius:(float)cornerRadius{
    
    //设置圆形图片
    CALayer *lay  = self.layer;//获取ImageView的层
    [lay setMasksToBounds:YES];
    //lay.cornerRadius = viewInstance.frame.size.width / 2 ;
    lay.cornerRadius = cornerRadius ;
    
    //设置圆形的边框
    lay.borderWidth = bw;
    lay.borderColor = bColor.CGColor;
    
    /*
     //阴影
     lay.shadowColor = [UIColor whiteColor].CGColor;
     lay.shadowOffset = CGSizeMake(-10, -10);
     lay.shadowOpacity = YES; //不透明
     */
    
    return self;
}


@end
