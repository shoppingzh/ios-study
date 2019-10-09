//
//  Location.m
//  locationFindDemo
//
//  Created by xpzheng on 2019/9/27.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype) initWithPlacemark:(CLPlacemark*) placemark{
    if(self = [super init]){
        _country = placemark.country;
        _province = placemark.administrativeArea;
        _city = placemark.locality;
        if(!_city){
            _city = _province;
        }
        _area = placemark.subLocality;
        _street = placemark.thoroughfare;
        _name = placemark.name;
    }
    
    return self;
}

+ (instancetype)locationWithPlacemark:(CLPlacemark *)placemark{
    return [[Location alloc] initWithPlacemark:placemark];
}

//- (NSString *)description{
//    NSMutableString *desc = [[NSMutableString alloc] init];
//    [desc appendFormat:@"国家：%@\n", self.country];
//    [desc appendFormat:@"省份：%@\n", self.province];
//    [desc appendFormat:@"城市：%@\n", self.city];
//    [desc appendFormat:@"地标：%@\n", self.name];
//
//    return desc;
//}

@end
