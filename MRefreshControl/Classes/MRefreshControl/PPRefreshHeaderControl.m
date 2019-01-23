//
//  PPRefreshHeaderControl.m
//  PatPat
//
//  Created by Bruce He on 15/7/25.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPRefreshHeaderControl.h"
#import "UIView+Extensions.h"

static CGFloat const   kAnimateWithDuration     = 0.2;

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define kImageViewOrginY  30.0f
#define kImageViewWidth 28
#define kImageViewHeight 28
#define kOrginY  self.height- 40
#define kHeaderHeight 60

@interface PPRefreshHeaderControl()

@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation PPRefreshHeaderControl

#pragma mark cycle methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initConfigure];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfigure];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initConfigure];
    }
    return self;
}

- (void)didMoveToSuperview {
    self.scrollView = (UIScrollView *)self.superview;
}

#pragma mark Private methods
- (void)setStatus:(enum PPHeaderViewStatus)status {
    _status = status;
    switch (status) {
        case PPHeaderViewStatusBeginDrag:
            self.isRefreshing = NO;
            break;
        case PPHeaderViewStatusDragging:
            self.isRefreshing = YES;
            break;
        case PPHeaderViewStatusLoading:
            [self startLoadingAnimation];
            self.isRefreshing = YES;
            break;
            
        default:
            break;
    }
}

- (void)startLoadingAnimation {
    self.loadingImageView.y = kOrginY + 12;
    CABasicAnimation *jumpAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    jumpAnimation.duration = 0.3;
    CGFloat width = self.loadingImageView.frame.size.width;
    jumpAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, width - kHeaderHeight)];
    jumpAnimation.cumulative = YES;
    jumpAnimation.removedOnCompletion = NO;
    jumpAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    jumpAnimation.repeatCount = HUGE_VALF;
    jumpAnimation.autoreverses = YES;
    jumpAnimation.fillMode = kCAFillModeForwards;
    [self.loadingImageView.layer addAnimation:jumpAnimation forKey:@"transform.translation"];
    
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.values = @[@1.1,@0.9,@1.1];
    scaleX.keyTimes = @[@0.0,@0.5,@1.0];
    scaleX.repeatCount = MAXFLOAT;
    scaleX.removedOnCompletion = NO;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scaleX.duration = 0.6;
    
    [self.loadingImageView.layer addAnimation:scaleX forKey:@"scaleXAnimation"];
    
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.values = @[@0.9,@1.1,@0.9];
    scaleY.keyTimes = @[@0.0,@0.5,@1.0];
    scaleY.repeatCount = MAXFLOAT;
    scaleY.removedOnCompletion = NO;
    scaleY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scaleY.duration = 0.6;
    [self.loadingImageView.layer addAnimation:scaleY forKey:@"scaleYAnimation"];
    
    CABasicAnimation *shadowScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shadowScale.duration = 0.3;
    shadowScale.fromValue = @(1);
    shadowScale.toValue = @(0);
    shadowScale.removedOnCompletion = NO;
    shadowScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    shadowScale.repeatCount = HUGE_VALF;
    shadowScale.autoreverses = YES;
    shadowScale.fillMode = kCAFillModeForwards;
    [self.loadingShadowImageView.layer addAnimation:shadowScale forKey:@"transform.scale"];
    
}

- (void)initConfigure {
    [self addSubview:self.loadingShadowImageView];
    [self addSubview:self.loadingImageView];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (UIImageView *)loadingImageView {
    if (!_loadingImageView) {
        _loadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-kImageViewWidth/2, kOrginY, kImageViewWidth, kImageViewHeight)];
        _loadingImageView.image = [UIImage imageNamed:@"loading"];
    }
    return _loadingImageView;
}
- (UIImageView *)loadingShadowImageView {
    if (!_loadingShadowImageView) {
        _loadingShadowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-33/2, kOrginY+kImageViewWidth + 4, 33, 8)];
        _loadingShadowImageView.image = [UIImage imageNamed:@"loading_shadow"];
        _loadingShadowImageView.transform = CGAffineTransformMakeScale(0.0 , 0.0);
    }
    return _loadingShadowImageView;
}

- (void)setScrollView:(UIScrollView *)scrollView {
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    if (@available(iOS 11.0, *)) {
        _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (self.status == PPHeaderViewStatusLoading) return;
    [self willMoveToSuperview:self.scrollView];
    if (self.scrollView.isDragging) {
        CGFloat maxY = - kHeaderHeight;
        if (_scrollView.contentOffset.y >= maxY && _scrollView.contentOffset.y < maxY + kHeaderHeight) {
            CGFloat interactive = 1 - (_scrollView.contentOffset.y/-kHeaderHeight/5);
            self.loadingImageView.transform = CGAffineTransformMakeScale(1.0 + (1.0 - interactive), interactive);
            CGFloat shadowInteractive = _scrollView.contentOffset.y/-kHeaderHeight;
            self.loadingImageView.y = kOrginY + (12*shadowInteractive);
            self.loadingShadowImageView.transform = CGAffineTransformMakeScale(shadowInteractive , shadowInteractive);
            [self setStatus:PPHeaderViewStatusBeginDrag];
        } else if (_scrollView.contentOffset.y < maxY + kHeaderHeight) {
            [self setStatus:PPHeaderViewStatusDragging];
        }
    }else{
        if (self.status == PPHeaderViewStatusDragging) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:kAnimateWithDuration animations:^{
                    self->_scrollView.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
                }];
            });
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            [self setStatus:PPHeaderViewStatusLoading];
        } else {
            [self restoreBegin];
        }
    }
}

//开始刷新
- (void)beginRefreshing
{
    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        self->_scrollView.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
    }completion:^(BOOL finished) {
        [self startLoadingAnimation];
    }];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
//结束刷新
- (void)endRefreshing
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.loadingImageView.alpha = 0.99;
        [UIView animateWithDuration:0.3 animations:^{
            self.loadingImageView.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:kAnimateWithDuration animations:^{
                self->_scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            }completion:^(BOOL finished) {
                [self restoreBegin];
            }];
        }];
        
    });
}

//结束刷新
- (void)quickEndRefreshing
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.loadingImageView.alpha = 1;
        self->_scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self restoreBegin];
    });
}

- (void)restoreBegin {
    [self.loadingImageView.layer removeAllAnimations];
    [self.loadingShadowImageView.layer removeAllAnimations];
    [self setStatus:PPHeaderViewStatusBeginDrag];
    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        self.loadingShadowImageView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        self.loadingImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.loadingImageView.y = kOrginY;
    }];
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
