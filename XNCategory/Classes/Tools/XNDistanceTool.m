//
//  XNCalculateTool.m
//  ORunTogether
//
//  Created by xuneng on 15-2-4.
//  Copyright (c) 2015年 xn. All rights reserved.
//  跑步界面中需要的计算方法工具集

//未用
#import "XNDistanceTool.h"

@implementation XNDistanceTool


//将服务器传过来的0.75千米数转换为0.75km 或 750m
+(NSString *)distan2detailDistance:(NSString *)distance pararm:(int) param{
    
    NSString *distanceC = [NSString stringWithFormat:@"%@",distance];
    
    NSString *result;
    
    //单位为千米时
    if(param == 1){
        
        if([distance floatValue] < 1){
            result = [NSString stringWithFormat:@"%.0fm",[distance floatValue] * 1000];
        }else{
            
            result = [NSString stringWithFormat:@"%.1fkm",[distance floatValue]];
        }
        
    }else if(param == 2){
        
    //单位为米时
        if([distance floatValue]/1000 < 1){
            result = [NSString stringWithFormat:@"%.0fm",[distance floatValue]];
        }else{
            result = [NSString stringWithFormat:@"%.1fkm",[distance floatValue]/1000];
        }
        
    }
    
    return result;
}

@end
