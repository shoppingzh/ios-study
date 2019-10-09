//
//  MainUI.m
//  locationFindDemo
//
//  Created by xpzheng on 2019/9/27.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "MainUI.h"
#import "LocationFinder.h"

@interface MainUI()
@property (strong, nonatomic) LocationFinder *locationFinder;
@end


@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%d", [CLLocationManager locationServicesEnabled]);
    
    
    
}
- (IBAction)findLocation:(id)sender {
    

    [self.locationFinder find:^(LocationFindResult results, Location * _Nonnull location) {
        NSLog(@"探测到的位置1：%@", location);
    }];
    
    [self.locationFinder find:^(LocationFindResult error, Location * _Nonnull location) {
        NSLog(@"探测到的位置2：%@", location);
    }];
}

- (LocationFinder *)locationFinder{
    if(!_locationFinder){
        _locationFinder = [[LocationFinder alloc] init];
    }
    return _locationFinder;
}

@end
