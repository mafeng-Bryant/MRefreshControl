//
//  UIView+PopAnimation.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "UIView+PopAnimation.h"
#import "VMacros.h"

@implementation UIView (PopAnimation)

- (void)scaleAnimationPop {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *bgView = [[UIView alloc] initWithFrame:window.bounds];
    bgView.backgroundColor = RGB(0, 0, 0, 0.3);
    [bgView addSubview:self];
    self.center = bgView.center;
    [window addSubview:bgView];
    [self showContent:self];
}

- (void)showContent:(UIView*)view {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.15;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
}

- (void)normalPresentWithNoBackground {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *bgView = [[UIView alloc] initWithFrame:window.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:self];
    self.center = bgView.center;
    [window addSubview:bgView];
}

- (void)normalPresentWithBackgroundColor:(UIColor *)bgColor {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *bgView = [[UIView alloc] initWithFrame:window.bounds];
    bgView.backgroundColor = bgColor;
    [bgView addSubview:self];
    self.center = bgView.center;
    [window addSubview:bgView];
}


@end
