//
//  XNTypeConvertTool.m
//  ORunTogether
//
//  Created by xuneng on 15-2-25.
//  Copyright (c) 2015年 xn. All rights reserved.
//

#import "XNTypeConvertTool.h"

@implementation XNTypeConvertTool

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"字符串json-->字典时失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];  //美化输出. 但服务器会收到一堆换行符.
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:nil error:&parseError];
    
    if(parseError) {
        NSLog(@"字典-->json字符串时失败：%@",parseError);
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



+(NSString *)floatString2shortfloatString:(NSString *)floatString{
    if (floatString == nil) {
        return @"error";
    }
    float tmp = [floatString floatValue];
    return [NSString stringWithFormat:@"%.1f", tmp];
}
@end
