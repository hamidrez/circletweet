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
#import "SettingsVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSMutableArray *vcs = [NSMutableArray array];
    
    // 1st View is the home view where users can see the tweets around them based on the settings
    
    //Creating view
    
    //Navigation Controller is required
    MainVC *vc = [[MainVC alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:vc];
    
    //Dictionary of the view and title
    NSDictionary *homeView = [NSDictionary dictionaryWithObjectsAndKeys:navHome, @"vc", [NSString stringWithFormat:@"Home"], @"title", nil];
    
    //And we finally add it to the array
    [vcs addObject:homeView];
    
    //Seond item and view is the settings view
    
    SettingsVC *settings = [[SettingsVC alloc] init];
    
    UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:settings];
    
    NSDictionary *settingsView = [NSDictionary dictionaryWithObjectsAndKeys:settingsNav, @"vc", [NSString stringWithFormat:@"Settings"], @"title", nil];
    [vcs addObject:settingsView];
    
    
    
    
    //Create controller and set views
    SHSidebarController *sidebar = [[SHSidebarController alloc] initWithArrayOfVC:vcs];
    self.window.rootViewController = sidebar;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
