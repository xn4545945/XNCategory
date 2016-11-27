//
//  XNTimeTool.h
//  AskTeacher
//
//  Created by xuneng on 15/8/5.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNTimeTool : NSObject
#pragma mark - 计算时间
/**
 *  格式化输出时间信息
 *
 *  @param timeStr    如@"2015-05-19 08:00:21"(与后一个参数对应)
 *  @param timeFormat 如@"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 输出 "昨天 10:09" 或 "2012-08-10 07:09"
 */
+ (NSString *)timeStringFromString:(NSString *)timeStr withDateFormat:(NSString *)timeFormat;

//同上. 只是传入date即可.
+ (NSString *)timeStringFromDate:(NSDate *)lastDate;

/**
 *  默认以yyyy-MM-dd HH:mm:ss格式作为输入数据
 *
 *  @param timeStr 如@"2015-05-19 08:00:21"字符串时间格式
 *
 *  @return 输出 "昨天 10:09" 或 "2012-08-10 07:09"
 */
+ (NSString *)timeStringFromStringDefault:(NSString *)timeStr;

/**
 *  调用timeAge分类来计算
 *
 *  @param timeStr @"2015-05-19 08:00:21"
 *
 *  @return 输出 xx分前
 */
+ (NSString *)timeagoStringFromStringDefault:(NSString *)timeStr;


#pragma mark - 时间前后加多少
//后1天
+ (NSDate *)tomorrowDateFrom:(NSDate *)date;

+ (NSDate *)tomorrowDateFromNow;

//前1天
+ (NSDate *)yesterdayDateFromNow;

+ (NSDate *)yesterdayDateFrom:(NSDate *)date;

/**
 *  用给定的date计算其前后天数, 并返回NSDate
 *
 *  @param date
 *  @param days 为正数表示后多少天, 负数表示前多少天.
 *
 *  @return
 */
+ (NSDate *)dateFromDate:(NSDate *)date withDays:(int) days;
/**
 *  用给定的date计算其前后小时
 *
 *  @param date  <#date description#>
 *  @param hours <#hours description#>
 *
 *  @return <#return value description#>
 */
+ (NSDate *)dateFromDate:(NSDate *)date withHours:(int) hours;

#pragma mark - 时间挫转换
/*获取当前时间的时间戳*/
+ (long long )nowTimeS1970_long;
/*获取当前时间的时间戳*/
+ (NSString *)nowTimeS1970_string;


/*NSDate 转换成时间戳字符串*/
+ (NSString *)date2timeS1970:(NSDate *)date;


/**
 *  时间戳字符串转换为NSDate
 */
+ (NSDate *)timeS19702date:(NSString *)timeS1970;

/*时间挫返回 1999-12-11  格式字符串*/
+(NSString *)timeS19702Birthday:(NSString *)timeS1970;

/*时间戳计算年龄*/
+(NSString *)timeS19702Age:(NSString *)timeS1970;

/*计算时间挫之间相隔的时间. 输出剩余xx时xx分*/
+(NSString *)calculateTimeA:(NSString *)timeS1970A timeB:(NSString *)timeS1970B;

/*只返回天数*/
+(NSString *)calculateBackdayTimeA:(NSString *)timeS1970A timeB:(NSString *)timeS1970B;
/**
 *  根据给定的时间格式输出时间戳
 *
 *  @param timeS1970 <#timeS1970 description#>
 *  @param format    <#format description#>
 *
 *  @return 时间戳字符串
 */
+ (NSString *)timeS19702dateString:(NSString *)timeS1970 withFormat:(NSString *)format;
/**
 *  默认HH:mm格式输出时间戳
 *
 *  @param timeS1970 HH:mm
 *
 *  @return
 */
+ (NSString *)timeS19702dateString:(NSString *)timeS1970;
/**
 *  M月d日 H:mm格式输出时间戳
 *
 *  @param timeS1970 M月d日 H:mm
 *
 *  @return
 */
+ (NSString *)timeS19702dateStringComplete:(NSString *)timeS1970;

#pragma mark - 时间单位转换
/**
 *  如将秒数82秒转换为 01:22 的格式
 *
 *  @param seconds
 *
 *  @return
 */
+ (NSString *)secondFormat:(long long)seconds;

/**
 *  将秒数转换为分钟: 82 -> 1m 22 s
 *
 *  @param seconds
 *
 *  @return
 */
+ (NSString *)second2min:(long long)seconds;

/**
 *  服务器传过来的秒数-->小时
 *
 *  @param secoends
 *
 *  @return
 */
+ (NSString *)second2Hour:(NSString *)secoends;

+(int )min2Second:(int)min;

//==========================================其他时间应用=============================================

//默认NO为晚上
+(BOOL)isLight;

@end
