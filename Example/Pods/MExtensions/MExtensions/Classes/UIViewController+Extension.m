//
//  UIViewController+Extension.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "UIViewController+Extension.h"
#import "UIView+Extensions.h"

@implementation UIViewController (Extension)


- (void)setLeftItemImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *leftBtn = [UIButton createButton:CGRectMake(0,0,44,44) action:@selector(leftItemClickAction:) delegate:self normalImage:image highlightedImage:image];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}

-(void)leftItemClickAction:(UIButton *)btn
{
    
}

- (void)setRightItemImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *rightBtn = [UIButton createButton:CGRectMake(0,0,44,44) action:@selector(rightItemClickAction:) delegate:self normalImage:image highlightedImage:image];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

-(void)rightItemClickAction:(UIButton *)btn
{
    
}

-(void)setTitle:(NSString *)title backButton:(BOOL)showBackButton
{
    self.navigationItem.backBarButtonItem = nil;
    if (showBackButton){
        self.navigationItem.leftBarButtonItem.title = @"";
        UIButton *leftBtn = [UIButton createButton:CGRectMake(0,0,44,44) action:@selector(back:) delegate:self normalImage:[UIImage imageNamed:@"nav_back"] highlightedImage:[UIImage imageNamed:@"nav_back"]];
        [leftBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        self.navigationItem.leftBarButtonItem = leftItem;
    }else{
        self.navigationItem.hidesBackButton = YES;
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    }
        
    //Create title label
    if (title && [title isKindOfClass:[NSString class]] && [title length]>0){
        UILabel *titleLbl = [UILabel createLable:CGRectMake(0, 0, 190, 44)];
        [titleLbl setTextAlignment:NSTextAlignmentCenter];
        titleLbl.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1.0];
        titleLbl.text = title;
        titleLbl.font = [UIFont fontWithName:@"Avenir-Roman" size:14];
        titleLbl.backgroundColor = [UIColor clearColor];
        self.navigationItem.titleView = titleLbl;
    }
}

- (void)setTitleView:(NSString *)title
{
    UILabel *titleLbl = [UILabel createLable:CGRectMake(0, 0, 190, 44)];
    [titleLbl setTextAlignment:NSTextAlignmentCenter];
    titleLbl.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1.0];;
    titleLbl.text = title;
    titleLbl.font = [UIFont fontWithName:@"Avenir-Roman" size:14];
    titleLbl.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleLbl;
}

-(void)back:(UIButton *)btn
{
    btn.userInteractionEnabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
