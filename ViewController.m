//
//  ViewController.m
//  weather
//
//  Created by 黄健 on 16/8/22.
//  Copyright (c) 2016年 黄健. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define LOCALCITY @"Auckland"

static NSString *const BaseURLString = @"api.openweathermap.org/data/2.5/weather?id=2193732";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _KYClient=[Client getInstance];
    _KYClient.delegate=self;
    [self GetWeatherInfoByName:LOCALCITY];
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [self.tableView setBackgroundView:tableBg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dt count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"simpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSArray *tempeture = [_dt objectForKey:@"temp"];
    NSDictionary *tempeture1 = [tempeture objectAtIndex:indexPath.row];
    cell.textLabel.text = [tempeture1 objectForKey:@"day"];
    return cell;
}

-(void)getWeatherInfoSuccessFeedback:(id)feedbackInfo{
    NSLog(@"%@",[feedbackInfo class]);
    NSDictionary *dic=feedbackInfo;
    _dt=[dic objectForKey:@"dt"];
}

-(void)getWeatherInfoFailFeedback:(id)failInfo{
    NSLog(@"%@",failInfo);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Search Text %@", textField.text);
    //request data
    //[tableData addObject:textField.text];
    //[self.tableView reloadData];
    [self GetWeatherInfoByName:textField.text];
    return  YES;
}

- (void)GetWeatherInfoByName:(NSString *)cityName{
    [_KYClient getWeatherInfoWithCity:cityName];
}
@end
