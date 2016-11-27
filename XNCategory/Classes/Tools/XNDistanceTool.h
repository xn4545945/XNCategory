//
//  XNCalculateTool.h
//  ORunTogether
//
//  Created by xuneng on 15-2-4.
//  Copyright (c) 2015年 xn. All rights reserved.
//  与距离计算有关的方法

#import <Foundation/Foundation.h>

@interface XNDistanceTool : NSObject

/**
 *  将服务器传过来的0.75千米数转换为0.75km 或 750m
 *
 *  @param distance
 *  @param param    当为1时, 单位为千米; 当为2时单位为米. (传入的距离的单位)
 *
 *  @return
 */
+ (NSString *)distan2detailDistance:(NSString *)distance pararm:(int) param;

@end
