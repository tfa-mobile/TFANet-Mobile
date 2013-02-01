//
//  Author.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "Author.h"

@implementation Author
+(Author*) getAuthorWithDictionary:(NSDictionary*)dict{
    Author *author = [[Author alloc]init];
    
    author.userID = [dict objectForKey:@"snx:userid"];
    author.name = [dict objectForKey:@"name"];
    author.email = [dict objectForKey:@"email"];

    return author;

}

@end
