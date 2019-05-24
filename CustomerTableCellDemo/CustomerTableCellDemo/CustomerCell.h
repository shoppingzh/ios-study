//
//  CustomerCell.h
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomerCell : UITableViewCell

@property (strong, nonatomic) Goods *goods;

@end

NS_ASSUME_NONNULL_END
