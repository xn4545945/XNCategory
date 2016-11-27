

#import <UIKit/UIKit.h>


@interface UIImage (DrawImage)


/**
 *  绘制纯色图片
 *
 *  @param color    <#color description#>
 *  @param showsize <#showsize description#>
 *
 *  @return UIImage
 */
+ (instancetype)drawImageWithColor:(UIColor *)color size:(CGSize) showsize;

/**
 *  占位图
 *
 *  @return UIImage
 */
+ (instancetype)drawPlaceHolderImage;

@end
