//
//  YLAlertMessageView.m
//  YLAlertMessageView
//
//  Created by 袁亮 on 2017/1/19.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

#import "YLAlertMessageView.h"
#import "YLAlertTextCell.h"

#define kwidth [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
#define cell_height kheight * 0.08

@interface YLAlertMessageView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

//半透明背景
@property(nonatomic,strong)UIView *alphView;

//数据展示tableview
@property(nonatomic,strong)UITableView *dataTableView;


@end

@implementation YLAlertMessageView

#pragma mark - 初始化

/**
 控件在初始化或者在使用之前必须有一些参数要设置，那我们可以写自己的 Designated Initializer 构造

 @param dataArr 数据
 */
-(instancetype)initWithDataArr:(NSArray *)dataArr completeClcick:(ClickComplete)complete{
    
    self = [self initWithDataArr:dataArr frame:CGRectMake(0, kheight, kwidth, kheight) completeClcick:complete];
    
    return self;
}

/**
 在实现中一定要调用父类的 Designated Initializer，而且如果你有多个自定义的 Designated Initializer，最终都应该指向一个全能的初始化构造器

 @param dataArr dataarr
 @param frame frame
 @return self
 */
- (instancetype)initWithDataArr:(NSArray *)dataArr frame:(CGRect)frame completeClcick:(ClickComplete)complete{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        //数据
        self.dataArr = dataArr;
        //回调
        self.clickBlock = complete;
        //数据视图设置
        [self addSubview:self.dataTableView];
        //透明视图设置
        [self addSubview:self.alphView];
        
    }
    return self;
}

/**
 布局变动
 */
-(void)layoutSubviews{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, kwidth, kheight);
    } completion:nil];
}

-(UITableView *)dataTableView{
    if (!_dataTableView) {
        
        if (self.dataArr.count >= 6) {
            
            _dataTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kheight - cell_height * 6, kwidth, cell_height * 6) style:UITableViewStylePlain];
            
        }else{
            
            _dataTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kheight - cell_height * self.dataArr.count, kwidth, cell_height * self.dataArr.count) style:UITableViewStylePlain];
            
        }
       
        _dataTableView.bounces = NO;
        _dataTableView.showsVerticalScrollIndicator = NO;
        _dataTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        _dataTableView.delegate = self;
        _dataTableView.dataSource = self;
        
        
        [self registerCell];
    }
    
    return _dataTableView;
}


#pragma mark - lazy
-(UIView *)alphView{
    if (!_alphView) {
        
        if (self.dataArr.count >= 6) {
            
            _alphView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight - cell_height * 6)];
            _alphView.backgroundColor = [UIColor lightGrayColor];
            _alphView.alpha = 0.65;
            
        }else{
            
            _alphView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight - cell_height * self.dataArr.count)];
            _alphView.backgroundColor = [UIColor lightGrayColor];
            _alphView.alpha = 0.65;
        
        }
        
        //移除手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeView)];
        [_alphView addGestureRecognizer:tap];
        
    }
    return _alphView;
}


-(NSArray *)dataArr{
    if (!_dataArr) {
        
        _dataArr = [NSArray array];
    }
    return _dataArr;
}


/**
 视图移除
 */
-(void)removeView {
    
    [self removeFromSuperview];
    
}


#pragma mark - setProperty


#pragma mark - 注册cell
-(void)registerCell{
    //只有文字的cell
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YLAlertTextCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([YLAlertTextCell class])];
}


#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    switch (MessageShowType) {
//            //默认文本
//        case TextType:
//
//            break;
//
//            //文本加图片
//        case TextAndImageType:
//
//            break;
//
//        default:
//            break;
//    }
    
    YLAlertTextCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLAlertTextCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.infoStr = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark -- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.clickBlock(indexPath.row);
    
    [self removeView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return cell_height;
}


@end
