//
//  ViewController.m
//  ChangeColorLabel
//
//  Created by Null on 16/2/2.
//  Copyright © 2016年 zcs_yang. All rights reserved.
//

#import "ViewController.h"
#import "ChangeColorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChangeColorView *changeClorView = [[ChangeColorView alloc]initWithFrame:CGRectMake(10, 100, 300, 500) OrignTextColor:[UIColor blackColor] willColor:[UIColor redColor] textArr:@[@"第一个",@"第二个",@"第三个"]];
    changeClorView.backgroundColor = [UIColor whiteColor];
    changeClorView.layer.borderColor = [UIColor blackColor].CGColor;
    changeClorView.layer.borderWidth = 1.f/[UIScreen mainScreen].scale;
    [self.view addSubview:changeClorView];
}

@end
