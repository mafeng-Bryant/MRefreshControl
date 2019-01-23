//
//  PPUIFont+Extensions.m
//  PatPat
//
//  Created by Bruce He on 15/5/27.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPUIFont.h"

#define MFONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

@implementation UIFont(PP_FONT)

+ (NSString *)ppFontName
{
    return @"Avenir-Light";
}

+ (NSString *)ppFontRegularName
{
    return @"Avenir-Roman";
}

+ (NSString *)ppFontRegularItalicName
{
    return @"HelveticaNeue-Italic";
}

+ (NSString *)ppFontItalicName
{
    return @"HelveticaNeue-Italic";
}

+ (NSString *)ppFontBorderName
{
    return @"Avenir-Roman";
}

+ (NSString *)ppFontHeavyName
{
    return @"Avenir-Heavy";
}

+ (NSString *)ppFontObliqueName
{
    return @"Avenir-LightOblique";
}

+ (UIFont *)ppFont:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontName], fontSize);
}

+ (UIFont *)ppFontRegular:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontRegularName], fontSize);
}

+ (UIFont *)ppFontRegularItalic:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontRegularItalicName], fontSize);
}

+ (UIFont *)ppFontItalic:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontItalicName], fontSize);
    
}

+ (UIFont *)ppFontBorder:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontBorderName], fontSize);
}

+ (UIFont *)ppFontHeavy:(CGFloat)fontSize
{
    return MFONT([UIFont ppFontHeavyName], fontSize);
}

+ (UIFont*)ppFontOblique:(CGFloat)fonsize
{
   return  MFONT([UIFont ppFontObliqueName], fonsize);
    
}


@end
