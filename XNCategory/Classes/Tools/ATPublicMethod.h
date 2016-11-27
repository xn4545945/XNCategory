//
//  ATPublicMethod.h
//  AskTeacher
//
//  Created by xuneng on 15/8/6.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATPublicMethod : NSObject

/**
 *  根据城市code, 找到测试名.
 *
 *  @param citycode <#citycode description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)findCityName:(NSString *)citycode;


/**
 *  通过category找到对应的名字.
 *
 *  @param categoryID <#categoryID description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)findCategoryNameWithCategoryID:(NSString *)categoryID;

@end
