//
//  NSString+AESCrypt.h
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//

#import <Foundation/Foundation.h>

@interface NSString (AESCrypt)

- (NSString *)pp_AESDecryptString;
- (NSString *)pp_AESEncryptString;
- (NSString*)pp_AESDecryptString:(NSString*)value;
- (NSString *)pp_AESEncryptString:(NSString*)value;

@end

