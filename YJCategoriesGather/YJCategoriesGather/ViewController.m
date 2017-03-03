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

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    [view yj_addTopBorderWithColor:[UIColor redColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
    
    [view yj_addLeftBorderWithColor:[UIColor yellowColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
    
    [view yj_addBottomBorderWithColor:[UIColor blueColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
    
    [view yj_addRightBorderWithColor:[UIColor blackColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
    
    
    


    
    
    
}




@end
