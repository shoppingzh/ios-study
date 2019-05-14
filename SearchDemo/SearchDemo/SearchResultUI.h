//
//  SearchResultUI.h
//  SearchDemo
//
//  Created by dascomsoft on 2019/5/14.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultUI : UIViewController <UISearchResultsUpdating>

- (instancetype) initWithDataArray:(NSArray*) arr;

@end

NS_ASSUME_NONNULL_END
