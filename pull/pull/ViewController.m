//
//  ViewController.m
//  pull
//
//  Created by 罗浩 on 2017/6/6.
//  Copyright © 2017年 qiwei. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat kOriginalImageHeight;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) UIImageView *imageHeaderView;
@property (nonatomic,strong) UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"么么哒";
    kOriginalImageHeight = 300;
    [self setNavigationBarClear];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
    
    
    // 初始化表头视图
    self.imageHeaderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kOriginalImageHeight, SCREEN_WIDTH, kOriginalImageHeight)];
    self.imageHeaderView.image = [UIImage imageNamed:@"login_logo"];
    
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kOriginalImageHeight, SCREEN_WIDTH, kOriginalImageHeight)];
    self.headerView.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 50, 150, 32)];
    label.text= @"三季度发生部分";
    
    [self.headerView addSubview:self.imageHeaderView];
    [self.headerView addSubview:label];
    
    //将表头视图添加到tablView
    [_tableView addSubview: self.imageHeaderView ];
    [_tableView addSubview: self.headerView ];
    //设置imageView的内容填充模式为ScaleAspectFill
    self.imageHeaderView.contentMode = UIViewContentModeScaleAspectFill;
    
    //设置tableView 的初始位置距离顶部200 即image的原始高度kOriginalImageHeight
    _tableView.contentInset = UIEdgeInsetsMake(kOriginalImageHeight, 0, 0, 0);
    
    [self.view addSubview:_tableView];
}
-(void)setNavigationBarClear{
    
    //给导航条设置一个空的背景图 使其透明化
    [self.navigationController .navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //去除导航条透明后导航条下的黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    cell.textLabel.text = @"巴萨画法几何";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",self.tableView.contentOffset.y);
    
    //获取tableView的Y方向偏移量
    
    CGFloat offSet_Y = self.tableView.contentOffset.y;
    
    //向下拖动图片时
    if (offSet_Y < - kOriginalImageHeight) {
        
        //获取imageView的原始frame
        CGRect frame = self.imageHeaderView.frame;
        
        //修改imageView的Y值 等于offSet_Y
        frame.origin.y = offSet_Y;
        
        //修改imageView的height  等于offSet_Y 的绝对值 此时偏移量为负数
        frame.size.height =  - offSet_Y;
        
        //重新赋值
        self.imageHeaderView.frame = frame;
        
    }
    
    //tableView相对于图片的偏移量
    
    CGFloat reOffset = offSet_Y + kOriginalImageHeight ;
    CGFloat alpha = reOffset/(kOriginalImageHeight - 64);
    
    if (alpha>=1) {
        
        alpha = 0.99;
    }
    NSLog(@"%f---%f",reOffset,alpha);
    
    // 设置导航条的背景图片 其透明度随  alpha 值 而改变
    
    UIImage *image = [self imageWithColor:[UIColor colorWithRed:0.227 green:0.753 blue:0.757 alpha:alpha]];
    
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.227 green:0.753 blue:0.757 alpha:alpha];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
// 使用颜色填充图片
- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
