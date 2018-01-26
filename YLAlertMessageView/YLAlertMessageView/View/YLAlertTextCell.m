//
//  YLAlertTextCell.m
//  YLAlertMessageView
//
//  Created by 袁亮 on 2017/1/19.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

#import "YLAlertTextCell.h"

@interface YLAlertTextCell ()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation YLAlertTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setInfoStr:(NSString *)infoStr{
    
    _infoStr = infoStr;
    
    self.infoLabel.text = infoStr;
    
}

@end
