//
//  XNTypeTool.h
//  epark_iOS
//
//  Created by xuneng on 15/9/8.
//  Copyright (c) 2015年 com.gongsh. All rights reserved.
//  类型工具类. (包括类型判断, 类型转换)

#import <Foundation/Foundation.h>

@interface XNTypeTool : NSObject
#pragma mark - 类型检测与判断
//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string;

//判断是否为浮点形
+ (BOOL)isPureFloat:(NSString*)string;

//判断是否为数字. (整形和浮点都算)
+(BOOL)isNumberDigit:(NSString*)string;





@end
