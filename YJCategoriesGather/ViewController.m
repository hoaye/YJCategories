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
#import "DrawView.h"
#import "PersonModel.h"

@interface ViewController ()

@property (nonatomic, strong) DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self setUpMainView];
}

- (void)setUpMainView{
    
    PersonModel *model = [[PersonModel alloc] init];
    model.name = @"houmanager";
    model.height = nil;
    
    
    
//    [self.view addSubview:self.drawView];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self yj_hideNavigationBar:YES toStatusBar:NO duration:0.25 completion:^(BOOL finished) {
        NSLog(@"-->%@", @"over");
        NSLog(@"-->%@", NSStringFromCGRect(self.view.frame));
    }];

}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self yj_showNavigationBar:YES toStatusBar:YES duration:1 completion:^(BOOL finished) {
        NSLog(@"-->%@", @"over");
        NSLog(@"-->%@", NSStringFromCGRect(self.view.frame));
    }];
}

#pragma mark - Lazy
- (DrawView *)drawView{
    if (!_drawView) {
        _drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 64, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
        _drawView.backgroundColor = [UIColor whiteColor];
    }
    return _drawView;
}
                 



@end
