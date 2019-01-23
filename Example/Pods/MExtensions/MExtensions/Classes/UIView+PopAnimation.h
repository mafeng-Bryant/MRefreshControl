//
//  UIView+PopAnimation.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

@interface UIView (PopAnimation)

//带缩放动画弹出
- (void)scaleAnimationPop;

//普通展示，不带背景色
- (void)normalPresentWithNoBackground;

//普通展示，传入背景色
- (void)normalPresentWithBackgroundColor:(UIColor *)bgColor;


@end

