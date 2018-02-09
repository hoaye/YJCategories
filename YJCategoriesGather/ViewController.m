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
    
    NSString *html = @"<html><head><title>我是Title</title></head><body>我是body<div>&nbsp; &nbsp; &nbsp; &nbsp;我是DIV</div></body></html>";
    
    NSString *oneStepString = [html yj_stringByConvertingHTMLToPlainText];
    NSString *twoStepString = [oneStepString yj_removeBlank];
    NSLog(@"第1步处理结果-->%@", oneStepString);
    NSLog(@"第2步处理结果-->%@", twoStepString);

    
//    [self.view addSubview:self.drawView];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSLog(@"viewDidAppear-->%@", NSStringFromCGRect(self.view.frame));
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self yj_hideNavigationBar:YES toStatusBar:YES duration:1 completion:^(BOOL finished) {
//        NSLog(@"-->%@", @"over");
//        NSLog(@"-->%@", NSStringFromCGRect(self.view.frame));
//    }];
//    return;
    
    
    SubViewController *subViewC = [[SubViewController alloc] init];

    [self.navigationController pushViewController:subViewC animated:YES];
   
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"isCanMoveTop"]) {
        BOOL isCanMoveTop = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        NSLog(@"-->%d", isCanMoveTop);
    }
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{

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
