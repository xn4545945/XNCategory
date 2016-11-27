//
//  SystemInfoTool.m
//  ORunTogether
//
//  Created by neng on 15/1/22.
//  Copyright (c) 2015年 xn. All rights reserved.
//

#import "SystemInfoTool.h"
#import "sys/utsname.h"

@implementation SystemInfoTool


- (NSString *)deviceString {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"%@", deviceString);
    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5(GSM)";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c(Global)";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s(GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"]) return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"]) return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"]) return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

/**
 *  iPhone5s以上才开始支持M7
 *
 *  @return
 */
- (BOOL)isM7Enable{
    if ([[self deviceString] isEqualToString:@"iPhone 5s(GSM)"] || [[self deviceString] isEqualToString:@"iPhone 5s"] || [[self deviceString] isEqualToString:@"iPhone 5c(Global)"] || [[self deviceString] isEqualToString:@"iPhone 6"] || [[self deviceString] isEqualToString:@"iPhone 6 Plus"]) {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)isSimulator{
    if ([[self deviceString] isEqualToString:@"Simulator"]) {
        return YES;
    }else{
        return NO;
    }
}

@end
