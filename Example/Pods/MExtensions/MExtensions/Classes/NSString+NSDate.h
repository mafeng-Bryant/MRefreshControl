//
//  NSString+NSDate.h
//  PatPat
//
//  Created by patpat on 2019/1/10.
//  Copyright © 2019 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPLocalizedString.h"
#import "NSDate+Extensions.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSDate)


//根据minutes计算时间，现实剩余d,h,m
+ (NSString *)leftTime:(NSTimeInterval)minutes;

//根据minutes计算时间，现实剩余days,hours,mintues
+ (NSString *)fullUnitleftTime:(NSTimeInterval)minutes;

//计算compareDate时间和现在相差多久,精确到天
+ (NSString *)timeAgoWithDate:(NSDate *)date;

//计算compareDate时间和现在相差多久,精确到分钟
+ (NSString*)timeAgoWithMinuteDate:(NSDate*)date;

//设置日期的格式
+ (NSString *)formatDate:(NSDate *)confromTime dateStyle:(NSString *)dateStyle;

//获取当前时间与某一个时间的时间戳
+ (NSTimeInterval)getTimeSp:(NSString*)dateString;

//计算两个时间差的秒数
+ (NSTimeInterval)getTimeInterval:(NSString*)startDateString endDateString:(NSString*)endDateString;

//计算两个时间字符串格式相差的时间
+ (NSString*)getLeftTime:(NSString*)dateString currentDateString:(NSString*)currentDateString;

//获取当前字符串格式对应的date
+ (NSDate*)getCurrentDateMinutes:(NSString*)dateString;

//计算时间字符串格式与NSTimeInterval相差的时间
+ (NSString*)getLeftTimeWithTime:(NSString*)dateString currentDate:(NSTimeInterval)time;

//hour，minutes
+ (NSString*)getStartMinutes:(NSString*)dateString;

//确定是否显示倒计时
+ (BOOL)getTimerInfo:(NSString*)dateString;

//根据两个时间字符串，确定是否开始倒计时
+ (BOOL)isShowTime:(NSString*)nowDateString endDateString:(NSString*)endDateString;

//是否倒计时已经结束
+ (BOOL)isNeedReloadData:(NSString*)dateString;

//根据两个时间字符串判断倒计时是否结束
+ (BOOL)isNeedReloadData:(NSString *)dateString currentDateString:(NSTimeInterval)currentDateString;

//转换为美式风格的时间 May 1st,2019
+ (NSString *)getAmericanStyleTime:(NSDate *)date;


@end

NS_ASSUME_NONNULL_END
