//
//  UIImage+ResizeImage.m
//  NewFilmInfo
//
//  Created by apple on 14-8-10.
//  Copyright (c) 2014年 xn4545945. All rights reserved.
//

#import "UIImage+ResizeImage.h"


@implementation UIImage (ResizeImage)

+ (instancetype)resizableImageNamed:(NSString *)name
{
    return [self resizableImageNamed:name left:0.5 top:0.5];
}

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)leftRatio top:(CGFloat)topRatio
{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

@end
