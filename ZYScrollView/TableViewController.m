//
//  TableViewController.m
//  ZYScrollView
//
//  Created by zhouyu on 2019/5/21.
//  Copyright © 2019 zhouyu. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface TableViewController ()
@property (nonatomic, copy) NSArray *arr;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[ViewController new] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    } else {
        
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

- (NSArray *)arr {
    if (!_arr) {
        _arr = @[
                 @"scrollView普通自适应高度",
                 @"scrollView内部嵌套tableView自适应"
                 ];
    }
    return _arr;
}

@end
