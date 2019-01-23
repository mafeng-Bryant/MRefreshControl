//
//  UIViewController+Extension.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

- (void)setLeftItemImage:(NSString *)imageName;

-(void)leftItemClickAction:(UIButton *)btn;

- (void)setRightItemImage:(NSString *)imageName;

-(void)rightItemClickAction:(UIButton *)btn;

-(void)setTitle:(NSString *)title backButton:(BOOL)showBackButton;

- (void)setTitleView:(NSString *)title;

-(void)back:(UIButton *)btn;

@end

