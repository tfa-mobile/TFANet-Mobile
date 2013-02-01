//
//  DateStamp.m
//  Finsta
//
//  Created by Vanessa Anderson on 8/11/12.
//  Copyright (c) 2012 Delta Sigma Theta. All rights reserved.
//

#import "DateStamp.h"
NSDateFormatter *year;
@implementation DateStamp
@synthesize day_format, time_format, date, day, today, todayStr, time, behavior, style, yearDate, year, yearStr;
- (id)initWithInterval:(NSTimeInterval) seconds
{
    
    self = [super init];
    if (self) {
        NSLocale *locale = [NSLocale currentLocale];
        
        day_format = [[NSDateFormatter alloc] init];
        [day_format setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"E MMM d" options:0 locale:locale]];
        time_format = [[NSDateFormatter alloc] init];
        
        [time_format setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"hh:mm a" options:0 locale:locale]];
        year = [[NSDateFormatter alloc] init];
        [year setDateFormat:@"yyyy"];
        
        NSDate *dateStamp = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        today = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        
        day = [day_format stringFromDate:dateStamp];
        time = [time_format stringFromDate:dateStamp];
        todayStr = [day_format stringFromDate:today];
        yearStr = [year stringFromDate:dateStamp];
//        NSLog(@"today: %@", [today description]);
//        NSLog(@" %s", [self isToday] ? "true" : "false");
//        NSLog(@" %s", [self isCurrentWeek] ? "true" : "false");
    }
    return self;
}



-(BOOL) isToday{
    if([day isEqualToString:todayStr])
        return true;
    else
        return false;
}
-(BOOL)isCurrentYear{
    return [yearStr isEqualToString:[year stringFromDate:today]];
}

-(NSString *) dateStampString{
    if(![self isToday]){
        if(![self isCurrentYear])
            return [NSString stringWithFormat:@"%@\r\n%@ '%@",time, day, [yearStr substringFromIndex:2]];

        else
            return [NSString stringWithFormat:@"%@\r\n%@",time, day];
    
    }
    else
        return [NSString stringWithFormat:@"%@\r\nToday",time];
}
@end
