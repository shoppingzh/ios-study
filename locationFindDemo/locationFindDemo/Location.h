//
//  Location.h
//  locationFindDemo
//
//  Created by xpzheng on 2019/9/27.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

@property (copy, nonatomic, readonly, nullable) NSString *country;
@property (copy, nonatomic, readonly, nullable) NSString *province;
@property (copy, nonatomic, readonly, nullable) NSString *city;
@property (copy, nonatomic, readonly, nullable) NSString *area;
@property (copy, nonatomic, readonly, nullable) NSString *subArea;
@property (copy, nonatomic, readonly, nullable) NSString *street;
@property (copy, nonatomic, readonly, nullable) NSString *name;

+ (instancetype) locationWithPlacemark: (CLPlacemark*) placemark;

@end

NS_ASSUME_NONNULL_END
