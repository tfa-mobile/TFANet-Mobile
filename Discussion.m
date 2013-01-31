//
//  Discussion.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "Discussion.h"

@implementation Discussion

+(Discussion*) discussionWithDictionary:(NSDictionary*)dict
{
    Discussion *discussion = [[Discussion alloc]init];
    
    discussion.author = [Author getAuthorWithDictionary:[dict objectForKey:@"author"]];
    discussion.ID = [dict objectForKey:@"id"];
    discussion.summary = [dict objectForKey:@"summary"];
    discussion.updated = [dict objectForKey:@"updated"];
    discussion.title = [dict objectForKey:@"title"];
    discussion.threadCount = [dict objectForKey:@"thr:count"];
    
    return discussion;
}

@end
