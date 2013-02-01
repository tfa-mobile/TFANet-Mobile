//
//  DateStamp.h
//  Finsta
//
//  Created by Vanessa Anderson on 8/11/12.
//  Copyright (c) 2012 Delta Sigma Theta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateStamp : NSDateFormatter{

    NSDateFormatter *day_format, *time_format, *year;
    NSDateFormatterStyle *style;
    NSDateFormatterBehavior behavior;
    NSString *day,*time, *todayStr, *yearStr;
    NSDate *date, *today, *yearDate;
}
@property (nonatomic, retain) NSDateFormatter *day_format, *time_format, *year;
@property (nonatomic) NSDateFormatterStyle *style;
@property (nonatomic) NSDateFormatterBehavior behavior;
@property (nonatomic, retain) NSString *day, *time, *todayStr, *yearStr;
@property (nonatomic, retain) NSDate *date, *today, *yearDate;
- (id)initWithInterval:(NSTimeInterval) seconds;
-(BOOL) isToday;
-(NSString *) dateStampString;
@end
