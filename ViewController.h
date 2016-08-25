//
//  ViewController.h
//  weather
//
//  Created by 黄健 on 16/8/22.
//  Copyright (c) 2016年 黄健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, ClientDelegate>
@property (nonatomic, retain) NSMutableDictionary *dt;
//@property (nonatomic, retain) NSMutableDictionary *temp;
//@property (nonatomic, retain) NSMutableDictionary *weather;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property Client *KYClient;


@end

