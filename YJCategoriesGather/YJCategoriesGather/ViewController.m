//
//  ViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self setUpMainView];
}

- (void)setUpMainView{


    NSTimer *timer = [NSTimer yj_timerWithTimeInterval:1 block:^{
        NSLog(@"-->%@", @"-----");
    } repeats:NO];
    [timer fire];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    


    
    
    
}

- (void)_yj_ExecuteSimpleBlock:(NSTimer *)timer{
NSLog(@"-->%@", @"----");

}



@end
