//
//  Author.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject

@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;

+(Author*) getAuthorWithDictionary:(NSDictionary*)dict;
@end
