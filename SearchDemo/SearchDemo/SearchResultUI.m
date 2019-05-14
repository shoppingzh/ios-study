//
//  SearchResultUI.m
//  SearchDemo
//
//  Created by dascomsoft on 2019/5/14.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "SearchResultUI.h"

@interface SearchResultUI () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) NSMutableArray *resultArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SearchResultUI

- (instancetype)initWithDataArray:(NSArray *)arr{
    if(self = [self init]){
        _dataArr = arr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SearchResultUI viewDidLoad");
    
    _resultArr = [[NSMutableArray alloc] initWithCapacity:20]; // 初始化搜索结果数组
    _tableView.delegate = self;
    _tableView.dataSource  = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"updateSearchResultsForSearchController");
    // 清空搜索结果
    [_resultArr removeAllObjects];
    NSString *text = searchController.searchBar.text;
    text = [text uppercaseString];
    for(NSString *str in _dataArr){
        BOOL f = YES;
        for(NSInteger i=0;i<text.length;i++){
            unichar c = [text characterAtIndex:i];
            f &= [str containsString:[NSString stringWithCharacters:&c length:1]];
        }
        if(f){
            [_resultArr addObject:str];
        }
        
    }
    
    NSLog(@"搜索到的结果：%@", _resultArr);
    
    [_tableView reloadData];
}

#pragma mark - Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_resultArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _resultArr[indexPath.row];
    return cell;
}


@end
