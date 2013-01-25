//
//  TFANetAppAppDelegate.h
//  TFANet Mobile
//
//  Created by Henry Fougere on 12/6/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFANetEngine.h"
typedef void (^TFANetResponseBlock)(NSDictionary*);

@interface TFANetAppAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) TFANetEngine *authEngine;


-(void) loginTFANet:(NSString*) user with: (NSString*) pwd;
-(void) checkAuthorizationWithCompletionBlock:(TFANetResponseBlock) callback;
@end
