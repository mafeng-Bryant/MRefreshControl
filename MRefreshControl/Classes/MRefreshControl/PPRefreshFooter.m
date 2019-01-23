//
//  PPRefreshFooter.m
//  PatPat
//
//  Created by Shawenlx on 2018/6/29.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import "PPRefreshFooter.h"
#import "PPLocalizedString.h"
#import "PPLoginLocalizedString.h"
#import "PPUIFont.h"

@interface PPRefreshFooter()
@property (nonatomic, strong) UIImageView           *loadView;
@property (nonatomic, strong) UILabel               *titleLabel;
@property (nonatomic, strong) CABasicAnimation      *rotationAnimation;
@end

@implementation PPRefreshFooter
#pragma mark 初始化配置（添加子控件）
- (void)prepare {
    [super prepare];
    self.backgroundColor = [UIColor clearColor];
    self.mj_h = 50;
    [self addSubview:self.loadView];
    [self addSubview:self.titleLabel];
}

#pragma mark 设置子控件的位置和尺寸
- (void)placeSubviews {
    [super placeSubviews];
    self.titleLabel.center = CGPointMake(self.mj_w * 0.5 + 20, self.mj_h * 0.5);
    self.loadView.bounds = CGRectMake(0, 0, 20, 20);
    self.loadView.center = CGPointMake(CGRectGetMinX(self.titleLabel.frame)-20, self.mj_h * 0.5);
}

#pragma mark - private methods
- (void)start {
    if (self.hidden) {
        return ;
    }
    self.loadView.hidden = NO;
    self.titleLabel.hidden = NO;
    [self.loadView.layer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
}

- (void)pause {
    self.loadView.hidden = YES;
    self.titleLabel.hidden = YES;
    [self.loadView.layer removeAllAnimations];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    if (state == MJRefreshStateRefreshing) {
        [self start];
    } else if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self pause];
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    if (self.state != MJRefreshStateIdle) return;
    self.loadView.transform = CGAffineTransformMakeRotation(M_PI * -2.0 * pullingPercent);
}

#pragma mark - getter
- (UIImageView *)loadView {
    if (!_loadView) {
        _loadView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_gray"]];
        _loadView.contentMode = UIViewContentModeScaleAspectFill;
        _loadView.hidden = YES;
    }
    return _loadView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.text = PPString(PRODUCT_REVIEWLOADINGMORE);
        _titleLabel.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1.0];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = PPF2;
        [_titleLabel sizeToFit];
        _titleLabel.hidden = YES;
    }
    return _titleLabel;
}

- (CABasicAnimation *)rotationAnimation {
    if (!_rotationAnimation) {
        _rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        _rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * -2.0];
        _rotationAnimation.duration = 1;
        _rotationAnimation.cumulative = YES;
        _rotationAnimation.repeatCount = INT_MAX;;
        _rotationAnimation.removedOnCompletion = NO;
    }
    return _rotationAnimation;
}
@end
