//
//  LogInViewController.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 12/18/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (nonatomic) bool loggedIn;
@property (nonatomic, retain) IBOutlet UILabel *status;
     
@end
