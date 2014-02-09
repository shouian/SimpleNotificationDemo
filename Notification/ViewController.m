//
//  ViewController.m
//  Notification
//
//  Created by 李健銘 on 2014/2/8.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "ViewController.h"
#import "TakoButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"Press me!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(broadcastNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    TakoButton *takoButton = [[TakoButton alloc]initWithFrame:CGRectMake(20, 200, 250, 50)];
    takoButton.backgroundColor = [UIColor brownColor];
    [self.view addSubview:takoButton];
    
}

- (void)broadcastNotification
{
    NSDictionary *notificationInfo = [[NSDictionary alloc] initWithObjectsAndKeys:@"receive broadcast",@"receiveKey", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonIsPressed" object:nil userInfo:notificationInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
