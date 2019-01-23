//
//  NSString+ImageSize.m
//  MExtensions
//
//  Created by patpat on 2018/12/29.
//

#import "NSString+ImageSize.h"

static NSString * const MamazonS3Host = @"s3.us-west-2.amazonaws.com";

@implementation NSString (ImageSize)

- (NSString *)urlByAvatarImageSize:(AvatarImageSize)size {
    if (self.length<1) {
        return self;
    }
    if ([self rangeOfString:@".web"].location != NSNotFound || [self rangeOfString:MamazonS3Host].location == NSNotFound) {
        return self;
    }
    switch (size) {
        case AvatarImageSize1:
            return [self stringByAppendingString:@"/120x120"];
        case AvatarImageSize2:
            return [self stringByAppendingString:@"/240x240"];
        case AvatarImageSize3:
            return [self stringByAppendingString:@"/800x800"];
    }
    return self;
}

- (NSString *)urlByPercent:(ImagePercent)percent {
    if (self.length<1) {
        return self;
    }
    if ([self rangeOfString:@".web"].location != NSNotFound) {
        return self;
    }
    switch (percent) {
        case ImagePercent15:
            return [self stringByAppendingString:@"/15"];
        case ImagePercent25:
            return [self stringByAppendingString:@"/25"];
        case ImagePercent40:
            return [self stringByAppendingString:@"/40"];
        case ImagePercent60:
            return [self stringByAppendingString:@"/60"];
        case ImagePercent80:
            return [self stringByAppendingString:@"/80"];
        case ImagePercent100:
            return [self stringByAppendingString:@"/100"];
    }
    return self;
}

- (NSString *)urlByProductImageSize:(ProductImageSize)size
{
    if (self.length<1) {
        return self;
    }
    switch (size) {
        case ProductImageSize1:
            return [self stringByAppendingString:@"/120x120"];
        case ProductImageSize2:
            return [self stringByAppendingString:@"/350x350"];
        case ProductImageSize3:
            return [self stringByAppendingString:@"/600x600"];
        case ProductImageSize4:
            return [self stringByAppendingString:@"/950x950"];
        case ProductImageSize5:
            return [self stringByAppendingString:@"/220x220"];
        case ProductImageSize6:
            return [self stringByAppendingString:@"/64x64"];
        default:
            break;
    }
    return self;
}

- (NSString *)urlByEventImageSize:(EventImageSize)size
{
    if (self.length<1) {
        return self;
    }
    if ([self rangeOfString:@".gif"].location != NSNotFound) {
        return self;
    }
    switch (size) {
        case EventImageSize1:
            return [self stringByAppendingString:@"/346x260"];
        case EventImageSize2:
            return [self stringByAppendingString:@"/640x480"];
        case EventImageSize3:
            return [self stringByAppendingString:@"/710x532"];
        case EventImageSize4:
            return [self stringByAppendingString:@"/710x320"];
        case EventImageSize5:
            return [self stringByAppendingString:@"/750x340"];
        case EventImageSize6:
            return [self stringByAppendingString:@"/1242x563"];
        case EventImageSize7:
            return [self stringByAppendingString:@"/1242x662"];
        default:
            break;
    }
    return self;
}

- (NSString *)urlByReviewImageSize:(ReviewImageSize)size
{
    if (self.length<1) {
        return self;
    }
    switch (size) {
        case ReviewImageSize1:
            return [self stringByAppendingString:@"/150x150"];
        default:
            break;
    }
    return self;
}

- (NSString *)urlOrigin
{
    return [self stringByDeletingLastPathComponent];
}


@end
