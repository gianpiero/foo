
#import "Parse/Parse.h"
#import "ParseStarterProjectAppDelegate.h"
#import "MyTableController.h"

@implementation ParseStarterProjectAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@"A0qMAbHhYCMwG0LzH639yxXeWVKEzHwHwXgFHq3t" clientKey:@"m1qIOhdBcyP7k41KHNSe1I60FZsZoIDgtJYJf2Mw"];

    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.

    MyTableController *controller = [[MyTableController alloc] init];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
