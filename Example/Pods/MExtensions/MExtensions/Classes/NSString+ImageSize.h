//
//  NSString+ImageSize.h
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//
#import <Foundation/Foundation.h>

typedef enum {
    ImagePercent15 = 1, //15%
    ImagePercent25 = 2, //25%
    ImagePercent40 = 3, //40%
    ImagePercent60 = 4, //60%
    ImagePercent80 = 5, //80%
    ImagePercent100 = 6  //100%
}ImagePercent;

typedef enum {
    ProductImageSize1 = 1, //120x120
    ProductImageSize2 = 2, //350x350
    ProductImageSize3 = 3, //600x600
    ProductImageSize4 = 4, //950x950
    ProductImageSize5 = 5, //220x220
    ProductImageSize6 = 6 //64x64
}ProductImageSize;

typedef enum {
    AvatarImageSize1 = 1, //120x120
    AvatarImageSize2 = 2, //240x240
    AvatarImageSize3 = 3, //800x800
}AvatarImageSize;

typedef enum {
    EventImageSize1 = 1, //346x260
    EventImageSize2 = 2, //640x480
    EventImageSize3 = 3, //710x532
    EventImageSize4 = 4, //710x320
    EventImageSize5 = 5, //750x340
    EventImageSize6 = 6, //1242x563
    EventImageSize7 = 7, //1242x662
}EventImageSize;

typedef enum {
    ReviewImageSize1 = 1 //150x150
}ReviewImageSize;


@interface NSString (ImageSize)

/**
 *  产品图片的url
 *
 *  @param size 尺寸
 *
 *  @return 加了尺寸的url
 */
- (NSString *)urlByProductImageSize:(ProductImageSize)size;

/**
 *  event的图片url
 *
 *  @param size 尺寸
 *
 *  @return 加了尺寸的url
 */
- (NSString *)urlByEventImageSize:(EventImageSize)size;

/**
 *  review附件图片url
 *
 *  @param size 尺寸
 *
 *  @return 加了尺寸的url
 */
- (NSString *)urlByReviewImageSize:(ReviewImageSize)size;

/**
 *  原来的url
 *
 *  @return 去掉加的size
 */
- (NSString *)urlOrigin;

/**
 *  用户头像的图片url
 *
 *  @param size 尺寸
 *
 *  @return 加了尺寸的url
 */
- (NSString *)urlByAvatarImageSize:(AvatarImageSize)size;

/**
 *  按百分比获取图片url
 *
 *  @param percent 百分比
 *
 *  @return 加了百分比的url
 */
- (NSString *)urlByPercent:(ImagePercent)percent;

@end

