//
//  NSDate+Additions.m
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

- (NSInteger)year
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSYearCalendarUnit fromDate:[NSDate date]];
  return dateComponents.year;
}

- (NSInteger)month
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSMonthCalendarUnit fromDate:self];
  return dateComponents.month;
}

- (NSString *)getEnglishMonthLogogram:(BOOL)logogram
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:logogram?@"MMM":@"MMMM"];
    
    NSString * month = [dateFormatter stringFromDate:self];
    
    return month;
}

- (NSInteger)day
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSEraCalendarUnit
                                       | NSYearCalendarUnit
                                       | NSMonthCalendarUnit
                                       | NSDayCalendarUnit fromDate:self];
  return dateComponents.day;
}

- (NSInteger)hour
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSHourCalendarUnit fromDate:self];
  return dateComponents.hour;
}

- (NSInteger)minute
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSMinuteCalendarUnit fromDate:self];
  return dateComponents.minute;
}

- (NSInteger)second
{
  NSDateComponents * dateComponents = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]
                                       components:NSSecondCalendarUnit fromDate:self];
  return dateComponents.second;
}

- (NSString *) stringTimesAgo
{
    NSTimeInterval  timeInterval = [[NSDate date] timeIntervalSinceNow];
    timeInterval = -timeInterval;
    NSInteger temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

- (BOOL)isBetweenDates:(NSDate *)beginDate andDate:(NSDate *)endDate
{
    if ([self compare:beginDate] == NSOrderedAscending) {
        return NO;
    }
    
    if ([self compare:endDate] == NSOrderedDescending) {
        return NO;
    }
    
    return YES;
}

@end