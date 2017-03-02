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

    NSString *urlString = @"http:wwww.baidu.com?a=1&b=2&c=3&d=4";
    NSDictionary *dict = @{@"1":@"a",
                           @"2":@"b",
                           @"3":@"c",
                           @"4":@"d"
                           };
    NSArray * keys = @[@"2", @"3", @"4"];

    
    
    
}



@end
