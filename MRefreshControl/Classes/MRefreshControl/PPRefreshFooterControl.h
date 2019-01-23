//
//  PPRefreshFooterControl.h
//  PatPat
//
//  Created by Bruce He on 15/7/25.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPRefreshFooterControl : UIControl
{
    UIEdgeInsets _scrollViewInitInset;
    CGSize _lastContentSize;
    BOOL _isLoading;
}
@property(nonatomic, strong, readonly) UIScrollView *scrollView;
@property(nonatomic, strong, readonly) UILabel *titleLbl;               //文字
@property(nonatomic, strong, readonly) UIImageView *animationImageView; //加载时转动的菊花

//开始刷新
- (void)beginRefreshing;

//结束刷新
- (void)endRefreshing;

- (void)startAnimation;

@end
