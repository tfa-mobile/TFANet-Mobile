//
//  Group.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/29/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "Group.h"

@implementation Group{}

+(Group*)groupWithDictionary:(NSDictionary*)dict
{
    Group* group = [[Group alloc]init];
    
    
    group.handle = [dict objectForKey:@"handle"];
    group.ID = [dict objectForKey:@"id"];
    group.icon = [dict objectForKey:@"icon"];
    group.summary = [dict objectForKey:@"summary"];
    group.membercount = [dict objectForKey:@"membercount"];
    group.updated = [dict objectForKey:@"updated"];
    group.title = [dict objectForKey:@"title"];
    
    return group;
}

@end
