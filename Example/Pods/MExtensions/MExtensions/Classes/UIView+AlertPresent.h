//
//  UIView+AlertPresent.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AlertPresent)

/*
 *  以alertView的形式展示当前视图
 */
- (void)showWithAlertStyle;


/*
 *  收起以alertView形式展示的当前视图
 */
- (void)dismissAlertedSelf;


@end

NS_ASSUME_NONNULL_END
