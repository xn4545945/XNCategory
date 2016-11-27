//
//  NSString+Size.m
//  meituan
//
//  Created by jinzelu on 15/7/21.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font{
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    
    CGSize retSize = [self boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

- (CGSize)boundingRectWithfixedHeight:(float)height withFont:(NSInteger)font{
    
    return [self boundingRectWithSize:CGSizeMake(100, height) withFont:font];
}

- (CGSize)boundingRectWithfixedWidth:(float)width withFont:(NSInteger)font{
    
    return [self boundingRectWithSize:CGSizeMake(width, 100) withFont:font];
}

@end
