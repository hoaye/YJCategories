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

    NSString *urlString = @"http://wwww.baidu.com?a=1&b=2&c=3&d=4";
    NSDictionary *dict = @{@"1":@"a",
                           @"2":@"b",
                           @"3":@"c",
                           @"4":@"d"
                           };
    NSArray * keys1 = @[@"2", @"3", @"4", @"5"];
    NSArray * keys2 = @[@"3", @"4"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    [mutableArray yj_addSafeObject:@2];
    
    [mutableArray yj_addBOOL:NO];
    
    [mutableArray yj_addChar:'G'];
    
    [mutableArray yj_addInt:-112];
    
    [mutableArray yj_addRect:CGRectMake(10, 12, 13, 14)];
    [mutableArray yj_addFloat:12.0f];
    [mutableArray yj_addCGFloat:16.0f];
    
    [mutableArray yj_addInteger:-10];

    
    NSLog(@"-->%@", mutableArray);
    
    NSLog(@"-->%c", [[mutableArray yj_objectSafeAtIndex:2] charValue]);
    


    
    
    
}



@end
