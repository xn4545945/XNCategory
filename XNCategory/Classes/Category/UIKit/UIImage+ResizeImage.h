//
//  UIImage+ResizeImage.h
//  NewFilmInfo
//
//  Created by apple on 14-8-10.
//  Copyright (c) 2014年 xn4545945. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (ResizeImage)

/**
 *  创建一个拉伸不变形的图片. 以中心为拉伸点.
 */
+ (instancetype)resizableImageNamed:(NSString *)name;

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)left top:(CGFloat)top;


@end
