//
//  Group.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/29/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject{}

@property (nonatomic, retain) NSString * handle;
@property (nonatomic, retain) NSString * ID;
@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * membercount;
@property (nonatomic, retain) NSString * updated;
@property (nonatomic, retain) NSString * title;

+(Group*)groupWithDictionary:(NSDictionary*)dict;

@end
