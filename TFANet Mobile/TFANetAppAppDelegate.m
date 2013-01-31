//
//  TFANetAppAppDelegate.m
//  TFANet Mobile
//
//  Created by Henry Fougere on 12/6/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import "TFANetAppAppDelegate.h"
#define kUsernameKey                        @"username"
#define kPasswordKey                        @"password"


@implementation TFANetAppAppDelegate
NSUserDefaults *prefs;
@synthesize authEngine, window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    self.authEngine = [[TFANetEngine alloc] initWithHostName:@"dev.tfanet.org"];
    
    prefs = [NSUserDefaults standardUserDefaults];
    //clear keychain on first run or reinstallation
    
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

-(bool)prefsSaved{

    return ([[NSUserDefaults standardUserDefaults] objectForKey:kUsernameKey]);
}

-(NSString *)loadUsername{
        return [prefs objectForKey:kUsernameKey];
}

-(NSString *) loadPassword{
    return [prefs objectForKey:kPasswordKey];
}

-(void) storePrefs:(NSString *)username with:(NSString *)pwd{
    [prefs setObject:username forKey:kUsernameKey];
    [prefs setObject:pwd forKey:kPasswordKey];

}
-(void) getAllGroupsWithCompletionBlock:(TFANetResponseBlock)callback {
    [self.authEngine bodyForPath:@"lcapi/community/communities?ps=25&page=1&sortby=1&orderby=1&tag=&search=&include=all" verb:@"GET" body:nil isCacheable:FALSE onCompletion:^(NSDictionary *body) {
        if([body count] >0){
            
            callback(body);
        }else{
            NSLog(@"Empty body:");
        }
    }  onError:^(NSError *error){
        NSLog(@"error: %@",error);
        
    }];
    
}
-(void) getDiscussionsInGroup:(NSString*)handle withCallback:(TFANetResponseBlock) callback{
    NSString *url = [NSString stringWithFormat:@"lcapi/blogs/%@?ps=10&page=1&sortby=0&order=1", handle];
    
    [self.authEngine bodyForPath:url verb:@"GET" body:nil isCacheable:FALSE onCompletion:^(NSDictionary *body) {
        if([body count] >0){
            
            callback(body);
        }else{
            NSLog(@"Empty body:");
        }
    }  onError:^(NSError *error){
        NSLog(@"error: %@",error);
        
    }];


}

-(void) getMyGroupsWithCompletionBlock:(TFANetResponseBlock)callback {
    [self.authEngine bodyForPath:@"lcapi/community/communities?ps=25&page=1&sortby=1&orderby=1&tag=&search=&include=my" verb:@"GET" body:nil isCacheable:FALSE onCompletion:^(NSDictionary *body) {
        if([body count] >0){
            
            callback(body);
        }else{
            NSLog(@"Empty body:");
        }
    }  onError:^(NSError *error){
        NSLog(@"error: %@",error);
        
    }];
    
}

-(void) getMoreGroupsWithCompletionBlock:(TFANetResponseBlock)callback for:(NSNumber*) page andSize:(NSNumber*)step{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue: page.stringValue forKey:@"page"];
    [params setValue: step.stringValue forKey:@"ps"];
    [params setValue: @"1" forKey:@"sortby"];
    [params setValue: @"1" forKey:@"orderby"];
    [params setValue: @"" forKey:@"tag"];
    [params setValue: @"" forKey:@"search"];
    [params setValue:@"all" forKey:@"include"];
    
    [self.authEngine bodyForPath:@"lcapi/community/communities" verb:@"GET" body:params isCacheable:FALSE onCompletion:^(NSDictionary *body) {
        if([body count] >0){
            
            callback(body);
        }else{
            NSLog(@"Empty body:");
        }
    }  onError:^(NSError *error){
        NSLog(@"error: %@",error);
        
    }];
    
    
    // /lcapi/community/communities?ps=10&page=1&sortby=1&orderby=1&tag=&search=Search+for+a+Group&include=all
}
-(void) loginTFANet:(NSString*) user with: (NSString*) pwd usingCompleteCallbacK:(TFANetResponseBlock) callback{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:user forKey:@"j_username"];
    [dict setValue:pwd forKey:@"j_password"];
    [dict setValue:@"login" forKey:@"login"];
    [self.authEngine bodyForPath:@"mobileauth/j_security_check" verb:@"POST" body:dict isCacheable:NO onCompletion:^(NSDictionary *body) {
        if([body count]>0){
        
           [self checkAuthorizationWithCompletionBlock:^(NSDictionary *body) {
               callback(body);
           }];
        }
        else{
            NSLog(@"Got the form back.");
            NSLog(@"body: %@", body);
        }
    } onError:^(NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

-(void) checkAuthorizationWithCompletionBlock:(TFANetResponseBlock)callback{

    [self.authEngine bodyForPath:@"mobileauth/authn" verb:@"GET" body:nil isCacheable:NO onCompletion:^(NSDictionary *body) {
        callback(body);
    } onError:^(NSError *error) {
        NSLog(@"error");
        
    }];

}
@end
