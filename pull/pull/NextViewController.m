//
//  NextViewController.m
//  pull
//
//  Created by 罗浩 on 2017/6/14.
//  Copyright © 2017年 qiwei. All rights reserved.
//

#import "NextViewController.h"
#import "Masonry.h"
#import "nextTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
//#import "UITableView+FDIndexPathHeightCache.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface NextViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *titleArr;
@property (nonatomic, strong)NSMutableDictionary *heightAtIndexPath;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.heightAtIndexPath = [[NSMutableDictionary alloc] init];
    [self setup];
}

- (void)setup
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    //self.tableView.estimatedRowHeight = 50;
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //self.tableView.fd_keyedHeightCache = YES;
    [self.tableView registerClass:[nextTableViewCell class] forCellReuseIdentifier:@"myCell"];
    [self.view addSubview:self.tableView];
    
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(100, 50));
//    }];
    
    UILabel *label = [UILabel new];
    label.text = @"这是一场屠杀";
    label.textColor = [UIColor greenColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.bottom.offset(-20);
    }];
    
    UIView *labelView = [UIView new];
    labelView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:labelView];
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(label.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"myCell"cacheByIndexPath:indexPath configuration:^(id cell) {
        
        [self configCell:cell indexpath:indexPath];
    }];
    
    /*
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return UITableViewAutomaticDimension;
    }
     */
}
/*
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 100;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    nextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    [self configCell:cell indexpath:indexPath];
    return cell;
}
- (void)configCell:(nextTableViewCell *)cell indexpath:(NSIndexPath *)index
{
    // 采用计算frame模式还是自动布局模式，默认为NO，自动布局模式
    //    cell.fd_enforceFrameLayout = NO;
    
    cell.index = index.row%2;
    cell.theText = self.titleArr[index.row % self.titleArr.count];
    
}
- (NSArray *)titleArr
{
    if (!_titleArr)
    {
        _titleArr = [[NSArray alloc] initWithObjects:@"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日啥答案所收到阿三撒旦撒大声地阿三 骑士归来之时",
                     @"短剑重铸之日骑士归来之时发发的是功夫大使馆地方过放电很反感还让他 和 ",
                     @"短剑重铸之日骑士归来之时不放到放大博尔特不方便覆盖你发个能够发货呢人你发给你部分个本地文本 不放到不放到",
                     @"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时不隔热被贝多芬不放过你和他你他短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时",
                     @"短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时短剑重铸之日骑士归来之时", nil];
    }
    return _titleArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
