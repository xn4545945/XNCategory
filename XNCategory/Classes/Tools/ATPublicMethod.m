//
//  ATPublicMethod.m
//  AskTeacher
//
//  Created by xuneng on 15/8/6.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//

#import "ATPublicMethod.h"
#import "YTKKeyValueStore.h"

@implementation ATPublicMethod

//找到城市名字.
+(NSString *)findCityName:(NSString *)citycode{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    NSArray *cityArrayplist = [[NSArray alloc] initWithContentsOfFile:path];
    
    for(int i = 0 ; i< cityArrayplist.count; i++){
        if ([citycode isEqualToString:cityArrayplist[i][@"areacode"]]) {
            return cityArrayplist[i][@"city"];
        }
    }
    
    return @"北京"; //默认返回北京
}


+(NSString *)findCategoryNameWithCategoryID:(NSString *)categoryID{
    //创建数据库并缓存.
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:kSQLDB];
    [store createTableWithName:kSQLTablePublicData];
    NSString *key = @"category";
    
    NSDictionary *categoryDict = [store getObjectById:key fromTable:kSQLTablePublicData];
    NSDictionary *dict =  categoryDict[@"flat"];
    
    
    for (int i=0; i<dict.allKeys.count; i++) {
        
        if([categoryID isEqualToString:dict.allKeys[i]]){
            return dict[categoryID][@"name"];
        }
        
    }
    
    return @"";
    
}
@end
