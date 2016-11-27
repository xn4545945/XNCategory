//
//  XNTypeConvertTool.h
//  ORunTogether
//
//  Created by xuneng on 15-2-25.
//  Copyright (c) 2015年 xn. All rights reserved.
//  格式转换工具类.

#import <Foundation/Foundation.h>

@interface XNTypeConvertTool : NSObject
/**
 *  json字符串转换为字典
 *
 *  @param jsonString <#jsonString description#>
 *
 *  @return <#return value description#>
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  字典转换成json字符串
 *
 *  @param dic <#dic description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;



/**
 *  浮点型的字符串, 保留一位小数后输出
 *
 *  @param floatString <#floatString description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)floatString2shortfloatString:(NSString *)floatString;
@end
