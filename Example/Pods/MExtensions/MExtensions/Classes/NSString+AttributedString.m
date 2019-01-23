//
//  NSString+AttributedString.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "NSString+AttributedString.h"
#import "PPUIFont.h"
#import "VMacros.h"

@implementation NSString (AttributedString)

- (NSMutableAttributedString *)defaultAttributedStyle {
    NSMutableAttributedString * resultString = [[NSMutableAttributedString alloc] initWithString:self attributes: @ {NSStrikethroughStyleAttributeName: @(NSUnderlineStyleNone)}];
    NSDictionary *originPriceAttributes = @{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:PPC4,NSForegroundColorAttributeName:PPC4,NSFontAttributeName:PPF1};
    [resultString addAttributes:originPriceAttributes range:[self rangeOfString:self]];
    return resultString;
}

@end
