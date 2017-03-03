//
//  ViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *showView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self setUpMainView];
}

- (void)setUpMainView{
    
    [self.view addSubview:self.showView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.showView yj_shakeWithTimes:20 offset:20];
}

#pragma mark - Lazy
- (UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 100, 100)];
        _showView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_showView];
        
        [_showView yj_addTopBorderWithColor:[UIColor redColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
        
        [_showView yj_addLeftBorderWithColor:[UIColor yellowColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
        
        [_showView yj_addBottomBorderWithColor:[UIColor blueColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
        
        [_showView yj_addRightBorderWithColor:[UIColor blackColor] width:30 excludeLength:30 excludePointType:YJExcludePointAll];
    }
    return _showView;
}




@end
