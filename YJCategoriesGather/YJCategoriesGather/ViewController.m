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
    
    NSLog(@"%@-->%ld", [NSDate dateWithTimeIntervalSince1970:1487827960], [[NSDate dateWithTimeIntervalSince1970:1487827960] yj_componentsWithOffsetFromDate:[NSDate date]].minute);
 
    if ([[NSDate date] yj_isEqualWeekWithDate:[NSDate date]]) {
        NSLog(@"-->%@", @"是");
    }else{
        NSLog(@"-->%@", @"否");
    }

}



@end
