//
//  MainUI.m
//  SearchDemo
//
//  Created by dascomsoft on 2019/5/14.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "MainUI.h"
#import "SearchResultUI.h"
@interface MainUI () <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchUI;

@property (strong, nonatomic) NSMutableArray *arr;

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arr = [[NSMutableArray alloc] init];
    for(int i=0;i<100;i++){
        [_arr addObject:[self shuffledAlphabet]];
    }

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    SearchResultUI *resultUI = [[SearchResultUI alloc] initWithDataArray:_arr];
    _searchUI = [[UISearchController alloc] initWithSearchResultsController:resultUI];
    
    _searchUI.dimsBackgroundDuringPresentation = NO;
    _searchUI.obscuresBackgroundDuringPresentation = NO;
    
    
    _searchUI.delegate = self;
    _searchUI.searchResultsUpdater = resultUI;

    _searchUI.searchBar.frame = CGRectMake(_searchUI.searchBar.frame.origin.x, _searchUI.searchBar.frame.origin.y, _searchUI.searchBar.frame.size.width, 44.0);
    _tableView.tableHeaderView = _searchUI.searchBar;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSString *)shuffledAlphabet {
    
    NSMutableArray * shuffledAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
    
    NSString *strTest = [[NSString alloc]init];
    for (int i=0; i<5; i++) {
        int x = arc4random() % [shuffledAlphabet count];
        strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffledAlphabet[x]];
    }
    
    return strTest;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.textLabel setText:_arr[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arr count];
}

#pragma mark - UISearchResultsUpdating
- (void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"willDismissSearchController");
}

- (void)willPresentSearchController:(UISearchController *)searchController{
    NSLog(@"willPresentSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController{
    NSLog(@"presentSearchController");
    
}

- (void)didDismissSearchController:(UISearchController *)searchController{
    NSLog(@"didDismissSearchController");
}

- (void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"didPresentSearchController");
}


@end
