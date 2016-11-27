//
//  XNTypeTool.m
//  epark_iOS
//
//  Created by xuneng on 15/9/8.
//  Copyright (c) 2015年 com.gongsh. All rights reserved.
//  

#import "XNTypeTool.h"

@implementation XNTypeTool

#pragma mark - 类型检测与判断
//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

//判断是否为数字. (整形和浮点都算)
+(BOOL)isNumberDigit:(NSString*)string{
    if( ![self isPureInt:string] || ![self isPureFloat:string])
    {
        return NO;
    }
    return YES;
}


@end
