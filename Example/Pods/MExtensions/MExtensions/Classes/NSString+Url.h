//
//  NSString+Url.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <Foundation/Foundation.h>

@interface NSString (Url)

/**
 *  从url中获取参数值
 *
 *  @param parameter 参数的key
 *
 *  @return 返回value
 */
- (NSString *)urlValueForParameter:(NSString *)parameter;


/**
 *  给url添加参数
 *
 *  @param key 参数的key
 *  @param value 参数的value
 *
 *  @return 返回新的url
 */
- (NSString *)addQueryKey:(NSString *)key value:(NSString *)value;

/**
 *  替换url中的参数
 *
 *  @param key 参数的key
 *  @param value 新的value
 *
 *  @return 返回新的url
 */
- (NSString *)replaceQueryKey:(NSString *)key value:(NSString *)value;

/**
 *  删除url中的参数
 *
 *  @param key 被删参数的key
 *
 *  @return 返回新的url
 */
- (NSString *)deleteQueryKey:(NSString *)key;


/**
 *  判断是不是空字符串，报告输入空格处理
 *
 *  @return Bool
 */
- (BOOL)isEmpty;

- (NSString*)addQueryKeys:(NSDictionary*)info;


//网页参数获取
- (NSString *)urlwebValueForParameter:(NSString *)parameter;

//编码
- (NSString*)stringByAddingPercentEscapesUsingEncoding;

//解码
- (NSString*)stringUrlDecode;

/**
 请求头countrycurrency字段专用unicode编码
 
 @return Unicode编码后的字符串
 */
- (NSString *)utf8ToUnicode;

@end

