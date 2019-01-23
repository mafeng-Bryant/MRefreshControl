//
//  NSDictionary+Extensions.m
//  MExtensions
//
//  Created by patpat on 2018/12/28.
//

#import "NSDictionary+Extensions.h"

@implementation NSDictionary (Extensions)

- (BOOL)isContainKey:(NSString*)key
{
    if ([[self allKeys] containsObject:key]) {
        return YES;
    }
    return NO;
}

- (BOOL)writeToFile:(NSString *)path{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [data writeToFile:path
                  atomically:YES];
}

+(NSArray*)readFile:(NSString*)path{
    NSData * data = [NSData dataWithContentsOfFile:path];
    return  [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
