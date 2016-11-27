//
//  NSDictionary+Log.m
//
//  Copyright (c) 2014年 xn4545945. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@:%@,\n", key, obj];
    }];
    
    [strM appendString:@"}"];
    
    return strM;
}

@end
