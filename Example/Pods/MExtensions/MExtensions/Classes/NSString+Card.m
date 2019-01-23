//
//  NSString+Card.m
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//

#import "NSString+Card.h"
#import "NSString+Extensions.h"

@implementation NSString (Card)

+ (BOOL)onlyDigitalWithString:(NSString *)string
                    inputChar:(NSString *)character
                    maxLength:(NSInteger)maxLength
{
    if (character.length!=0){
        NSString *txt = [string trimmingWhiteSpaceCharacter];
        txt = [txt stringByReplacingOccurrencesOfString:@" " withString:@""];
        txt = [txt stringByReplacingOccurrencesOfString:@"/" withString:@""];
        if ([txt length]>0 && txt.length+character.length>maxLength){
            return NO;
        }
        return [character isOnlyDigital];
    }
    return NO;
}

//剔除卡号里的非法字符
-(NSString *)getDigitsOnly
{
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++)
    {
        c = [self characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    return digitsOnly;
}

//检查银行卡是否合法
//Luhn算法
-(BOOL)isValidCardNumber
{
    NSString *digitsOnly = [self getDigitsOnly];
    NSInteger sum = 0;
    NSInteger digit = 0;
    NSInteger addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

-(NSInteger)countNumString
{
    NSInteger count = 0;
    for (int i=0; i<self.length; i++) {
        unichar ch = [self characterAtIndex:i];//characterAtIndex可以用来取得字符串对应位置的字符
        if (ch>='0'&&ch<='9') {
            count++;//统计个数
        }
    }
    return count;
}

- (NSArray*)getNums
{
    NSMutableArray* datas = [NSMutableArray array];
    for (int i=0; i<self.length; i++) {
        const  unichar ch = [self characterAtIndex:i];//characterAtIndex可以用来取得字符串对应位置的字符
        if (ch>='0'&&ch<='9') {
            NSString* value = [NSString stringWithCharacters:&ch length:1];
            [datas addObject:value];
        }
    }
    return datas;
}

@end
