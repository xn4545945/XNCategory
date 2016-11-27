
#import "UIImage+DrawImage.h"
#import "common.pch"

@implementation UIImage (DrawImage)


+ (instancetype)drawImageWithColor:(UIColor *)color size:(CGSize) showsize{
    
    UIGraphicsBeginImageContextWithOptions(showsize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, showsize.width, showsize.height));
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return colorImage;
}


+ (instancetype)drawPlaceHolderImage{
    
    return [self drawImageWithColor:RGBACOLOR(204, 204, 204, 0.9) size:CGSizeMake(100, 100)];
}
@end
