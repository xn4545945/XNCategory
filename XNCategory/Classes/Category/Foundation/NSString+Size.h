//
//  NSString+Size.h
//  meituan
//
//  Created by jinzelu on 15/7/21.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

/**
 *  计算实际字符串所占的大小
 *
 *  @param size 限制size
 *  @param font 字符串字体
 *
 *  @return 实际占的大小
 */
- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font;

/**
 *  计算实际字符串所占的大小(根据固定高度)
 *
 *  @param height 固定高度
 *  @param font   字符串字体
 *
 *  @return 实际占的大小
 */
- (CGSize)boundingRectWithfixedHeight:(float)height withFont:(NSInteger)font;

/**
 *  计算实际字符串所占的大小(根据固定宽度)
 *
 *  @param width 固定宽度
 *  @param font  字符串字体
 *
 *  @return 实际占的大小
 */
- (CGSize)boundingRectWithfixedWidth:(float)width withFont:(NSInteger)font;

@end
