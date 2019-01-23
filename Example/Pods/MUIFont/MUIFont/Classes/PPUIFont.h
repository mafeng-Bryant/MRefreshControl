//
//  PPUIFont+Extensions.h
//  PatPat
//
//  Created by Bruce He on 15/5/27.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//normal app all font size
typedef enum {
    FontSize9  = 9,
    FontSize10 = 10,
    FontSize11 = 11,
    FontSize12 = 12,
    FontSize13 = 13,
    FontSize14 = 14,
    FontSize15 = 15,
    FontSize16 = 16,
    FontSize17 = 17,
    FontSize18 = 18,
    FontSize20 = 20,
    FontSize21 = 21,
    FontSize22 = 22,
    FontSize24 = 24,
    FontSize26 = 26,
    FontSize27 = 27,
    FontSize28 = 28,
    FontSize29 = 29,
    FontSize30 = 30,
    FontSize31 = 31,
    FontSize32 = 32,
    FontSize34 = 34,
    FontSize36 = 36,
    FontSize38 = 38,
    FontSize40 = 40,
    FontSize44 = 44,
    FontSize50 = 50,
    FontSize60 = 60
}FontSize;

//PatPat App字号
typedef enum {
    PPFontSize0 = FontSize9,
    PPFontSize00 = FontSize10,
    PPFontSize01 = FontSize11,
    PPFontSize1 = FontSize12,
    PPFontSize1b = FontSize13,
    PPFontSize2 = FontSize14,
    PPFontSize2_1 = FontSize15,
    PPFontSize3 = FontSize16,
    PPFontSize4 = FontSize18,
    PPFontSize4b = FontSize20,
    PPFontSize5 = FontSize21,
    PPFontSize6 = FontSize24,
    PPFontSize7 = FontSize27,
    PPFontSize8 = FontSize31,
    PPFontSize9 = FontSize29,
    PPFontSize10 = FontSize30,
    PPFontSize18 = FontSize36,
    PPFontSize20 = FontSize40,
    PPFontSize22 = FontSize44,
    PPFontSize25 = FontSize50,
    PPFontSize30 = FontSize60
}PPFontSize;

//PatPat app f1-f8 font


#define PPF0        PPFont(PPFontSize0)
#define PPF0Border  PPFontBorder(PPFontSize0)
#define PPF0Italic  PPFontItalic(PPFontSize0)
#define PPF0Regular PPFontRegular(PPFontSize0)

#define PPF00        PPFont(PPFontSize00)
#define PPF00Border  PPFontBorder(PPFontSize00)
#define PPF00Italic  PPFontItalic(PPFontSize00)
#define PPF00Regular PPFontRegular(PPFontSize00)

#define PPF01        PPFont(PPFontSize01)
#define PPF01Border  PPFontBorder(PPFontSize01)
#define PPF01Italic  PPFontItalic(PPFontSize01)
#define PPF01Regular PPFontRegular(PPFontSize01)


#define PPF1        PPFont(PPFontSize1)
#define PPF1Border  PPFontBorder(PPFontSize1)
#define PPF1Italic  PPFontItalic(PPFontSize1)
#define PPF1Regular PPFontRegular(PPFontSize1)

#define PPF1b        PPFont(PPFontSize1b)
#define PPF1bBorder  PPFontBorder(PPFontSize1b)
#define PPF1bItalic  PPFontItalic(PPFontSize1b)
#define PPF1bRegular PPFontRegular(PPFontSize1b)
#define PPF1Heavly   PPFontHeavy(PPFontSize1b)


#define PPF2        PPFont(PPFontSize2)
#define PPF2Border  PPFontBorder(PPFontSize2)
#define PPF2Italic  PPFontItalic(PPFontSize2)
#define PPF2Regular PPFontRegular(PPFontSize2)
#define PPF2LightOblique PPFontLightOblique(PPFontSize2)

#define PPF2_1        PPFont(PPFontSize2_1)
#define PPF2_1Border  PPFontBorder(PPFontSize2_1)
#define PPF2_1Italic  PPFontItalic(PPFontSize2_1)
#define PPF2_1Regular PPFontRegular(PPFontSize2_1)

#define PPF3        PPFont(PPFontSize3)
#define PPF3Border  PPFontBorder(PPFontSize3)
#define PPF3Italic  PPFontItalic(PPFontSize3)
#define PPF3Regular PPFontRegular(PPFontSize3)

#define PPF4        PPFont(PPFontSize4)
#define PPF4Border  PPFontBorder(PPFontSize4)
#define PPF4Italic  PPFontItalic(PPFontSize4)
#define PPF4Regular PPFontRegular(PPFontSize4)
#define PPF4Heavly  PPFontHeavy(PPFontSize4)

#define PPF4b        PPFont(PPFontSize4b)
#define PPF4bBorder  PPFontBorder(PPFontSize4b)
#define PPF4bItalic  PPFontItalic(PPFontSize4b)
#define PPF4bRegular PPFontRegular(PPFontSize4b)
#define PPF4bHeavly  PPFontHeavy(PPFontSize4b)


#define PPF5        PPFont(PPFontSize5)
#define PPF5Border  PPFontBorder(PPFontSize5)
#define PPF5Italic  PPFontItalic(PPFontSize5)
#define PPF5Regular PPFontRegular(PPFontSize5)

#define PPF6        PPFont(PPFontSize6)
#define PPF6Border  PPFontBorder(PPFontSize6)
#define PPF6Italic  PPFontItalic(PPFontSize6)
#define PPF6Regular PPFontRegular(PPFontSize6)

#define PPF7        PPFont(PPFontSize7)
#define PPF7Border  PPFontBorder(PPFontSize7)
#define PPF7Italic  PPFontItalic(PPFontSize7)
#define PPF7Regular PPFontRegular(PPFontSize7)

#define PPF8        PPFont(PPFontSize8)
#define PPF8Border  PPFontBorder(PPFontSize8)
#define PPF8Italic  PPFontItalic(PPFontSize8)
#define PPF8Regular PPFontRegular(PPFontSize8)

#define PPF9        PPFont(PPFontSize9)
#define PPF9Border  PPFontBorder(PPFontSize9)
#define PPF9Italic  PPFontItalic(PPFontSize9)
#define PPF9Regular PPFontRegular(PPFontSize9)


#define PPF10        PPFont(PPFontSize10)
#define PPF10Border  PPFontBorder(PPFontSize10)
#define PPF10Italic  PPFontItalic(PPFontSize10)
#define PPF10Regular PPFontRegular(PPFontSize10)

#define PPF18        PPFont(PPFontSize18)
#define PPF18Border  PPFontBorder(PPFontSize18)
#define PPF18Italic  PPFontItalic(PPFontSize18)
#define PPF18Regular PPFontRegular(PPFontSize18)

#define PPF20Heavly  PPFontHeavy(PPFontSize4b)

#define PPF44        PPFont(PPFontSize22)
#define PPF44Border  PPFontBorder(PPFontSize22)
#define PPF44Italic  PPFontItalic(PPFontSize22)
#define PPF44Regular PPFontRegular(PPFontSize22)

#define PPF25        PPFont(PPFontSize25)
#define PPF25Border  PPFontBorder(PPFontSize25)
#define PPF25Italic  PPFontItalic(PPFontSize25)
#define PPF25Regular PPFontRegular(PPFontSize25)
#define PPF25Heavly  PPFontHeavy(PPFontSize25)

#define PPF30Heavly  PPFontHeavy(PPFontSize10)



//PatPat app color
#define PPC0 [UIColor clearColor]
#define PPC1 RGB(241,67,90,1.0)
#define PPC2 RGB(70,186,151,1.0)
#define PPC3 RGB(68,68,68,1.0)
#define PPC4 RGB(155,165,167,1.0)
#define PPC5 RGB(205,210,211,1.0)
#define PPC6 RGB(241,243,242,1.0)
#define PPC7 RGB(255,255,255,1.0)
#define PPC8 RGB(248,124,135,1.0)
#define PPC9 RGB(249,251,252,1.0)
#define PPC10 RGB(252,252,252,1.0)
#define PPC11 RGB(67,147,241,1.0)
#define PPC12 RGB(250,250,250,1.0)


//UIFont extension
@interface UIFont(PP_FONT)

+ (NSString *)ppFontName;

+ (NSString *)ppFontRegularName;

+ (NSString *)ppFontItalicName;

+ (NSString *)ppFontBorderName;

+ (NSString *)ppFontHeavyName;

+ (NSString *)ppFontObliqueName;

+ (NSString *)ppFontRegularItalicName;

+ (UIFont *)ppFont:(CGFloat)fontSize;

+ (UIFont *)ppFontRegular:(CGFloat)fontSize;

+ (UIFont *)ppFontRegularItalic:(CGFloat)fontSize;

+ (UIFont *)ppFontItalic:(CGFloat)fontSize;

+ (UIFont *)ppFontBorder:(CGFloat)fontSize;

+ (UIFont *)ppFontHeavy:(CGFloat)fontSize;

+ (UIFont*)ppFontOblique:(CGFloat)fontSize;

@end

static inline UIFont* PPFont(CGFloat size)
{
    return [UIFont ppFont:size];
}

static inline UIFont* PPFontRegular(CGFloat size)
{
    return [UIFont ppFontRegular:size];
}

static inline UIFont* PPFontBorder(CGFloat size)
{
    return [UIFont ppFontBorder:size];
}

static inline UIFont* PPFontItalic(CGFloat size)
{
    return [UIFont ppFontItalic:size];
}

static inline UIFont* PPFontHeavy(CGFloat size)
{
    return [UIFont ppFontHeavy:size];
    
}

static inline UIFont* PPFontLightOblique(CGFloat size)
{
    return [UIFont ppFontOblique:size];
    
}



