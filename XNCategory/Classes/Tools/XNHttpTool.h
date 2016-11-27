//
//  XNHttpTool.h
//  ChePM
//
//  Created by neng on 14-12-22.
//  Copyright (c) 2014年 gongsh. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^successBlock)(id json);
typedef void (^failureBlock)(NSError *error);

#pragma mark - afnetworking
@interface XNHttpTool : NSObject

/**
 *  get请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

+ (void)getWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;


+ (void)getWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure resultTip:(BOOL) resultTip;
/**
 *  post请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params  success:(successBlock)success failure:(failureBlock)failure;


/**
 *  带请求头的post
 */
+ (void)postWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

+ (void)deleteWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

+ (void)putWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

+ (void)patchWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

#pragma mark -  NSURL

//=================================================数据log=======================================================
/**
 *  美化输出json
 *
 *  @param json json
 *  @param mark log时的标记
 */
+(void)logPrettyJson:(id)json mark:(NSString *) mark;

+(void)prettyLogJson:(id)json mark:(NSString *)mark;

//=================================================网络数据转换=======================================================
+(NSString *)data2jsonStr:(id)data;

+(NSDictionary *)data2dictionary:(NSDate *)receiveData;

+(NSDictionary *)string2Dict:(NSString *)str;
@end
