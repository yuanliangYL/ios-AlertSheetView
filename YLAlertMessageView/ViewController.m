//
//  ViewController.m
//  YLAlertMessageView
//
//  Created by 袁亮 on 2018/1/19.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

#import "ViewController.h"
#import "YLAlertMessageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAction:(id)sender {
    
    NSArray *arr = [[NSArray alloc]initWithObjects:@"1fghdf",@"2fsd",@"1gdfg",@"fsdf2",@"hfgh1",@"jghj2",@"1khjky",@"utyu2",@"17687",@"27567jg",nil];
    
    YLAlertMessageView *am = [[YLAlertMessageView alloc]initWithDataArr:arr completeClcick:^(NSInteger index) {
        
        //执行回调操作
        self.label.text = arr[index];
        
    }];
    
    [self.view addSubview:am];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
