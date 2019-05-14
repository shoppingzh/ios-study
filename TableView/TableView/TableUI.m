//
//  TableUI.m
//  TableView
//
//  Created by dascomsoft on 2019/2/3.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "TableUI.h"
#import "ProfileTableViewCell.h"

@interface TableUI () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TableUI

- (void)viewDidLoad {
    [super viewDidLoad];
    _table.dataSource = self;
    _table.delegate = self;
    
    _table.bounces = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NSLog(@"当前组：%ld, 当前行：%ld", indexPath.section, indexPath.row);
    NSString *secStr = [NSString stringWithFormat:@"%ld", indexPath.section];
    NSString *rowStr = [NSString stringWithFormat:@"%ld", indexPath.row];
    NSString *desc = [[[@"组" stringByAppendingString: secStr] stringByAppendingString:@"行"] stringByAppendingString:rowStr];
    
    // Cell复用
    UITableViewCell *cell = [_table dequeueReusableCellWithIdentifier:desc];
    if(cell != nil){
        return cell;
    }
    NSLog(@"%@", [@"新建一个新Cell: " stringByAppendingString: desc]);
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:desc];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.section == 0 && indexPath.row == 0){
        UINib *nib = [UINib nibWithNibName:@"ProfileTableViewCell" bundle:[NSBundle mainBundle]];
        NSArray *views = [nib instantiateWithOwner:nil options:nil];
        [cell.contentView addSubview:views[0]];
    } else{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:desc];
        cell.imageView.image = [UIImage imageNamed:@"icon"];
        cell.textLabel.text = desc;
        cell.detailTextLabel.text = @"这里是详细内容...";
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    } else if(section == 1){
        return 1;
    } else if(section == 2){
        return 4;
    } else if(section == 3){
        return 1;
    }
    return 0;
}

// 一个列表中有多少个组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

// 设置组头与组尾内容
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;//[@"组" stringByAppendingString:[NSString stringWithFormat:@"%ld", section]];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section == 0){
        return @"  ";
    }
    
    return nil;
    
}

#pragma mark - UITableViewDelegate

// 各行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 168;
}

// 设置组头组尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}




@end
