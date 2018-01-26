//
//  YLAlertMessageView.h
//  YLAlertMessageView
//
//  Created by 袁亮 on 2017/1/19.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

//提示类型
typedef NS_ENUM (NSInteger, MessageShowType)   {
    TextType    = 0,
    TextAndImageType
};

//点击Block
typedef void(^ClickComplete) (NSInteger index);

@interface YLAlertMessageView : UIView

//展示数据数组
@property(nonatomic,strong)NSArray *dataArr;
//展示视图title
@property(nonatomic,strong)NSString *title;
//点击数据回调
@property(nonatomic,strong)ClickComplete clickBlock;


/**
 自定义初始化方法

 @param dataArr 数据数组
 @param complete 点击回调
 @return instancetype
 */
-(instancetype)initWithDataArr:(NSArray *)dataArr completeClcick:(ClickComplete)complete;

@end
