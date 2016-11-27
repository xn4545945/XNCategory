//
//  UIImageView+PlayAnimation.h
//  epark_iOS
//
//  Created by xuneng on 15/9/1.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RunAnimation)
/**
 *  播放动画.
 *
 *  @param count     图片张数
 *  @param name      文件前缀.  complete_00   000.png(以000.png开始)  (前面为需要传入的, 后面为自增)
 *  @param delatTime 间隔时间
 *  @param repeatCount 重复次数. 循环用INT_MAX即可
 */
- (void)runAnimationWithCount:(int)count name:(NSString *)name delatTime:(float) delatTime repeatCount:(int)repeatCount;

@end
