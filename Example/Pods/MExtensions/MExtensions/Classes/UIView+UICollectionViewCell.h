//
//  UIView+UICollectionViewCell.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

@interface UIView (UICollectionViewCell)

- (UICollectionViewCell *)getCollectionViewCell;

- (UIView *)getSuperViewWithClass:(Class)class;

- (void)addTapGestureWithTarget:(id)target
                         action:(SEL)action;

@end

