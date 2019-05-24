//
//  Goods.h
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface Goods : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray<Category*> *categories;

- (instancetype) initWithNameAndCategories:(NSString*) name categories:(NSArray*) categories;

@end

NS_ASSUME_NONNULL_END
