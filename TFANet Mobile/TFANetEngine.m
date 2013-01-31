//
//  TFANetEngine.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 12/18/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import "TFANetEngine.h"

@implementation TFANetEngine


-(MKNetworkOperation*)bodyForPath:(NSString*)path
                             verb:(NSString*)verb
                             body:(NSMutableDictionary*)body
                      isCacheable:(BOOL)cached
                     onCompletion:(AuthBodyResponseBlock) completionBlock
                          onError:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:body
                                          httpMethod:verb];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSLog(@"URL: %@", completedOperation.url);
        NSError *error;
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
        
        // do your processing here
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:completedOperation.responseData options:0 error:&error];
        completionBlock(json);
    
    }errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
              errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}
@end
