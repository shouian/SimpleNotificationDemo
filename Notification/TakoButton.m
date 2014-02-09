//
//  TakoButton.m
//  Notification
//
//  Created by 李健銘 on 2014/2/8.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "TakoButton.h"

@interface TakoButton ()

{
    int receiveTimes;
}

@end

@implementation TakoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"ButtonIsPressed" object:nil];
        receiveTimes = 0;
        
        [self addTarget:self action:@selector(removeNotificationObserver) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)receiveNotification:(NSNotification *)notification
{
    receiveTimes++;
    NSDictionary *receiveInfo = [notification userInfo];
    NSString *message = [NSString stringWithFormat:@"%@ %d times",[receiveInfo objectForKey:@"receiveKey"],receiveTimes];
    [self setTitle:message forState:UIControlStateNormal];
}

- (void)removeNotificationObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ButtonIsPressed" object:nil];
    [self setTitle:@"Observer is removed!" forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
