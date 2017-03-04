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
    
    NSString *pinyin = @"风是雨的预言, 雨是云的牵绊, 云散了就是晴天, 晴天了才会感到暖. 用我的浪漫给你个晴天, 只想日夜与你牵绊, 爱不需要华丽的语言, 我一定让你看见.";
    NSLog(@"-%@", [pinyin yj_pinyinWithPhoneticSymbolUppercase:NO]);
    

    
    
    
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
