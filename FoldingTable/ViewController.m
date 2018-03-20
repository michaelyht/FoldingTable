//
//  ViewController.m
//  FoldingTable
//
//  Created by Michael on 2017/9/12.
//  Copyright © 2017年 Michael. All rights reserved.
//

#import "ViewController.h"

#import "Section_RoutWork.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,
UITableViewDataSource>{
    NSArray *_dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *sectionViews;

@end

//cell
static NSString * const cell_identity = @"TableViewCell";

@implementation ViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initData];
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self getSectionNum];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //分组部分
    UIButton *sectionTitleBtn;
    // 获取被点击的组标题按钮
    for (Section_RoutWork *sectionview in self.sectionViews) {
        if (sectionview.bntZK.tag == section) {
            sectionTitleBtn = sectionview.bntZK;
            break;
        }
    }
    
    // 判断是否展开
    if (sectionTitleBtn.isSelected) {
        NSArray *temArray = _dataArray[section];
        return temArray.count;
    }
    return 0;
    
}


-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_identity];
    return cell;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return (Section_RoutWork *)self.sectionViews[section];
}


- (void)bntClick:(id)sender event:(id)event{
    UIButton *bnt = (UIButton *)sender;
    NSArray *dArray = _dataArray[bnt.tag];
    if (!dArray || dArray.count == 0) {
        NSLog(@"这组暂时没得数据");
        return;
    }
    // 修改组标题按钮的状态
    bnt.selected = !bnt.isSelected;
    
    // 刷新单独一组
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:bnt.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - private methods

- (void)initData{
    _dataArray = @[@[@"",@"",@"",@""],
                   @[@""],
                   @[@"",@"",@""],
                   @[@"",@""],
                   @[@"",@"",@"",@""]];
    [self setsectionVIewsWith:_dataArray];
}

- (void)configUI{

}

/**
 *  存储sectionView视图
 */
- (void)setsectionVIewsWith:(NSArray *)users{
    for (int index = 0; index < users.count; index++) {
        Section_RoutWork *sectionview = [[[NSBundle mainBundle] loadNibNamed:@"Section_RoutWork" owner:self options:nil] firstObject];
        [sectionview.bntZK addTarget:self action:@selector(bntClick:event:) forControlEvents:UIControlEventTouchUpInside];
        sectionview.bntZK.tag = index;
        [sectionview updateViewWithData:[NSString stringWithFormat:@"第%d组",index]];
        [self.sectionViews addObject:sectionview];
    }
}

/***
 *  计算组数
 */
- (NSInteger)getSectionNum{
    NSInteger num =  _dataArray.count;
    return num;
}


#pragma mark - getter and setter


- (NSMutableArray *)sectionViews{
    if (!_sectionViews) {
        _sectionViews = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _sectionViews;
}

@end
