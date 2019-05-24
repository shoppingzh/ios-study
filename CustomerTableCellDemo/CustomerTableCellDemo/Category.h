//
//  Category.h
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Category : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger type; // 类型

- (instancetype) initWithName:(NSString*) name;
- (instancetype) initWithNameAndType:(NSString*) name type:(NSInteger) type;

@end

NS_ASSUME_NONNULL_END
