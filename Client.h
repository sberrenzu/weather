//
//  Client.h
//  weather
//
//  Created by 黄健 on 16/8/25.
//  Copyright (c) 2016年 黄健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol ClientDelegate <NSObject>
-(void)getWeatherInfoSuccessFeedback:(id)feedbackInfo;
-(void)getWeatherInfoFailFeedback:(id)failInfo;

@end

@interface Client : NSObject
@property (nonatomic,strong) id<ClientDelegate> delegate;

-(void)getWeatherInfoWithCity:(NSString *)cityName;
+(Client *)getInstance;

@end