//
//  NSDictionary+Extensions.h
//  MExtensions
//
//  Created by patpat on 2018/12/28.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extensions)

- (BOOL)isContainKey:(NSString*)key;

- (BOOL)writeToFile:(NSString *)path;

+(NSDictionary*)readFile:(NSString*)path;

@end

