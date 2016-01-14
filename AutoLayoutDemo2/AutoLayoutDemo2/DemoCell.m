//
//  DemoCell.m
//  AutoLayoutDemo2
//
//  Created by ColeXm on 16/1/13.
//  Copyright © 2016年 ColeXm. All rights reserved.
//

#import "DemoCell.h"

@implementation DemoCell{

    __weak IBOutlet NSLayoutConstraint *lcToLabel1;
    __weak IBOutlet NSLayoutConstraint *lcToLabel2;
    __weak IBOutlet UILabel *label1;
    
    __weak IBOutlet UILabel *label2;
}


-(void)awakeFromNib{
    label1.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width/2;
    label2.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width/2;
}

-(void)setBean:(DemoBean *)bean{

    _bean = bean;
    
    label1.text = bean.text1;
    label2.text = bean.text2;
    
    BOOL label1LonerThanLabel2 = label1.text.length> label2.text.length;
    
    lcToLabel1.priority = label1LonerThanLabel2?UILayoutPriorityDefaultHigh:UILayoutPriorityFittingSizeLevel;
    lcToLabel2.priority = label1LonerThanLabel2?UILayoutPriorityFittingSizeLevel:UILayoutPriorityDefaultHigh;
}

@end
