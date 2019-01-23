//
//  UIView+UICollectionViewCell.m
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import "UIView+UICollectionViewCell.h"

@implementation UIView (UICollectionViewCell)

- (UIView *)getSuperViewWithClass:(Class)class
{
    UIView *cell = nil;
    UIView *view = self;
    while(view != nil) {
        if([view isKindOfClass:class]) {
            cell = view;
            break;
        }
        view = [view superview];
    }
    return cell;
}

- (UICollectionViewCell *)getCollectionViewCell
{
    return (UICollectionViewCell *)[self getSuperViewWithClass:[UICollectionViewCell class]];
}

- (void)addTapGestureWithTarget:(id)target
                         action:(SEL)action{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target
                                                                                 action:action];
    tapGesture.cancelsTouchesInView = YES;
    tapGesture.delegate = target;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapGesture];
}

@end
