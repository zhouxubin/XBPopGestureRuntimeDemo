//
//  XBBaseNavController.m
//  XBPopGestureRuntimeDemo
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "XBBaseNavController.h"

@interface XBBaseNavController ()

@end

@implementation XBBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 这段代码只要执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
        gesture.enabled = NO;
        UIView *gestureView = gesture.view;
        NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
        id gestureRecognizerTarget = [_targets firstObject];
        id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
        SEL handleNavigationTransition = NSSelectorFromString(@"handleNavigationTransition:");
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:navigationInteractiveTransition action:handleNavigationTransition];
        [gestureView addGestureRecognizer:panGesture];
    });
}

@end
