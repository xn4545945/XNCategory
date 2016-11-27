//
//  NSString+Convert.m
//  AskTeacher
//
//  Created by xuneng on 15/8/17.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//  字符串类型转换

#import "NSString+Convert.h"

@implementation NSString (Convert)

+ (NSString *)stringArray2String:(NSArray *)arr{
    
    return [arr componentsJoinedByString:@","];
    
}

@end
