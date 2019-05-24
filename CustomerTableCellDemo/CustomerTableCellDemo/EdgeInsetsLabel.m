//
//  EdgeInsetsLabel.m
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "EdgeInsetsLabel.h"

@implementation EdgeInsetsLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
