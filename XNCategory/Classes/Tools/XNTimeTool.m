//
//  XNTimeTool.m
//  AskTeacher
//
//  Created by xuneng on 15/8/5.
//  Copyright (c) 2015年 gongsh. All rights reserved.
//

#import "XNTimeTool.h"
#import "NSDate+Utils.h"
#import "NSDate+TimeAgo.h"

@implementation XNTimeTool

#pragma mark - 计算时间
+ (NSString *)timeStringFromString:(NSString *)timeStr withDateFormat:(NSString *)timeFormat{
    
    NSString *subString = [timeStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除2端空格与回车
    subString = [subString substringWithRange:NSMakeRange(0, 19)];
    
    NSDate *lastDate = [NSDate dateFromString:subString withFormat:timeFormat];  //@"yyyy-MM-dd HH:mm:ss"
    
    NSString *dateStr;  //年月日
    NSString *period;   //时间段
    NSString *hour;     //时
    
    if ([lastDate year]==[[NSDate date] year]) {
        NSInteger days = [NSDate daysOffsetBetweenStartDate:lastDate endDate:[NSDate date]];
        if (days < 2) {
            dateStr = [lastDate stringYearMonthDayCompareToday]; //返回 昨天/今天/明天

        }else{
            dateStr = [lastDate stringMonthDay];  //返回 月日 08-10
        }
    }else{
        dateStr = [lastDate stringYearMonthDay];  //返回 年月日 2012-08-10
    }
    
    
    /*
    12小时格式
    if ([lastDate hour]>=5 && [lastDate hour]<12) {
        period = @"上午";
        //        period = NSLocalizedString(@"ChatDateAM", nil);
        hour = [NSString stringWithFormat:@"%02d",(int)[lastDate hour]];
    }else if ([lastDate hour]>=12 && [lastDate hour]<=18){
        period = @"下午";
        //        period = NSLocalizedString(@"ChatDatePM", nil);
        hour = [NSString stringWithFormat:@"%02d",(int)[lastDate hour]-12];
    }else if ([lastDate hour]>18 && [lastDate hour]<=23){
        period = @"晚上";
        //        period = NSLocalizedString(@"ChatDateNight", nil);
        hour = [NSString stringWithFormat:@"%02d",(int)[lastDate hour]-12];
    }else{
        period = @"早上";
        //        period = NSLocalizedString(@"ChatDateDawn", nil);
        hour = [NSString stringWithFormat:@"%02d",(int)[lastDate hour]];
    }
    */

    hour = [NSString stringWithFormat:@"%0d",(int)[lastDate hour]];  //24小时格式
    
    //return [NSString stringWithFormat:@"%@ %@ %@:%02d",dateStr,period,hour,(int)[lastDate minute]]; //输出 "昨天 上午10:09" 或 "2012-08-10 凌晨07:09"
    return [NSString stringWithFormat:@"%@ %@:%02d",dateStr,hour,(int)[lastDate minute]]; //输出 "昨天 10:09" 或 "2012-08-10 07:09"
    
}


+ (NSString *)timeStringFromDate:(NSDate *)lastDate{

    NSString *dateStr;  //年月日
    NSString *period;   //时间段
    NSString *hour;     //时
    
    if ([lastDate year]==[[NSDate date] year]) {
        NSInteger days = [NSDate daysOffsetBetweenStartDate:lastDate endDate:[NSDate date]];
        if (days < 2) {
            dateStr = [lastDate stringYearMonthDayCompareToday]; //返回 昨天/今天/明天
            
        }else{
            dateStr = [lastDate stringMonthDay];  //返回 月日 08-10
        }
    }else{
        dateStr = [lastDate stringYearMonthDay];  //返回 年月日 2012-08-10
    }
    
    
    hour = [NSString stringWithFormat:@"%0d",(int)[lastDate hour]];  //24小时格式
    
    //return [NSString stringWithFormat:@"%@ %@ %@:%02d",dateStr,period,hour,(int)[lastDate minute]]; //输出 "昨天 上午10:09" 或 "2012-08-10 凌晨07:09"
    return [NSString stringWithFormat:@"%@ %@:%02d",dateStr,hour,(int)[lastDate minute]]; //输出 "昨天 10:09" 或 "2012-08-10 07:09"
}


+ (NSString *)timeStringFromStringDefault:(NSString *)timeStr{
    
    return [XNTimeTool timeStringFromString:timeStr withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)timeagoStringFromStringDefault:(NSString *)timeStr{
    NSString *subString = [timeStr substringWithRange:NSMakeRange(0, 19)];
    NSDate *lastDate = [NSDate dateFromString:subString withFormat:@"yyyy-MM-dd HH:mm:ss"];  //@"yyyy-MM-dd HH:mm:ss"
    
    return [lastDate timeAgo]; //调用timeage分类
}

#pragma mark - 时间前后加多少
//后1天
+ (NSDate *)tomorrowDateFrom:(NSDate *)date{
    
    NSTimeInterval  interval = 24*60*60*1;
    
    // NSDate date = [[NSDate alloc] initwithTimeIntervalSinceNow:-interval]; //前90天的日期
    return [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
}

+ (NSDate *)tomorrowDateFromNow{
    
    NSTimeInterval  interval = 24*60*60*1;
    
    return [[NSDate alloc] initWithTimeIntervalSinceNow:interval];
}

//前1天
+ (NSDate *)yesterdayDateFromNow{
    
    NSTimeInterval  interval = 24*60*60*1;
    
    return [[NSDate alloc] initWithTimeIntervalSinceNow:-interval];
}

+ (NSDate *)yesterdayDateFrom:(NSDate *)date{
    
    NSTimeInterval  interval = 24*60*60*1;
    
    return [[NSDate alloc] initWithTimeInterval:-interval sinceDate:date];
}

//day可为正负数
+ (NSDate *)dateFromDate:(NSDate *)date withDays:(int) days{
    NSTimeInterval  interval = 24*60*60*days; //后1天
    
    return [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
}

//day可为正负数
+ (NSDate *)dateFromDate:(NSDate *)date withHours:(int) hours{
    NSTimeInterval  interval = 60*60*hours; //1小时
    
    return [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
}

#pragma mark - 时间挫转换
//获取当前时间的时间戳
+ (long long )nowTimeS1970_long{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    return (long long int)time;
}

//获取当前时间的时间戳
+ (NSString *)nowTimeS1970_string{
    return [NSString stringWithFormat:@"%lld",[self nowTimeS1970_long]];
}

/*NSDate 转换成时间戳字符串*/
+ (NSString *)date2timeS1970:(NSDate *)date{
    long long timeS1970 = [date timeIntervalSince1970]; //时间戳
    return [NSString stringWithFormat:@"%lld",timeS1970];
}

//时间戳字符串转换为NSDate
+ (NSDate *)timeS19702date:(NSString *)timeS1970{
    long long timeS1970L = [timeS1970 longLongValue];
    NSDate *dateCov = [NSDate dateWithTimeIntervalSince1970:timeS1970L];
    return dateCov;
}

//时间挫返回 1999-12-11  格式字符串
+(NSString *)timeS19702Birthday:(NSString *)timeS1970{
    NSDate *dateC = [self timeS19702date:timeS1970];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *birthdayStr = [formatter stringFromDate:dateC];
    
    //    XNLog(@"birthdayStr--> %@",birthdayStr);
    
    return birthdayStr;
}

//时间戳计算年龄
+(NSString *)timeS19702Age:(NSString *)timeS1970{
    if([timeS1970 isEqualToString:@"0"]) return @"0";
    
    NSTimeInterval timeS1970L = [[self timeS19702date:timeS1970] timeIntervalSinceNow];
    int age = - trunc(timeS1970L/(60*60*24))/365; //算出来取反
    
    if(age < 0){
        //        age = 0;
        age = 45 - age;
    }
    
    return [NSString stringWithFormat:@"%d",age];
}

//计算2个时间挫相隔的时间
+(NSString *)calculateTimeA:(NSString *)timeS1970A timeB:(NSString *)timeS1970B{
    long long timeDelat = [timeS1970A longLongValue] - [timeS1970B longLongValue];

    return [self secondFormat:timeDelat];
}

+(NSString *)calculateBackdayTimeA:(NSString *)timeS1970A timeB:(NSString *)timeS1970B{
    long long timeDelat = [timeS1970A longLongValue] - [timeS1970B longLongValue];
    
    return [self secondFormatDays:timeDelat];
}

//根据给定的时间格式输出时间戳
+ (NSString *)timeS19702dateString:(NSString *)timeS1970 withFormat:(NSString *)format{
    
    NSDate *date = [self timeS19702date:timeS1970];
    return [date stringDateWithFormat:format];
}

//根据给定的时间格式HH:mm输出时间戳
+ (NSString *)timeS19702dateString:(NSString *)timeS1970{
    
    NSDate *date = [self timeS19702date:timeS1970];
    return [date stringDateWithFormat:@"HH:mm"];
    
}

//常规输出
+ (NSString *)timeS19702dateStringComplete:(NSString *)timeS1970{
    
    NSDate *date = [self timeS19702date:timeS1970];
    return [date stringDateWithFormat:@"M月d日 H:mm"];
}


#pragma mark - 时间单位转换
+ (NSString *)secondFormat:(long long)seconds{
    if(seconds >= INT64_MAX) return @"时间过长";
    
    if(seconds < 60){
        return [NSString stringWithFormat:@"00:%02lld",seconds]; //不足补0
    }else if(seconds < 3600){
        return [NSString stringWithFormat:@"%02d:%02lld",(int)(seconds/60),seconds%60];
    }else if(seconds < 3600*24){
        return [NSString stringWithFormat:@"%2d时%2lld分",(int)(seconds/3600),(seconds%3600)/60];
    }else if(seconds < 3600*24*30){
        return [NSString stringWithFormat:@"%2d天%2lld时",(int)(seconds/(3600*24)),(seconds%(3600*24))/3600];
    }else{
        return [NSString stringWithFormat:@"%lld",seconds]; //直接输出秒数
    }
    //    return nil;
}

//只返回天数
+ (NSString *)secondFormatDays:(long long)seconds{
    if(seconds >= INT64_MAX) return @"时间过长";
    
    if(seconds < 3600*24*30){
        return [NSString stringWithFormat:@"%2d天",(int)(seconds/(3600*24))];
    }else{
        //return [NSString stringWithFormat:@"%lld",seconds]; //直接输出秒数
        return @"不足一天";
    }
    //    return nil;
}

+ (NSString *)second2min:(long long)seconds{
    if(seconds >= INT64_MAX) return @"时间过长";
    
    if(seconds < 60){
        return [NSString stringWithFormat:@"%llds",seconds];
    }else if(seconds%60 == 0){
        return [NSString stringWithFormat:@"%dmin",(int)(seconds/60)];
    }else{
        return [NSString stringWithFormat:@"%dm%02llds",(int)(seconds/60),seconds%60];
    }
    //    return nil;
}

+ (NSString *)second2Hour:(NSString *)secoends{
    float secoendsF = [secoends floatValue];
    
    float result = 0.0;
    result = secoendsF / 3600.0 ;
    
    return [NSString stringWithFormat:@"%.1f",result];
}

+ (int )min2Second:(int)min{
    
    return 60 * min;
}

//==========================================其他时间应用=============================================

//默认NO为晚上
+(BOOL)isLight{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    //    int year = [dateComponent year];
    //    int month = [dateComponent month];
    //    int day = [dateComponent day];
    int hour = [dateComponent hour];
    //    int minute = [dateComponent minute];
    //    int second = [dateComponent second];
    /*
     NSLog(@"year is: %d", year);
     NSLog(@"month is: %d", month);
     NSLog(@"day is: %d", day);
     NSLog(@"hour is: %d", hour);
     NSLog(@"minute is: %d", minute);
     NSLog(@"second is: %d", second);
     */
    if (hour >=6 && hour <= 18) {
        return YES;
    }else{
        return NO;
    }
    
    return NO;
}
@end
