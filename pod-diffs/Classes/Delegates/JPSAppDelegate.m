//
//  JPSAppDelegate.m
//  pod-diffs
//
//  Created by JP Simard on 3/12/14
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSAppDelegate.h"

@implementation JPSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
