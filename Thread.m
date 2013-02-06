//
//  Thread.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 2/1/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "Thread.h"

@implementation Thread

@synthesize comments, files, tags, author, threadCount, threadTitle, updated, icon, ID;

+(Thread *) threadFromDictionary:(NSDictionary *) dict{
    
    
        Thread *thread = [[Thread alloc]init];
        
        thread.author = [Author getAuthorWithDictionary:[dict objectForKey:@"author"]];
        thread.ID = [dict objectForKey:@"id"];
        thread.content = [dict objectForKey:@"content"];
        thread.updated = [dict objectForKey:@"updated"];
        thread.threadTitle = [dict objectForKey:@"title"];
        thread.threadCount = [dict objectForKey:@"totalResults"];
        thread.comments = [dict objectForKey:@"comments"];
        thread.files = [dict objectForKey:@"files"];
        thread.tags = [dict objectForKey:@"tags"];
        thread.icon = [dict objectForKey:@"icon"];
    return thread;
}


@end
