//
//  UIButton+TitleImageAdjust.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "UIButton+TitleImageAdjust.h"
#import "UIView+Extensions.h"

@implementation UIButton (TitleImageAdjust)

//调整为左标题，右图标
- (void)adjustTitleLeftAndImageRightStyle:(CGFloat)padding {
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.frame)-padding, 0, CGRectGetWidth(self.imageView.frame)+padding)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, CGRectGetWidth(self.titleLabel.frame)+padding, 0, -CGRectGetWidth(self.titleLabel.frame)-padding)];
}

//左图标，右标题，调整间距
- (void)adjustNormalStylePadding:(CGFloat)padding {
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -padding/2.0, 0, padding/2.0)];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, padding/2.0, 0, -padding/2.0)];
}

//左对齐时调整图标和文本，图标位置不变，只调整文本的位置
- (void)alignLeadingAdjustNormalStylePadding:(CGFloat)padding {
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, padding, 0, -padding)];
}

//图标在上，文字在下
- (void)adjustTitleBottonAndImageTopStyle:(CGFloat)padding {
    CGSize imageSize = self.imageView.size;
    CGSize titleSize = self.titleLabel.size;
    CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
    [self setImageEdgeInsets:UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0)];
}

@end
