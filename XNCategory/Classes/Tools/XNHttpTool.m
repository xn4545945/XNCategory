//
//  XNHttpTool.m
//  ChePM
//
//  Created by neng on 14-12-22.
//  Copyright (c) 2014年 gongsh. All rights reserved.
//  请求工具类

#import "XNHttpTool.h"
#import "AFNetworking.h"


//#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]
//#define kUnLoginTip [[[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没登录, 无法获取信息, 赶紧登录吧!" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]
#define kUnLoginTip [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没登录, 无法获取信息, 赶紧登录吧!" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil]

#define kErrorTip @"网络连接出错, 请检查网络"

@implementation XNHttpTool

#pragma mark - AFNetworking 请求
//普通get请求
+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    
    // 发送一个post请求
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    
    // 3.发送请求
    [manger GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            XNLog(@"http log-->%@",error);
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }

//            [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil]
            
            failure(error);
        }
        
    }];
    
}


+ (void)getWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
//    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    if(!token){
        
        //XNLog(@"未取得token, 请检查账户是否登录!");
        
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    
    // 3.发送请求
    [manger GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            XNLog(@"http log-->%@",error);
            
            /*
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
            [alert show];
            */
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
            if ([resultStr isEqualToString:@"尚未登录"]&& !token) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
            
            failure(error);
        }
    }];
    
}


+ (void)getWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure resultTip:(BOOL) resultTip
{
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    //    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    if(!token){
        
        //XNLog(@"未取得token, 请检查账户是否登录!");
        
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    
    // 3.发送请求
    [manger GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            XNLog(@"http log-->%@",error);
            
            /*
             NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
             [alert show];
             */
            if(resultTip){
                NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
                
                NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
                if ([resultStr isEqualToString:@"尚未登录"]&& !token) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
                    if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                        [alert show];
                    }else{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                }
            }
           
            failure(error);
        }
    }];
    
}


//普通post请求
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer.timeoutInterval = 10.0f;
    
//    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];  //这个要放到设置header的后面.
    
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        if (failure) {
            XNLog(@"http log-->%@",error);
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            failure(error);
        }
        
    }];
    
}


//普通带请求头token.
+ (void)postWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer.timeoutInterval = 10.0f;
    
    
//    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    if(!token){
        //XNLog(@"未取得token, 请检查账户是否登录!");
            
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
//    manger.requestSerializer = [AFHTTPRequestSerializer serializer];  //这个必须在设置header的后面.  不能与设置header同时使用
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //返回为false && 包含"登录"2个字时 -> 判断为token失效      (包含登录也可能是 请先登录)
        /*
        if([[NSString stringWithFormat:@"%@",responseObject[@"result"]] isEqualToString:@"0"] && [[NSString stringWithFormat:@"%@",responseObject[@"msg"]] rangeOfString:@"登录"].length>0){
            [XNTips MBTipLongText:@"您的账号在其他地方登录过, 请重新登录!" onView:kKeyWindow];
        }
         */
        
        ////      [XNTips MBTipText:[NSString stringWithFormat:@"msg:%@",responseObject[@"msg"]] onView:self.view];
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        XNLog(@"请求失败 %@", error);
        if (failure) {
            
            XNLog(@"http log-->%@",error);
//            XNLog(@"http log--> %@",[[NSString alloc] initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding]);  //返回的错误信息在这里
            
//            NSString *errorJsonStr = [self data2jsonStr:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
//            XNLog(@"http log--> %@",errorJsonStr);  //返回的错误信息在这里
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
            if ([resultStr isEqualToString:@"尚未登录"] && !token) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
            
            
            failure(error);
        }
        
    }];
    
}


//post发送图片
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params image:(UIImage *)image success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 将图片转换为二进制
        NSData *data = UIImagePNGRepresentation(image);
        // 上传文件
        [formData appendPartWithFileData:data name:@"pic" fileName:@"123" mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


+ (void)deleteWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    //    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    if(!token){
        
        //XNLog(@"未取得token, 请检查账户是否登录!");
        
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    
    // 3.发送请求
    [manger DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            
            XNLog(@"http log-->%@",error);
            
            /*
             NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
             [alert show];
             */
            
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
            if ([resultStr isEqualToString:@"尚未登录"]&& !token) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                /*
                http log-->Error Domain=NSCocoaErrorDomain Code=3840 "The operation couldn’t be completed. (Cocoa error 3840.)" (Invalid value around character 0.) UserInfo=0x7fdb970c99a0 {NSDebugDescription=Invalid value around character 0., NSUnderlyingError=0x7fdb97050330 "Request failed: not found (404)"}
                */
                 
                //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                //[alert show];
                
                if([jsonDict[@"error"] isEqualToString:@""] || !jsonDict[@"error"]){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kErrorTip message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            
            failure(error);
        }
    }];
    
}

+ (void)putWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    //    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    if(!token){
        
        //XNLog(@"未取得token, 请检查账户是否登录!");
        
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    
    // 3.发送请求
    [manger PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            
            XNLog(@"http log-->%@",error);
            
            /*
             NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
             [alert show];
             */
            
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
            if ([resultStr isEqualToString:@"尚未登录"]&& !token) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:resultStr message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            failure(error);
        }
    }];
    
}


+ (void)patchWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    // 1.获取AFN的请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    //    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    if(!token){
        //XNLog(@"未取得token, 请检查账户是否登录!");
        
        kUnLoginTip;
        
        NSError *errorNoLogin = [[NSError alloc] initWithDomain:@"未登录" code:123 userInfo:@{@"error":@"not login"}];
        failure(errorNoLogin);
        
        return;
    }
    
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    // 3.发送请求
    [manger PATCH:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            XNLog(@"http log-->%@",error);
            
            /*
             NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:jsonDict[@"error"] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
             [alert show];
             */
            
            NSDictionary *jsonDict = [self data2dictionary:error.userInfo[@"com.alamofire.serialization.response.error.data"]];
            
            NSString *resultStr = [NSString stringWithFormat:@"%@",jsonDict[@"error"]];
            if ([resultStr isEqualToString:@"尚未登录"]&& !token) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的账号在其他地方登录过, 请重新登录!" message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:resultStr message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            failure(error);
        }
        
    }];
    
}


#pragma mark - NSURL 请求
//+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params image:(UIImage *)image success:(successBlock)success failure:(failureBlock)failure
- (void)idleWithParam:(id)param
{
    if (!kIsUserLogin) {
        return;
    }
    
    // 1. url
    NSString *urlStr = [NSString stringWithFormat:@"%@/idle", kHttpApiAddress];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. request，POST方法，需要建立一个可变的请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 1> POST 方法
    request.HTTPMethod = @"POST";
    
    // 2> 数据体
    //    NSString *bodyStr = [NSString stringWithFormat:@"username=%@&password=%@", userName, password];
    //    NSString *bodyStr = @"[{\"park_id\":1,\"idle\":1,\"loop\":\"weekly\",\"loop_value\":\"6,0\",\"time\":[{\"start_time\":\"9:00\",\"end_time\":\"18:00\"}]},{\"park_id\":1,\"idle\":1,\"loop\":\"once\",\"loop_value\":\"2015-08-05\",\"time\":[{\"start_time\":\"9:00\",\"end_time\":\"12:00\"}, {\"start_time\":\"14:00\",\"end_time\":\"18:00\"}]}]";
    
    // 将字符串转换成二进制数据
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    //    [request setValue:@"" forHTTPHeaderField:@""];
    [request setValue:kIsUserLogin forHTTPHeaderField:@"Authorization"];
    [request setTimeoutInterval:10.0];  //超时时间
    
    // 3. 发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 1> 将返回的二进制数据，转换成字符串
        //        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"idle--> %@", result);
        
        // 2> JSON,格式是和NSDictionary的快速包装格式
        // 将JSON转换成字典
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"POST ==> %@", dict);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [XNTips MBTipText:@"发布车位成功"];
            //NSArray *tmpArray = [[NSArray alloc] initWithArray:responseObject[@"data"]];  //设置数据源
            
            //[SVProgressHUD dismiss];
            
            //[self.navigationController popViewControllerAnimated:YES];
            
        });
        
    }];
    
}



#pragma mark - 测试
//=================================================================================================================
//针对本应用成功的测试.
//responseObject--> {"msg":"\u767b\u5f55\u6210\u529f","token":"58d44f5e0c4b438989005e6ba1e380c7","user_id":"11"}
-(void)testRequist{
    
    NSString *url = [NSString stringWithFormat:@"%@/users", kHttpApiAddress];
    
    //        NSDictionary *param = @{@"username":_userameTextField.text,@"password":_passwordTextField.text,@"pushtoken":[self getDeviceToken],@"device":@"iOS"};
    NSDictionary *param = @{@"username":@"12121213222221",@"password":@"122",@"nickname":@"aaa",@"device":@"aaa",@"pushtoken":@"aaa"};
    
    //postWithUrl
    [XNHttpTool postWithUrl:url params:param success:^(id responseObject) {
        
        //        [XNHttpTool prettyLogJson:responseObject mark:@"loginWithUsername"];
        
        //       NSString *responeDataStr =  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        XNLog(@"responseObject1111--> %@", responseObject);
        
        //        XNLog(@"responseObject--> %@",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
        
        
    } failure:^(NSError *error) {
        //                [XNTips MBTipText:@"网络状况不佳!" onView:self.view];
        //        kNetworkFailTip;
        
        //XNLog(@"test--> %@",error);
        //error.userInfo[@"com.alamofire.serialization.response.error.data"]  //错误信息输出在这里
        
        //XNLog(@"111--> %@",[[NSString alloc] initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding]);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[[NSString alloc] initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding]] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }];
    
}


//测试post请求
+ (void)postWithUrlTest:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer.timeoutInterval = 10.0f;
    
    
//    manger.requestSerializer =[AFJSONRequestSerializer serializer];
    
    
//    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    //    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    
    
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        XNLog(@"发送成功");
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //        XNLog(@"请求失败 %@", error);
        if (failure) {
            failure(error);
        }
        
    }];
    
}


//普通带请求头token. ORUN定制版. 且看数据返回, 防止Error Domain=NSCocoaErrorDomain Code=3840
+ (void)testPostWithHeaderTokenAndUrl:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    //    manger.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    
    //    XNLog(@"token---> %@",token);
    
    //在请求的时候打印这个. 就能看返回的错误信息
    //    XNLog(@"finish--->  %@", [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding]);
    
    if(!token){
        XNLog(@"未取得token, 请检查账户是否登录!");
        
        //return;
    }
    [manger.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        XNLog(@"发送成功");
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        XNLog(@"请求失败 %@", error);
        if (failure) {
            failure(error);
        }
    }];
}


-(void)testRequist2{
    
    NSString *url = [NSString stringWithFormat:@"%@/users", kHttpApiAddress];
    
    //        NSDictionary *param = @{@"username":_userameTextField.text,@"password":_passwordTextField.text,@"pushtoken":[self getDeviceToken],@"device":@"iOS"};
    NSDictionary *param = @{@"username":@"13883828451",@"password":@"123456",@"push_token":@"111111asasaasad",@"device":@"iOS",@"nickname":@"aawww"};
    
    //postWithUrl
    [XNHttpTool postWithUrlTest:url params:param success:^(id responseObject) {
        
//        [XNHttpTool prettyLogJson:responseObject mark:@"loginWithUsername"];
        NSString *result  = [NSString stringWithFormat:@"%@",responseObject[@"result"]]; //成功时返回的1, 0表示不成功.
        if([result isEqualToString:@"1"]){
            
            
        }else{
            
            
        }
        
    } failure:^(NSError *error) {
        //                [XNTips MBTipText:@"网络状况不佳!" onView:self.view];
        //        kNetworkFailTip;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",error] message:nil delegate:self cancelButtonTitle:@"我知道了!" otherButtonTitles:nil, nil];
        [alert show];
        
    }];
    
}

//AFMultipartFormData
-(void)testRequest1{
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *token= [[NSUserDefaults standardUserDefaults] valueForKey:kUserToken];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    
    
    NSString *url = [NSString stringWithFormat:@"%@/users", kHttpApiAddress];
    NSDictionary *param = @{@"username":@"13883828451",@"password":@"123456",@"push_token":@"111111asasaasad",@"device":@"iOS",@"nickname":@"aawww"};
    
    
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //用2种方法
        
        //        [formData appendPartWithFileData:data name:@"blob" fileName:@"userIcon.jpg" mimeType:@"multipart/form-data"];
        
        
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]; //NSdata转换成dict
        XNLog(@"uploadImage---> %@", dict);
        
   
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
    }];
    
}

#pragma mark - 输出log
+(void)logPrettyJson:(id)json mark:(NSString *)mark{
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonPrt = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    XNLog(@"%@---> %@",mark,jsonPrt);
}

+(void)prettyLogJson:(id)json mark:(NSString *)mark{
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonPrt = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    XNLog(@"%@---> %@",mark,jsonPrt);
}


#pragma mark - 网络数据类型转换
+(NSString *)data2jsonStr:(id)data{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+(NSDictionary *)data2dictionary:(NSDate *)receiveData{
    
    NSString *receiveStr = [[NSString alloc]initWithData:receiveData encoding:NSUTF8StringEncoding];
    
    //字符串再生成NSData
    
    NSData * data = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //再解析
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    return jsonDict;
}

+(NSDictionary *)string2Dict:(NSString *)str{
    NSError *error = nil;
    NSDictionary *string2dic = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                                               options: NSJSONReadingMutableContainers
                                                                 error: &error];
    NSLog(@"string2Dict--> %@",string2dic);
    return string2dic;
}

@end
