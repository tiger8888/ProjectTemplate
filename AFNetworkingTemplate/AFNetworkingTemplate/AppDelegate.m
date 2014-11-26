//
//  AppDelegate.m
//  AFNetworkingTemplate
//
//  Created by MYL-SOFTWARE on 14-11-21.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

#if __IPHONE_OS_VERSION_MIN_REQUIRED
#import "GlobalTimelineViewController.h"

#import "AFNetworkActivityIndicatorManager.h"

@implementation AppDelegate

- (BOOL)application:(__unused UIApplication *)application
didFinishLaunchingWithOptions:(__unused NSDictionary *)launchOptions
{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    UITableViewController *viewController = [[GlobalTimelineViewController alloc] initWithStyle:UITableViewStylePlain];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
#else
#import "Post.h"
#import "User.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [self.window makeKeyAndOrderFront:self];
    
    [Post globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (error) {
            NSAlert *alert = [[NSAlert alloc] init];
            alert.messageText = NSLocalizedString(@"Error", nil);
            alert.informativeText = error.localizedDescription;
            [alert addButtonWithTitle:NSLocalizedString(@"OK", nil)];
            [alert runModal];
        }
        
        self.postsArrayController.content = posts;
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kUserProfileImageDidLoadNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        [self.tableView reloadData];
    }];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)application
                    hasVisibleWindows:(BOOL)flag
{
    [self.window makeKeyAndOrderFront:self];
    
    return YES;
}

@end
#endif

//@implementation AppDelegate
//
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//
//    ViewController *vc = [[ViewController alloc] init];
//    self.window.rootViewController = vc;
//    
//    [self.window makeKeyAndVisible];
//    self.window.backgroundColor = [UIColor whiteColor];
//    
//    return YES;
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application {
//    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}
//
//@end
