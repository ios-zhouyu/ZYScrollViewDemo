//
//  ViewController2.m
//  ZYScrollView
//
//  Created by zhouyu on 2019/5/21.
//  Copyright © 2019 zhouyu. All rights reserved.
//

#import "ViewController2.h"
#import "Masonry.h"
#import "MJRefresh.h"

@interface ViewController2 ()<UITableViewDelegate, UITableViewDataSource>
// scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
// 添加子控件的contentView
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrM;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(tap)];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navigationController.navigationBar.bounds.size.height);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.textLabel.mas_top);
        make.height.equalTo(@(100));
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.left.right.equalTo(self.contentView);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.1));
    }];
    
    self.textLabel.text = @"时间增添了我的年纪，风雨丰富了我的行程，我也忘记了我何时拔去的那根无意中滋生的白发，只愿它永不复来\n 有时候，我们对时间漠不关心，无谓了昼夜，也无谓了年月。可有时，却又如此的在意，在意那一分一秒，在意那一呼一吸。我想，大概每个到了某个年纪的人，若他依旧没能过上自己想要的日子";
    
    self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.arrM removeAllObjects];
        [self tap];
        [self.scrollView.mj_header endRefreshing];
        [self.scrollView.mj_footer resetNoMoreData];
    }];
    self.scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self tap];
        if (self.arrM.count > 200) {
            [self.scrollView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.scrollView.mj_footer endRefreshing];
        }
    }];
}

- (void)tap {
    for (int i = 0; i < 10; i++) {
        NSString *str = [NSString stringWithFormat:@"%ld", random()];
        [self.arrM addObject:str];
    }
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(70 * self.arrM.count));
    }];
   
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld---%@", (long)indexPath.row, self.arrM[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _scrollView.bounces = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [self.scrollView addSubview:_contentView];
    }
    return _contentView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.numberOfLines = 0;
        [self.contentView addSubview:_textLabel];
    }
    return _textLabel;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_topView];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedRowHeight = 0;
        [self.contentView addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)arrM {
    if (!_arrM) {
        _arrM = [NSMutableArray array];
    }
    return _arrM;
}

@end
