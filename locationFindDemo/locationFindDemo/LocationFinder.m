//
//  LocationFinder.m
//  locationFindDemo
//
//  Created by xpzheng on 2019/9/27.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "LocationFinder.h"
#import <CoreLocation/CoreLocation.h>

// 定位完成
typedef void(^completion)(LocationFindResult error, Location *location);

@interface LocationFinder () <CLLocationManagerDelegate>

@property (strong, nonatomic) NSMutableArray<completion> *completions;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation LocationFinder

- (instancetype)init{
    if(self = [super init]){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _completions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(!error && [placemarks count]){
            CLPlacemark *placemark = [placemarks lastObject];
            
            NSLog(@"country: %@", placemark.country);
            NSLog(@"administrativeArea: %@", placemark.administrativeArea);
            NSLog(@"subAdministrativeArea: %@", placemark.subAdministrativeArea);
            NSLog(@"locality: %@", placemark.locality);
            NSLog(@"subLocality: %@", placemark.subLocality);
            NSLog(@"thoroughfare: %@", placemark.thoroughfare);
            NSLog(@"subThoroughfare: %@", placemark.subThoroughfare);
            NSLog(@"name: %@", placemark.name);
//            NSLog(@"inlandWater: %@", placemark.inlandWater);
//            NSLog(@"ocean: %@", placemark.ocean);
//            NSLog(@"areasOfInterest: %@", placemark.areasOfInterest);
            Location *location = [Location locationWithPlacemark: placemark];
            for(completion completion in self->_completions){
                completion(LocationFindSuccess, location);
            }
        }else{
            for(completion completion in self->_completions){
                completion(LocationFindUnknownError, nil);
            }
        }
        
    }];
    
    
    
    
    // 找到位置后马上停止更新位置
    [manager stopUpdatingLocation];
}

- (void)find{
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)find:(void (^)(LocationFindResult, Location * _Nonnull))completion{
    if(completion){
        [self.completions addObject:completion];
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

@end
