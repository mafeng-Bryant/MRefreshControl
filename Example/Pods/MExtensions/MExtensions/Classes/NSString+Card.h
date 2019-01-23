//
//  NSString+Card.h
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//

#import <Foundation/Foundation.h>

@interface NSString (Card)

+ (BOOL)onlyDigitalWithString:(NSString *)string
                    inputChar:(NSString *)character
                    maxLength:(NSInteger)maxLength;

/**
 *  检测银行卡号
 *
 *  @return BOOL
 */
-(BOOL)isValidCardNumber;


//获取字符串数字的个数
-(NSInteger)countNumString;

//获取数字
- (NSArray*)getNums;


@end

