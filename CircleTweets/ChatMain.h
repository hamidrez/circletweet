//
//  ChatMain.h
//  CircleTweets
//
//  Created by Hamid Dadkhah on 2013-01-26.
//  Copyright (c) 2013 JemblGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol managerDelegate <NSObject>
-(void)changeView:(NSUInteger)viewNumber;
@end

@interface ChatMain : UIViewController

@property (strong, nonatomic) UIWindow *window;

- (IBAction) joinChat;


@property (nonatomic,strong) id <managerDelegate> delegate;

@end
