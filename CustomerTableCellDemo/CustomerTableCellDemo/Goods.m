//
//  Goods.m
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "Goods.h"

@implementation Goods

- (instancetype) initWithNameAndCategories:(NSString*) name categories:(NSArray*) categories{
    if(self = [super init]){
        _name = name;
        _categories = categories;
    }
    return self;
}

@end
