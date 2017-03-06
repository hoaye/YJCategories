//
//  SubViewController.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/6.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController () <UIAlertViewDelegate>

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self yj_backButtonClickBlock:^(__kindof UIViewController *vc) {
        NSLog(@"-->%@", vc);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"55555" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
