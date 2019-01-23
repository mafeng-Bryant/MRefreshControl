//
//  UIView+AlertPresent.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "UIView+AlertPresent.h"
#import "UIView+UICollectionViewCell.h"
#import <objc/runtime.h>

static char kSuperWindowKey;
static char kBlackViewKey;

@implementation UIView (AlertPresent)

- (void)showWithAlertStyle {
    self.superWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.superWindow.windowLevel = UIWindowLevelStatusBar;
    self.superWindow.backgroundColor = [UIColor clearColor];
    self.superWindow.hidden = NO;
    
    self.blackView = [[UIView alloc] initWithFrame:self.superWindow.bounds];
    self.blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    [self.blackView addTapGestureWithTarget:self action:@selector(dismissAlertedSelf)];
    
    [self.superWindow addSubview:self.blackView];
    [self.blackView addSubview:self];
    self.center = self.blackView.center;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1.0f;
    } completion:nil];
}

- (void)dismissAlertedSelf {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.blackView.alpha = 0.0f;
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.superWindow.hidden = YES;
        [self.blackView removeFromSuperview];
        [self removeFromSuperview];
    }];
}


- (UIWindow *)superWindow {
    return objc_getAssociatedObject(self, &kSuperWindowKey);
}

- (void)setSuperWindow:(UIWindow *)window {
    objc_setAssociatedObject(self, &kSuperWindowKey, window, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)blackView {
    return objc_getAssociatedObject(self, &kBlackViewKey);
}

- (void)setBlackView:(UIView *)blackView {
    objc_setAssociatedObject(self, &kBlackViewKey, blackView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
