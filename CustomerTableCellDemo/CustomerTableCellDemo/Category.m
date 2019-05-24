//
//  Category.m
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "Category.h"

@implementation Category

- (instancetype) initWithName:(NSString*) name{
    if(self = [super init]){
        _name = name;
    }
    return self;
}

- (instancetype) initWithNameAndType:(NSString*) name type:(NSInteger) type{
    if(self = [super init]){
        _name = name;
        _type = type;
    }
    return self;
}

@end
