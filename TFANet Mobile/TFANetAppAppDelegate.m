//
//  TFANetAppAppDelegate.m
//  TFANet Mobile
//
//  Created by Henry Fougere on 12/6/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import "TFANetAppAppDelegate.h"

@implementation TFANetAppAppDelegate
@synthesize authEngine, window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

//    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary];
//    [headerFields setValue:@"V4kd5k8v88vsbn56RiCWXpLBwsmUbXcPIzfaQXGPRwYHpkH6rok3qCc3C16ogOagiy5xV9XCT/eeBf+NzcyPVmEBhVNlpA1mKJoeGSkBYdaRZr1xD4VBB0ilWtH2nrBuiB8/Y4VCcxmodjx57UANGVrxM5F0ZGntBWP2Rug7wnbuEc5e8kts9K4h0/ViSIn/zCmvV1ZaZd887pzQbIyhXDm0lels0G8D9rpfZ/TmkDuMBME7jPmE3LBHQgu1k3IYeAZRtOsq2h/k4MYU7aYPXFoVBwHW63Jxo8G+koueTPcf0MHXlSa48ZbkZtm7G4sZaF/xaKtfbxPWjPPImCAQD+Limbgj/tD8R0aqK3RYbOZKSuW+HCetHSl9CEP39/mOgmiLJIgzDJveFj49rgMpqF8k4wxD/m1h8UhmY3qqXP0uZUVz+z/NsH0OBeMrRAgpsQIH0YQBxQMN54lMyyxONM2Gz5OExkYzLR7DTOpjmmvwsgQH4zowq2VUJZTlrUhn7qjeeKAEgzvd/nhs3Yhc5PuXpxjfWxYcOKXTTVwEXOl3svji0j3dMxTGFb3KhZX898V5vSyxsViHhAMuT5zY0ghY4tJhSsVKYzGoaEufULmLMVcDsWYppQ6UR+pTaH2CC8SEvHCkot9lc96DrDmxF5pYrDIw/whxjjQJk+9py2c=" forKey:@"LtpaToken2"];
//     [headerFields setValue:@"MHKVPiHbXf5sWS1JFvKkFv/9qzQ9m4YXcXaVra+I3T24DnVp/FBtBB2OOB2nLFQQbbUise2ouOjmz16jcBbRswv4Tggj30QnIDkPeez1QTXV9IAxE/PuRx87/hJxgCDb9tebpEKhHFPeMIbwgRJTOrTS7ZG42atge0tVEHGk8HzU+S5Cl2V0TaWHndO5RdmbrG5kO86xcLy8YkmKxo4xHZMv2jvH3y8ELKM1xrWA30g2O7LmkYbPplH7cwt+SVdxoDyhupt0s8Tcwa7m7UwT8whCG4B++d+9GpMXrd72/8KDEuRYok3V3bSVsN+OQPj6iHRs1YNceF7KPDPhtpQiow==" forKey:@"LtpaToken"];
//    [headerFields setValue:@"http://dev.tfanet.org/mobileauth/login.jsp" forKey:@"Referer"];
    self.authEngine = [[TFANetEngine alloc] initWithHostName:@"dev.tfanet.org"];
    
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


-(void) getAllGroupsWithCompletionBlock:(TFANetResponseBlock)callback {
    [self.authEngine bodyForPath:@"lcapi/community/communities?ps=10&page=1&sortby=1&orderby=1&tag=&search=Search+for+a+Group&include=all" verb:@"GET" body:nil isCacheable:FALSE onCompletion:^(NSDictionary *body) {
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



-(void) loginTFANet:(NSString*) user with: (NSString*) pwd{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:user forKey:@"j_username"];
    [dict setValue:pwd forKey:@"j_password"];
    [dict setValue:@"login" forKey:@"login"];
    [self.authEngine bodyForPath:@"mobileauth/j_security_check" verb:@"POST" body:dict isCacheable:NO onCompletion:^(NSDictionary *body) {
        if([body count]>0){
        
            NSLog(@"body: %@", body);
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
