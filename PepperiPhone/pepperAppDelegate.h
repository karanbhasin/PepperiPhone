//
//  pepperAppDelegate.h
//  PepperiPhone
//
//  Created by Singh, Jaskaran on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "loginViewController.h"

@interface pepperAppDelegate : UIResponder <UIApplicationDelegate>{
    
}
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) API *api;


@property (nonatomic, assign) loginViewController *loginViewController;
//@property (nonatomic, assign) LoginLoadingViewController *loginLoadingViewController;

- (void) openTabController;
- (void) showActivityViewer:(NSString *)text;
- (void) hideActivityViewer;
- (void) returnToLogin;
@end
