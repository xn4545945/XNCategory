//
//  UIImageView+PlayAnimation.m
//  epark_iOS
//
//  Created by xuneng on 15/9/1.
//  Copyright (c) 2015年 xn4545945. All rights reserved.
//  播放动画

#import "UIImageView+RunAnimation.h"

@implementation UIImageView (RunAnimation)

/** 播放动画 */
- (void)runAnimationWithCount:(int)count name:(NSString *)name delatTime:(float) delatTime repeatCount:(int)repeatCount{
    
    if (self.isAnimating) return;
    
    // 1.加载所有的动画图片
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i<count; i++ ) {
        // 计算文件名
        NSString *filename = [NSString stringWithFormat:@"%@%03d.png", name, i];
        // 加载图片
        
        UIImage *image = nil;
        
        //播放多次时使用缓存
        if (repeatCount==1) {
            // imageWithContentsOfFile: 没有缓存(传入文件的全路径)
            NSBundle *bundle = [NSBundle mainBundle];
            NSString *path = [bundle pathForResource:filename ofType:nil];
            image = [UIImage imageWithContentsOfFile:path];
        }else{
            // imageNamed: 有缓存(传入文件名)
            image = [UIImage imageNamed:filename];
        }
        
        // 添加图片到数组中
        [images addObject:image];
    }
    
    self.animationImages = images;
    
    // 2.设置播放次数(1次)
    self.animationRepeatCount = repeatCount; //INT_MAX
    
    // 3.设置播放时间
    self.animationDuration = images.count * delatTime;
    
    [self startAnimating];
    
    /*
     // 4.动画放完1秒后清除内存
     CGFloat delay = self.imageViewPlay.animationDuration + 1.0;
     [self.imageViewPlay performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
     //    [self performSelector:@selector(clearCache) withObject:nil afterDelay:delay];
     */
    
    if (repeatCount==1) {
        //播放完后设置最后一张为图片结束
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.animationDuration - 0.1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopAnimating];
            self.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%03d.png", name, count-1]];
        });
    }

}

@end
