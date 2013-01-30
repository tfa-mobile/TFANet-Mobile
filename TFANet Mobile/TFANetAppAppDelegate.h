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
@property (nonatomic) NSInteger start;
@property (nonatomic) NSInteger step;


-(void) loginTFANet:(NSString*) user with: (NSString*) pwd;
-(void) checkAuthorizationWithCompletionBlock:(TFANetResponseBlock) callback;
-(void) getAllGroupsWithCompletionBlock:(TFANetResponseBlock)callback;
-(void) getMoreGroupsWithCompletionBlock:(TFANetResponseBlock)callback for:(NSString*) page andSize:(NSString*)step;
-(bool) prefsSaved;
-(NSString *)loadUsername;
-(NSString *) loadPassword;
-(void) storePrefs:(NSString *)username with:(NSString*)pwd;

@end
