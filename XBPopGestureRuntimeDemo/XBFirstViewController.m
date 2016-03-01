//
//  XBFirstViewController.m
//  XBPopGestureRuntimeDemo
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "XBFirstViewController.h"
#import "XBSecondViewController.h"

@interface XBFirstViewController ()

@end

@implementation XBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"我是第一个控制器";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
}

- (void)push {
    XBSecondViewController *secondVC = [[XBSecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
