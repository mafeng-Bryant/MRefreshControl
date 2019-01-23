//
//  NSString+NSDate.m
//  PatPat
//
//  Created by patpat on 2019/1/10.
//  Copyright © 2019 http://www.patpat.com. All rights reserved.
//

#import "NSString+NSDate.h"

@implementation NSString (NSDate)

+ (NSString *)leftTime:(NSTimeInterval)minutes
{
    NSTimeInterval onehour = 60; //1h=60m
    NSTimeInterval oneday = 1440;//1d=1440m
    NSTimeInterval oneWeek = 1440 * 7;
    if (minutes < onehour) {
        return [NSString stringWithFormat:@"%ldm",lrint(minutes)];
    } else if (minutes < oneday) {
        NSString *string = [NSString stringWithFormat:@"%.1fh",rintf(minutes/onehour)];
        return [string stringByReplacingOccurrencesOfString:@".0" withString:@""];
    } else if (minutes <= oneWeek) {
        return [NSString localizedStringWithFormat:PPLocalizationString(@"dailySpecia.day", nil),lrint(floor(minutes/oneday))];
    } else {
        NSInteger remainder = (NSInteger)minutes % ((NSInteger)oneWeek);
        return [self leftTime:(NSTimeInterval)remainder];
    }
}

+ (NSString *)fullUnitleftTime:(NSTimeInterval)minutes
{
    NSTimeInterval oneMinutes = 1;
    NSTimeInterval onehour = 60; //1h=60m
    NSTimeInterval oneday = 1440;//1d=1440m
    if (minutes<oneMinutes) {
        long int intSeconds = ceil(minutes*60);
        NSString *unit = intSeconds>1?@"seconds":@"second";
        return [NSString stringWithFormat:@"%ld %@",intSeconds,unit];
    }else if (minutes<onehour) {
        long int intMinutes= lrint(minutes);
        NSString *unit = intMinutes>1?@"minutes":@"minute";
        return [NSString stringWithFormat:@"%ld %@",intMinutes,unit];
    }else if (minutes<oneday) {
        float floatHous= rintf(minutes/onehour);
        NSString *unit = floatHous>1?@"hours":@"hour";
        NSString *string = [NSString stringWithFormat:@"%.1f %@",floatHous,unit];
        return [string stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else {
        long int intDays= lrint(floor(minutes/oneday));
        NSString *unit = intDays>1?PPLocalizationString(@"common.days", nil):PPLocalizationString(@"common.day", nil);
        return [NSString stringWithFormat:@"%ld %@",intDays,unit];
    }
}

+ (NSString *)timeAgoWithDate:(NSDate *)date
{
    if (!date)return @"";
    NSTimeInterval deltaSeconds = fabs([date timeIntervalSinceNow]);
    NSTimeInterval deltaMinutes = deltaSeconds / 60.0f;
    NSInteger minutes;
    if (deltaSeconds<5) {
        return PPString(JUSTNOW);
    }else if(deltaSeconds < 60){
        return [NSString stringWithFormat:PPString(SECONDS_AGO),ceil(deltaSeconds)];
    }else if(deltaSeconds < 120){
        return PPString(A_MINUTE_AGO);
    }else if(deltaMinutes < 60){
        return [NSString stringWithFormat:PPString(MINUTES_AGO),ceil(deltaMinutes)];
    }else if(deltaMinutes < 120){
        return PPString(A_HOUR_AGO);
    }else if(deltaMinutes < (24 * 60)){
        minutes = (NSInteger)floor(deltaMinutes/60);
        return [NSString stringWithFormat:PPString(HOURS_AGO),(long)minutes];
    }else if(deltaMinutes < (24 * 60 * 2)){
        return PPString(YESTERDAY);
    }else {
        return [date formatWithStyle:@"MMM dd, yyyy"];
    }
}

+ (NSString*)timeAgoWithMinuteDate:(NSDate*)date
{
    if (!date)return @"";
    NSTimeInterval deltaSeconds = fabs([date timeIntervalSinceNow]);
    NSTimeInterval deltaMinutes = deltaSeconds / 60.0f;
    NSInteger minutes;
    if (deltaSeconds<5) {
        return PPString(JUSTNOW);
    }else if(deltaSeconds < 60){
        return [NSString stringWithFormat:PPString(SECONDS_AGO),ceil(deltaSeconds)];
    }else if(deltaSeconds < 120){
        return PPString(A_MINUTE_AGO);
    }else if(deltaMinutes < 60){
        return [NSString stringWithFormat:PPString(MINUTES_AGO),ceil(deltaMinutes)];
    }else if(deltaMinutes < 120){
        return PPString(A_HOUR_AGO);
    }else if(deltaMinutes < (24 * 60)){
        minutes = (NSInteger)floor(deltaMinutes/60);
        return [NSString stringWithFormat:PPString(HOURS_AGO),(long)minutes];
    }else if(deltaMinutes < (24 * 60 * 2)){
        return PPString(YESTERDAY);
    }else {
        return [date formatWithStyle:@"MMM dd, yyyy HH:mm"];
    }
}

+ (NSString *)formatDate:(NSDate *)confromTime dateStyle:(NSString *)dateStyle
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateStyle];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTime];
    return confromTimespStr;
}


+ (NSTimeInterval)getTimeSp:(NSString*)dateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate* localDate = [formatter dateFromString:dateString];
    NSTimeInterval end_timesp = [localDate timeIntervalSince1970];
    NSDate *datenow = [NSDate date];
    NSTimeInterval date_timesp = [datenow timeIntervalSince1970];
    return end_timesp - date_timesp;
}

+ (NSTimeInterval)getTimeInterval:(NSString*)startDateString endDateString:(NSString*)endDateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate* endDate = [formatter dateFromString:endDateString];
    NSTimeInterval end_timesp = [endDate timeIntervalSince1970];
    NSDate* startDate = [formatter dateFromString:startDateString];
    NSTimeInterval start_timesp = [startDate timeIntervalSince1970];
    return end_timesp - start_timesp;
}

+ (BOOL)getTimerInfo:(NSString*)dateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate* localDate = [formatter dateFromString:dateString];
    NSTimeInterval end_timesp = [localDate timeIntervalSince1970];
    NSDate *datenow = [NSDate date];
    NSTimeInterval date_timesp = [datenow timeIntervalSince1970];
    NSTimeInterval maxSeconds = 24*60*60;
    int minus = (end_timesp - date_timesp);
    if (minus<=maxSeconds) {
        return YES;
    }else {
        return NO;
    }
}

+ (BOOL)isShowTime:(NSString*)nowDateString endDateString:(NSString*)endDateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate* localDate = [formatter dateFromString:endDateString];
    NSTimeInterval end_timesp = [localDate timeIntervalSince1970];
    NSDate* startDate = [formatter dateFromString:nowDateString];
    NSTimeInterval start_timesp = [startDate timeIntervalSince1970];
    NSTimeInterval maxSeconds = 24*60*60;
    int minus = (end_timesp - start_timesp);
    if (minus<=maxSeconds) {
        return YES;
    }else {
        return NO;
    }
}

+ (NSString*)getStartMinutes:(NSString*)dateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate* localDate = [formatter dateFromString:dateString];
    return [localDate formatWithStyle:@"HH:mm"];
}

+ (NSString*)getLeftTimeWithTime:(NSString*)dateString currentDate:(NSTimeInterval)time
{
    NSTimeInterval end_timesp = [[self getCurrentDateMinutes:dateString] timeIntervalSince1970];
    return [self fullUnitleftTime:(end_timesp-time)/60];
}

+ (NSString*)getLeftTime:(NSString*)dateString currentDateString:(NSString*)currentDateString
{
    NSTimeInterval end_timesp = [[self getCurrentDateMinutes:dateString] timeIntervalSince1970];
    NSTimeInterval current_end_timesp  = [[self getCurrentDateMinutes:currentDateString] timeIntervalSince1970];
    return [self fullUnitleftTime:(end_timesp-current_end_timesp)/60];
}

//是否倒计时已经结束
+ (BOOL)isNeedReloadData:(NSString*)dateString
{
    NSTimeInterval end_timesp = [[self getCurrentDateMinutes:dateString] timeIntervalSince1970];
    NSTimeInterval current_end_timesp  = [ [NSDate date] timeIntervalSince1970];
    if (end_timesp -current_end_timesp <=0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isNeedReloadData:(NSString *)dateString currentDateString:(NSTimeInterval)currentDateString
{
    if (dateString.length>0) {
        NSTimeInterval end_timesp = [[self getCurrentDateMinutes:dateString] timeIntervalSince1970];
        if (end_timesp -currentDateString <=0) {
            return YES;
        }
        return NO;
    }else {
        return NO;
    }
}

+ (NSDate*)getCurrentDateMinutes:(NSString*)dateString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    return  [formatter dateFromString:dateString];
}

+ (NSString *)getAmericanStyleTime:(NSDate *)date {
    if (!date) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    // US English Locale (en_US)
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    return [dateFormatter stringFromDate:date];
}


@end
