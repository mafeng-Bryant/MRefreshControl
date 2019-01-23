//
//  UIButton+TitleImageAdjust.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

@interface UIButton (TitleImageAdjust)

//调整为左标题，右图标
- (void)adjustTitleLeftAndImageRightStyle:(CGFloat)padding;

//左图标，右标题，调整间距
- (void)adjustNormalStylePadding:(CGFloat)padding;

//左对齐时调整图标和文本，图标位置不变，只调整文本的位置
- (void)alignLeadingAdjustNormalStylePadding:(CGFloat)padding;

//上图标，下标题
- (void)adjustTitleBottonAndImageTopStyle:(CGFloat)padding;

@end

