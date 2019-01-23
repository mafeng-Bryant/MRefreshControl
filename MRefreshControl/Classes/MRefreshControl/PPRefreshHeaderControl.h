//
//  PPRefreshHeaderControl.h
//  PatPat
//
//  Created by Bruce He on 15/7/25.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//
#import <UIKit/UIKit.h>
@class PPRefreshHeaderControl;

enum PPHeaderViewStatus
{
    PPHeaderViewStatusBeginDrag, //拖拽读取更多
    PPHeaderViewStatusDragging,  //松开读取更多
    PPHeaderViewStatusLoading,   //正在读取
};

typedef enum PPHeaderViewStatus PPHeaderViewStatus;

@interface PPRefreshHeaderControl : UIControl

@property(nonatomic,assign) PPHeaderViewStatus status;
@property(nonatomic,strong) UIImageView *loadingImageView;
@property(nonatomic,strong) UIImageView *loadingShadowImageView;
@property(nonatomic)BOOL isRefreshing;

//开始刷新
- (void)beginRefreshing;

//结束刷新
- (void)endRefreshing;

//立即结束刷新
- (void)quickEndRefreshing;


@end
