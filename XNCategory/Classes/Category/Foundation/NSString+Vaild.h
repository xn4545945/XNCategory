//
//  NSString+Vaild.h
//  AskTeacher
//
//  Created by xuneng on 15/8/17.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//  验证字符串

#import <Foundation/Foundation.h>

@interface NSString (Vaild)

/**
 *  去除左右两端的空格与换行后, 是否为空
 *
 *  @param inputStr <#inputStr description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isValidStringWithoutWhitespaceAndNewlineCharacterSet;
@end
