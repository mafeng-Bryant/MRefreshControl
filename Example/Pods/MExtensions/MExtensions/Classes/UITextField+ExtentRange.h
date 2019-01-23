//
//  UITextField+ExtentRange.h
//  MAESCrypt
//
//  Created by patpat on 2018/12/29.
//

#import <UIKit/UIKit.h>

@interface UITextField (ExtentRange)

- (NSRange)selectedRange;
- (void) setSelectedRange:(NSRange)range;

@end

