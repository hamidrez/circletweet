//
//  AppDelegate.m
//  CircleTweets
//
//  Created by Hamid Dadkhah on 2013-01-23.
//  Copyright (c) 2013 JemblGroup. All rights reserved.
//

#import "AppDelegate.h"
#import "SHSidebarController.h"
#import "HomeVC.h"
#import "MainVC.h"
#import "BBViewController.h"
#import "ChatClientViewController.h"
#import "ChatMain.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSMutableArray *vcs = [NSMutableArray array];
    

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    MainVC *vc = [[MainVC alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:vc];
    NSDictionary *homeView = [NSDictionary dictionaryWithObjectsAndKeys:navHome, @"vc", [NSString stringWithFormat:@"Home"], @"title", nil];
    [vcs addObject:homeView];
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ChatMain *chat = [[ChatMain alloc] init];
    UINavigationController *chatNav = [[UINavigationController alloc] initWithRootViewController:chat];
    NSDictionary *chatView = [NSDictionary dictionaryWithObjectsAndKeys:chatNav, @"vc", [NSString stringWithFormat:@"Chat"], @"title", nil];
    [vcs addObject:chatView];
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        BBViewController *friends = [[BBViewController alloc] initWithNibName:@"BBViewController_iPhone" bundle:nil];
    //} else {
        //BBViewController *friends = [[BBViewController alloc] initWithNibName:@"BBViewController_iPad" bundle:nil];
    //}
    UINavigationController *friendsNav = [[UINavigationController alloc] initWithRootViewController:friends];
    NSDictionary *friendsView = [NSDictionary dictionaryWithObjectsAndKeys:friendsNav, @"vc", [NSString stringWithFormat:@"Settings"], @"title", nil];
    [vcs addObject:friendsView];
    
    
    
    
    
   
    
    /*
     * Add te views to the sidebar menu
     */
    SHSidebarController *sidebar = [[SHSidebarController alloc] initWithArrayOfVC:vcs];
    self.window.rootViewController = sidebar;
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)changeView:(NSUInteger)viewNumber;
{
    if(viewNumber == 1)
    {
    }
}

@end
