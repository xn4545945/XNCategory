//
//  SystemInfoTool.h
//  ORunTogether
//
//  Created by neng on 15/1/22.
//  Copyright (c) 2015年 xn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemInfoTool : NSObject
- (BOOL)isM7Enable;
- (BOOL)isSimulator;
- (NSString *)deviceString;
@end
