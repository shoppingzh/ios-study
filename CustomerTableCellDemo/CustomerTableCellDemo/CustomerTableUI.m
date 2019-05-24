//
//  CustomerTableUI.m
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "CustomerTableUI.h"
#import "Category.h"
#import "Goods.h"
#import "CustomerCell.h"

@interface CustomerTableUI ()

@property (strong, nonatomic) NSMutableArray<Goods*> *goodsArr;

@end

@implementation CustomerTableUI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initGoodsArr];
    self.tableView.allowsSelection = NO;
    
//    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomerCell" owner:nil options:nil];
//    UIView *view = [nibs lastObject];
//
//    [self.tableView registerClass:[CustomerCell class] forCellReuseIdentifier:@"goodsCell"];
    
    
    NSLog(@"UINib: %@", [UINib nibWithNibName:@"CustomerCell" bundle:nil]);
    // [self.tableView registerNib:[UINib nibWithNibName:@"CustomerCell" bundle:nil] forCellReuseIdentifier:@"goodsCell"];
    [self.tableView registerClass:[CustomerCell class] forCellReuseIdentifier:@"goodsCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void) initGoodsArr{
    _goodsArr = [[NSMutableArray alloc] init];
    Category *c1 = [[Category alloc] initWithNameAndType:@"生活用品" type:1];
    Category *c2 = [[Category alloc] initWithNameAndType:@"电器" type:2];
    Category *c3 = [[Category alloc] initWithNameAndType:@"针织物" type:3];
    Category *c4 = [[Category alloc] initWithNameAndType:@"易碎" type:4];
    Goods *goods = [[Goods alloc] initWithNameAndCategories:@"电动牙刷" categories:@[c1, c2]];
    
    Goods *goods2 = [[Goods alloc] initWithNameAndCategories:@"毛巾" categories:@[c1, c2, c4, c3]];
    Goods *goods3 = [[Goods alloc] initWithNameAndCategories:@"液晶显示屏" categories:@[c2, c4]];
    
    [_goodsArr addObject:goods];
    [_goodsArr addObject:goods2];
    [_goodsArr addObject:goods3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"商品数量：%ld" , [_goodsArr count]);
    return [_goodsArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomerCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"goodsCell"];
    Goods *goods = _goodsArr[indexPath.row];
    cell.goods = goods;
    // cell.titleLabel.text = goods.name;
    
    NSLog(@"获取Cell：%@", cell);
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"当前indexPath：%@", indexPath);
    CustomerCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    NSLog(@"计算Cell高度：%@", [tableView cellForRowAtIndexPath:indexPath]);
    return 100;
}

@end
