//
//  ViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
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
    
    NSString *pinyin = @"侯跃军";
    NSLog(@"-%@", [pinyin yj_pinyinInitialsArrayUppercase:NO]);
    

    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}

#pragma mark - Lazy
- (UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 100, 100)];
        _showView.backgroundColor = [UIColor greenColor];
    }
    return _showView;
}




@end
