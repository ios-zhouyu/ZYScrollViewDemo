//
//  ViewController.m
//  ZYScrollView
//
//  Created by zhouyu on 2019/5/21.
//  Copyright © 2019 zhouyu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
// scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
// 添加子控件的contentView
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation ViewController

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
        make.bottom.equalTo(self.bottomView.mas_top);
        make.left.right.equalTo(self.contentView);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@(150));
    }];
    
    self.textLabel.text = @"也不知道这场雨何时才能停下，雨漫漫，慢慢的……。慢慢的淋湿了整座城市，偌大的城市尘埃洗尽，长久的寖染在这纷纷雨落中，让人傻傻的有些怀疑，这到底是什么季节。\n 一个念旧的人，喜欢独自怀念，怀着一份虔诚的心境，欣赏那流年华光可知，飞跃的思绪，早就超越这时光的枷锁。\n 那雨中的一草一木，风中的一语一笑，似乎都带着穿越的味道，时间和场景总是如此惊人的相似，去年的今日，去年再去年的今日，我又在何方，我又在想什么?\n 时间增添了我的年纪，风雨丰富了我的行程，我也忘记了我何时拔去的那根无意中滋生的白发，只愿它永不复来\n 有时候，我们对时间漠不关心，无谓了昼夜，也无谓了年月。可有时，却又如此的在意，在意那一分一秒，在意那一呼一吸。我想，大概每个到了某个年纪的人，若他依旧没能过上自己想要的日子，从此他再也说不出那些年少轻狂的话。他承受着一些他原本意料以外的承受以后，就会多一些纠结，多一些顾虑，我们都无法彻底的互相去体会，也不愿轻易的互相交流，只将这颗心，继续磨练在这红尘滚滚之中，夹杂着爱恨情仇，相伴着生死离别，偶尔的放纵，偶尔的话酒桑麻，已是美好。\n 我总是喜欢感慨时间，经过了诸多是是非非以后，逐渐发觉：时间最不可挽回的不是将你我慢慢变老，而是将你我悄悄疏远。\n 而我们似乎也没有办法，谁叫我们身在红尘呢?\n 既然我们已无法避免这年月带来的种种距离，何不欣然的接受呢?\n 所以，我逐渐喜欢了时间静流的感觉，既然我已无法逃避，那就用心的装下它吧，我知将来我还是会老去，当我回忆着那些流年，依旧会满心喜欢。\n也不知道这场雨何时才能停下，雨漫漫，慢慢的……。慢慢的淋湿了整座城市，偌大的城市尘埃洗尽，长久的寖染在这纷纷雨落中，让人傻傻的有些怀疑，这到底是什么季节。\n 一个念旧的人，喜欢独自怀念，怀着一份虔诚的心境，欣赏那流年华光可知，飞跃的思绪，早就超越这时光的枷锁。\n 那雨中的一草一木，风中的一语一笑，似乎都带着穿越的味道，时间和场景总是如此惊人的相似，去年的今日，去年再去年的今日，我又在何方，我又在想什么?\n 时间增添了我的年纪，风雨丰富了我的行程，我也忘记了我何时拔去的那根无意中滋生的白发，只愿它永不复来\n 有时候，我们对时间漠不关心，无谓了昼夜，也无谓了年月。可有时，却又如此的在意，在意那一分一秒，在意那一呼一吸。我想，大概每个到了某个年纪的人，若他依旧没能过上自己想要的日子，从此他再也说不出那些年少轻狂的话。他承受着一些他原本意料以外的承受以后，就会多一些纠结，多一些顾虑，我们都无法彻底的互相去体会，也不愿轻易的互相交流，只将这颗心，继续磨练在这红尘滚滚之中，夹杂着爱恨情仇，相伴着生死离别，偶尔的放纵，偶尔的话酒桑麻，已是美好。\n 我总是喜欢感慨时间，经过了诸多是是非非以后，逐渐发觉：时间最不可挽回的不是将你我慢慢变老，而是将你我悄悄疏远。\n 而我们似乎也没有办法，谁叫我们身在红尘呢?\n 既然我们已无法避免这年月带来的种种距离，何不欣然的接受呢?\n 所以，我逐渐喜欢了时间静流的感觉，既然我已无法逃避，那就用心的装下它吧，我知将来我还是会老去，当我回忆着那些流年，依旧会满心喜欢。";
}

- (void)tap {
    NSString *str = @"数组增删改查的实现.\n栈的实现(借助数组实现).\n队列的实现(借助数组实现).\n循环队列的实现(借助数组实现): 记住特点.\n链表的实现和增删改查.\n带头结点的链表是为了增加和删除结点时头结点不用特殊处理.\n链表实现栈和队列.\n递归实现链表的增加和删除(优化三次).\n二分搜索树的概念和添加和查询递归实现.\n二分搜索树的前序, 中序和后序(内存释放)遍历: 深度优先遍历.\n二分搜索树遍历的非递归写法(栈的应用).\n二叉树的层次遍历(非递归处理—队列): 广度优先遍历, 方便更快找到问题, 最短路径.\n删除二分搜索树的最小值和最大值.\n删除二分搜索树的任意元素(三种情况).\n二分搜索树的floor, ceil, rank, select(size)处理;\n集合Set(元素无重复): 二分搜索树实现—客户统计和词汇量统计.\n有序集合—搜索树实现; 无序集合—哈希表实现.\nMap链表和搜索树的实现(耗时分析).\nTreeSet和TreeMap是基于平衡二叉树的实现, HashSet和HashMap是基于哈希表的实现.\n二叉堆数组实现: 添加元素和删除元素, 堆排序的实现过程.\n二叉堆replace(替换顶部值)和heapify(将数组转为堆排序)操作.\n优先队列使用堆实现(对比用数组和链表实现的复杂度分析).\n线段树(区间树的染色问题): 更新和查询. 是平衡二叉树(303问题).\n区间求和(303和307问题).\nTrie字典树(多叉树): O(W) 208 实现Trie(前缀树) 211 匹配和模糊查询单词.\n并查集: 由孩子指向父亲的树. 处理连接问题和路径问题.\n平衡树和AVL: 平衡因子. 二分搜索树为基础.\nAVL树平衡性检查和二分搜索树的检查.\nAVL树添加元素左旋与右旋的实现(四种情况).\nAVL删除结点(四种情况)和添加类似.\n基于AVL树封装的set和map.\n2-3树是绝对平衡的树(13-2的讲解动画).\n红黑树: 基于二分搜索树和2-3等价: 红结点就是三节点的左斜的.\n重点掌握红黑树的基本性质: 红黑树添加元素比较复杂(面试基本不考).\n伸展树: 统计性能更优(刚被访问过的下次被访问的概率更高).\n哈希冲突处理: 1. 开放地址法(线性, 平方, 再哈希法) (冲突时换哈希函数) 2.链地址法(同一个key一条链: 链表到红黑树).\n哈希链地址法复杂度分析和动态扩容问题.\n";
    self.textLabel.text = [NSString stringWithFormat:@"%@ \n %@", self.textLabel.text, str];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.topView.hidden = !self.topView.hidden;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.topView.hidden) {
                make.height.equalTo(@(0));
            } else {
                make.height.equalTo(@(100));
            }
        }];
    });
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
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

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

@end
