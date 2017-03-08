//
//  SubViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/6.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "SubViewController.h"
#import "AppDelegate.h"

@interface SubViewController () <UIAlertViewDelegate>

@property (nonatomic, strong) UIView *showView;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.showView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar yj_setBackgroundColor:[UIColor clearColor]];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.navigationController.navigationBar.yj_overlayView.backgroundColor = [UIColor blueColor];
    });
//    [self.navigationController.navigationBar yj_setTranslationY:20];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIViewController *topMost = [[AppDelegate sharedInstanceDelegate].window yj_topMostController];
    NSLog(@"111-->%@", topMost);
    
    UIViewController *topMost2 = [[AppDelegate sharedInstanceDelegate].window yj_currentViewController];
    NSLog(@"222-->%@", topMost2);
    

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[UIApplication sharedApplication] yj_startNetworkActivity];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] yj_stopNetworkActivity];
    });

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc{
    NSLog(@"-->%@", @"SubViewController dealloc");
}

@end
