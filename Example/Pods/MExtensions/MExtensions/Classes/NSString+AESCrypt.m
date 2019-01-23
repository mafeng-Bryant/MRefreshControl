//
//  NSString+AESCrypt.m
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//

#import "NSString+AESCrypt.h"
#import "AESCrypt.h"
#import "NSString+Extensions.h"

//Aes加密的密钥,放到.m文件防止被反编译得出头文件
#define kMAesPassword   @"com.interfocusllc.patpat.aescrypt.ti370j54usju3x200x6094rkv4iv2f0c"

@implementation NSString (AESCrypt)

- (NSString *)pp_AESDecryptString
{
    return [AESCrypt decrypt:self password:[kMAesPassword toMD5]]; //根据password解密string信息
}

- (NSString *)pp_AESEncryptString
{
    return [AESCrypt encrypt:self password:[kMAesPassword toMD5]]; //用password加密string信息
}

- (NSString*)pp_AESDecryptString:(NSString*)value
{
    return [AESCrypt decrypt:self password:[value toMD5]]; //根据password解密string信息
    
}

- (NSString *)pp_AESEncryptString:(NSString*)value
{
    return [AESCrypt encrypt:self password:[value toMD5]]; //用password加密string信息
}

@end
