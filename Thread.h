//
//  Thread.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 2/1/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
@interface Thread : NSObject

@property (nonatomic, strong) NSMutableArray *comments, *files, *tags;
@property (nonatomic, strong) Author *author;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *threadTitle;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSString *threadCount;
@property (nonatomic, strong) NSString *ID;

+(Thread *) threadFromDictionary:(NSDictionary *) dict;

@end
