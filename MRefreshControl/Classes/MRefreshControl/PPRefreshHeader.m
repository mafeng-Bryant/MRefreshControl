//
//  PPRefreshHeader.m
//  PatPat
//
//  Created by Shawenlx on 2018/6/29.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import "PPRefreshHeader.h"
#import "UIView+Extensions.h"


@interface PPRefreshHeader()
@property (nonatomic, strong) UIImageView           *loadView;
@property (nonatomic, strong) UIImageView           *shadowView;
@property (nonatomic, strong) CABasicAnimation      *jumpAnimation;
@property (nonatomic, strong) CAKeyframeAnimation   *scaleXAnimation;
@property (nonatomic, strong) CAKeyframeAnimation   *scaleYAnimation;
@property (nonatomic, strong) CABasicAnimation      *shadowScaleAnimation;
@end

@implementation PPRefreshHeader
#pragma mark 初始化配置（添加子控件）
- (void)prepare {
    [super prepare];
    self.backgroundColor = [UIColor clearColor];
    self.mj_h = 60;
    [self addSubview:self.loadView];
    [self addSubview:self.shadowView];
}

#pragma mark 设置子控件的位置和尺寸
- (void)placeSubviews {
    [super placeSubviews];
    self.loadView.bounds = CGRectMake(0, 0, 28, 28);
    self.loadView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5+4);
    self.shadowView.bounds = CGRectMake(0, 0, 33, 8);
    self.shadowView.center = CGPointMake(self.mj_w * 0.5, CGRectGetMaxY(self.loadView.frame)+8);
}

#pragma mark - private methods
- (void)start {
    [self.loadView.layer addAnimation:self.jumpAnimation forKey:@"loadJumpAnimation"];
    [self.loadView.layer addAnimation:self.scaleXAnimation forKey:@"scaleXAnimation"];
    [self.loadView.layer addAnimation:self.scaleYAnimation forKey:@"scaleYAnimation"];
    [self.shadowView.layer addAnimation:self.shadowScaleAnimation forKey:@"shadowScaleAnimation"];
}

- (void)pause {
    [self.loadView.layer removeAllAnimations];
    [self.shadowView.layer removeAllAnimations];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    if (state == MJRefreshStateIdle) {
        [self pause];
    } else if (state == MJRefreshStateRefreshing) {
        [self start];
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    if (self.state != MJRefreshStateIdle) return;
    CGFloat interactive = 1 - pullingPercent / 5.0;
    self.loadView.transform = CGAffineTransformMakeScale(1.0 + (1.0 - interactive), interactive);
    self.loadView.y = 20 + (14 * pullingPercent);
    self.shadowView.transform = CGAffineTransformMakeScale(pullingPercent , pullingPercent);
}

#pragma mark - getter
- (UIImageView *)loadView {
    if (!_loadView) {
        _loadView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];
        _loadView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _loadView;
}

- (UIImageView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_shadow"]];
        _shadowView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _shadowView;
}

- (CABasicAnimation *)jumpAnimation {
    if (!_jumpAnimation) {
        _jumpAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
        _jumpAnimation.duration = 0.3;
        _jumpAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 40 - self.mj_h)];
        _jumpAnimation.cumulative = YES;
        _jumpAnimation.removedOnCompletion = NO;
        _jumpAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _jumpAnimation.repeatCount = INT_MAX;
        _jumpAnimation.autoreverses = YES;
        _jumpAnimation.fillMode = kCAFillModeForwards;
    }
    return _jumpAnimation;
}

- (CAKeyframeAnimation *)scaleXAnimation {
    if (!_scaleXAnimation) {
        _scaleXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        _scaleXAnimation.values = @[@1.1,@0.9,@1.1];
        _scaleXAnimation.keyTimes = @[@0.0,@0.5,@1.0];
        _scaleXAnimation.repeatCount = INT_MAX;
        _scaleXAnimation.removedOnCompletion = NO;
        _scaleXAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _scaleXAnimation.duration = 0.6;
    }
    return _scaleXAnimation;
}

- (CAKeyframeAnimation *)scaleYAnimation {
    if (!_scaleYAnimation) {
        _scaleYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
        _scaleYAnimation.values = @[@0.9,@1.1,@0.9];
        _scaleYAnimation.keyTimes = @[@0.0,@0.5,@1.0];
        _scaleYAnimation.repeatCount = MAXFLOAT;
        _scaleYAnimation.removedOnCompletion = NO;
        _scaleYAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _scaleYAnimation.duration = 0.6;
    }
    return _scaleYAnimation;
}

- (CABasicAnimation *)shadowScaleAnimation {
    if (!_shadowScaleAnimation) {
        _shadowScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        _shadowScaleAnimation.duration = 0.3;
        _shadowScaleAnimation.fromValue = @(1);
        _shadowScaleAnimation.toValue = @(0);
        _shadowScaleAnimation.removedOnCompletion = NO;
        _shadowScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _shadowScaleAnimation.repeatCount = INT_MAX;
        _shadowScaleAnimation.autoreverses = YES;
        _shadowScaleAnimation.fillMode = kCAFillModeForwards;
    }
    return _shadowScaleAnimation;
}
@end
