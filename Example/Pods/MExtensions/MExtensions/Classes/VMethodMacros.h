//
//  VMethodMacros.h
//  MExtensions
//
//  Created by patpat on 2018/10/22.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#ifndef VMethodMacros_h
#define VMethodMacros_h

//obj是否是 Null 或 Nil
#define ISEMPTY(obj) ((NSNull *)obj == [NSNull null]|| obj == nil)?YES:NO

//obj是否是 Null
#define ISNULL(obj) ((NSNull *)obj == [NSNull null])?YES:NO

//obj是否是 nil
#define ISNIL(obj) (obj == nil)?YES:NO

//obj是否是Class类型
#define ISCLASS(Class,obj)[obj isKindOfClass:[Class class]]

//判断字符串是否合法
static inline BOOL isValidString(NSString *s)
{
    return (s && ISCLASS(NSString, s) && [s length]>0)?YES:NO;
}

//判断Number是否合法
static inline BOOL isValidNumber(id n)
{
    return (n && ISCLASS(NSNumber, n))?YES:NO;
}

//判断字典是否合法
static inline BOOL isValidDictionary(NSDictionary *d)
{
    return (d && ISCLASS(NSDictionary, d))?YES:NO;
}

//判断数组是否合法
static inline BOOL isValidArray(NSArray *a)
{
    return (a && ISCLASS(NSArray, a))?YES:NO;
}

//格式化Number
static inline NSNumber * FormatNumber(NSObject *obj,id replaceNumber)
{
    NSNumber *result = replaceNumber;
    if (obj && (isValidString((NSString *)obj) || isValidNumber(obj))){
        result =  @([(NSString *)obj integerValue]);
    }
    return result;
}

static inline BOOL isIPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    return iPhoneXSeries;
}


#endif /* VMethodMacros_h */
