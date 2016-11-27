//
//  UIView+AccessFrameComponent.h
//
//  Created by apple on 14-7-6.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AccessFrameComponent)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end
