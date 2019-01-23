//
//  NSString+Url.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "NSString+Url.h"

@implementation NSString (Url)

- (NSString *)urlValueForParameter:(NSString *)parameter
{
    if (![parameter hasSuffix:@"="])
    {
        parameter = [NSString stringWithFormat:@"%@=", parameter];
    }
    NSString * str = nil;
    NSRange start = [self rangeOfString:parameter];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [self characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {
            if ([[parameter lowercaseString] isEqualToString:@"url="] ) {
                str = [self substringFromIndex:start.location+start.length];
            }else {
                // confirm that the parameter is not a partial name match
                unichar c = '?';
                if (start.location != 0)
                {
                    c = [self characterAtIndex:start.location - 1];
                }
                if (c == '?' || c == '&' || c == '#')
                {
                    NSRange end = [[self substringFromIndex:start.location+start.length] rangeOfString:@"&"];
                    NSUInteger offset = start.location+start.length;
                    str = (end.location == NSNotFound) ?([self substringFromIndex:offset]):([self substringWithRange:NSMakeRange(offset, end.location)]);
                    if ((![parameter isEqualToString:@"title="]) && (![parameter isEqualToString:@"error_info="]) && (![parameter isEqualToString:@"subject="]) && (![parameter isEqualToString:@"content="])) {
                        str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                    }
                }
            }
        }
    }
    return str;
}

- (NSString *)urlwebValueForParameter:(NSString *)parameter
{
    if (![parameter hasSuffix:@"="])
    {
        parameter = [NSString stringWithFormat:@"%@=", parameter];
    }
    
    NSString * str = nil;
    NSRange start = [self rangeOfString:parameter];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [self characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {
            // NSRange end = [[self substringFromIndex:start.location+start.length] rangeOfString:@"&"];
            NSUInteger offset = start.location+start.length;
            str = [self substringFromIndex:offset];
            //            str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return str;
}

- (NSString*)stringByAddingPercentEscapesUsingEncoding
{
    return  [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}


- (NSString*)stringUrlDecode
{
    NSString*input=self;
    NSMutableString*outputStr=[NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"%20"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,[outputStr length])];
    return [outputStr stringByAddingPercentEscapesUsingEncoding];
}

- (NSString *)addQueryKey:(NSString *)key value:(NSString *)value
{
    NSURLComponents *components = [[NSURLComponents alloc]initWithString:self];
    NSURLQueryItem * newQueryItem = [[NSURLQueryItem alloc] initWithName:key value:value];
    NSMutableArray * newQueryItems = [NSMutableArray arrayWithArray:components.queryItems];
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"name = %@",key];
    NSArray *result  = [newQueryItems filteredArrayUsingPredicate:bPredicate];
    if(result.count<1){
        [newQueryItems addObject:newQueryItem];
    }
    [components setQueryItems:newQueryItems];
    return  components.URL.absoluteString;
}

- (NSString*)addQueryKeys:(NSDictionary*)info
{
    NSArray* keys = [info allKeys];
    NSURLComponents *components = [[NSURLComponents alloc]initWithString:self];
    for (NSString* key in keys)
    {
        NSString* value = info[key];
        NSURLQueryItem * newQueryItem = [[NSURLQueryItem alloc] initWithName:key value:value];
        NSMutableArray * newQueryItems = [NSMutableArray arrayWithArray:components.queryItems];
        NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"name = %@",key];
        NSArray *result  = [newQueryItems filteredArrayUsingPredicate:bPredicate];
        if(result.count<1){
            [newQueryItems addObject:newQueryItem];
        }
        [components setQueryItems:newQueryItems];
    }
    return  components.URL.absoluteString;
}

- (NSString *)deleteQueryKey:(NSString *)key
{
    NSURLComponents *components = [[NSURLComponents alloc]initWithString:self];
    NSMutableArray * newQueryItems = [NSMutableArray arrayWithArray:components.queryItems];
    NSMutableArray *findResult = [NSMutableArray array];
    for (NSURLQueryItem *item in newQueryItems) {
        if([item.name isEqualToString:key]){
            [findResult addObject:item];
        }
    }
    [newQueryItems removeObjectsInArray:findResult];
    [components setQueryItems:newQueryItems];
    return  components.URL.absoluteString;
}

- (NSString *)replaceQueryKey:(NSString *)key value:(NSString *)value
{
    NSURLComponents *components = [[NSURLComponents alloc]initWithString:self];
    NSMutableArray * newQueryItems = [NSMutableArray arrayWithArray:components.queryItems];
    NSMutableArray *findResult = [NSMutableArray array];
    for (NSURLQueryItem *item in newQueryItems) {
        if([item.name isEqualToString:key]){
            [findResult addObject:item];
        }
    }
    [newQueryItems removeObjectsInArray:findResult];
    NSURLQueryItem * newQueryItem = [[NSURLQueryItem alloc] initWithName:key value:value];
    [newQueryItems addObject:newQueryItem];
    [components setQueryItems:newQueryItems];
    return  components.URL.absoluteString;
}

- (BOOL)isEmpty
{
    if (!self) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

- (NSString *)utf8ToUnicode {
    //将所有字符都转为\u开头的四位十六进制形式，不足位补0
    NSUInteger length = [self length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        [s appendFormat:@"\\u%x",[self characterAtIndex:i]];
        // 不足位数补0 否则解码不成功
        if(s.length == 4) {
            [s insertString:@"00" atIndex:2];
        } else if (s.length == 5) {
            [s insertString:@"0" atIndex:2];
        }
        [str appendFormat:@"%@", s];
    }
    return str;
}


@end
