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
    NSDate *dateCom = [NSDate dateWithTimeIntervalSinceReferenceDate:2];
    NSLog(@"%@-%@->%d", [NSDate date], dateCom, [[NSDate date] yj_isEqualToDateIgnoreTime:dateCom]);

}



@end
