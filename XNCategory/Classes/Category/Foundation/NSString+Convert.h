//
//  NSString+Convert.h
//  AskTeacher
//
//  Created by xuneng on 15/8/17.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)

/**
 *  @[@"2",@"3",@"4",@"5",@"6",@"35"]; 字符串数组转换为字符串 2,3,4,5,6,35(用来http传递arr参数)
 *
 *  @param arr <#arr description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)stringArray2String:(NSArray *)arr;

@end
