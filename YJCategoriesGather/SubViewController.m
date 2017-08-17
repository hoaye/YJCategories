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
@property (nonatomic, weak) UIButton *btnBadge; /**< 角标按钮 */

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    imageView.image = [UIImage imageNamed:@"01"];
    [self.view addSubview:imageView];
//    [imageView yj_reflect];

    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isCanMoveTop = !self.isCanMoveTop;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
    NSLog(@"-->%@", @"SubViewController----------dealloc");

}

@end
