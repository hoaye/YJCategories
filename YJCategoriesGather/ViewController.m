//
//  ViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
#import "AppDelegate.h"

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
    
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 100, 44)];
    textF.backgroundColor = [UIColor redColor];
    [self.view addSubview:textF];
    
    
    
    

}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

}

#pragma mark - Lazy
- (UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 10, 10)];
        _showView.backgroundColor = [UIColor redColor];
//        [_showView yj_cornerRadius:50 color:[UIColor greenColor] borderWidth:1];
        
//        UIView *nodeView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 10, 10)];
//        nodeView.backgroundColor = [UIColor blackColor];
//        [nodeView yj_cornerRadius:5 color:nil borderWidth:0];
//        [_showView addSubview:nodeView];
    }
    return _showView;
}




@end
