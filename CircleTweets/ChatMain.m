//
//  ChatMain.m
//  CircleTweets
//
//  Created by Hamid Dadkhah on 2013-01-26.
//  Copyright (c) 2013 JemblGroup. All rights reserved.
//

#import "ChatMain.h"
#import "ChatClientViewController.h"

@implementation ChatMain

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (IBAction) joinChat
{
    ChatClientViewController *obj =[[ChatClientViewController alloc]initWithNibName:@"ChatClientViewController" bundle:nil];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
