//
//  Client.m
//  weather
//
//  Created by 黄健 on 16/8/25.
//  Copyright (c) 2016年 黄健. All rights reserved.
//
#import "Client.h"

__strong static AFHTTPRequestOperationManager *AFHTTPMgr;
__strong static Client *NetInstance=nil;
@implementation Client

+(Client *)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        NetInstance= [[Client alloc]init];//init
        
        //AFHTTPOerrationManager setup
        AFHTTPMgr=[AFHTTPRequestOperationManager manager];
        //return json
        AFHTTPMgr.responseSerializer=[AFJSONResponseSerializer serializer];
        //req json
        AFHTTPMgr.requestSerializer=[AFJSONRequestSerializer serializer];
        //or XML
        //AFHTTPMgr.responseSerializer.acceptableContentTypes= [NSSet setWithObject:@"text/xml"];
        //timeout
        AFHTTPMgr.requestSerializer.timeoutInterval=5;
    });
    return NetInstance;
}

-(void)getWeatherInfoWithCity:(NSString *)cityName{
    //rev add
    NSString *url=[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily"];
    //param
    NSString *param =[NSString stringWithFormat:@"%@&mode=json&units=metric&cnt=7&appID=8b7661be7bbdbfb1004eb364dd045ab6", cityName];
    NSDictionary *parameters=[[NSDictionary alloc]initWithObjectsAndKeys: param, @"q", nil];
    //send req
    [AFHTTPMgr GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.delegate getWeatherInfoSuccessFeedback:responseObject];
        //suc
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //fail
        [self.delegate getWeatherInfoFailFeedback:error];
    }];
}

@end
