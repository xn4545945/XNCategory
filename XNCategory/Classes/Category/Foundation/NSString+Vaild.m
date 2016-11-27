//
//  NSString+Vaild.m
//  AskTeacher
//
//  Created by xuneng on 15/8/17.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//

#import "NSString+Vaild.h"

@implementation NSString (Vaild)

- (BOOL)isValidStringWithoutWhitespaceAndNewlineCharacterSet{
    
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return [trimmedString length] > 0 ? YES: NO;
}

@end
