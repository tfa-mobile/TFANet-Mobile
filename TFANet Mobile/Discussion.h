//
//  Discussion.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
@interface Discussion : NSObject

@property (nonatomic, retain) NSString * threadCount;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * ID;
@property (nonatomic, retain) Author * author;
@property (nonatomic, retain) NSString * updated;


+(Discussion*)discussionWithDictionary:(NSDictionary*)dict;
@end
