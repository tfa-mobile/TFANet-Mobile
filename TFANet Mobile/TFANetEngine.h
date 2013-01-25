//
//  TFANetEngine.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 12/18/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//


@interface TFANetEngine : MKNetworkEngine


typedef void (^AuthBodyResponseBlock)(NSDictionary* body);

-(MKNetworkOperation*)bodyForPath:(NSString*)path
                             verb:(NSString*)verb
                             body:(NSMutableDictionary*)body
                      isCacheable:(BOOL)cached
                     onCompletion:(AuthBodyResponseBlock) completionBlock
                          onError:(MKNKErrorBlock) errorBlock;
@end
