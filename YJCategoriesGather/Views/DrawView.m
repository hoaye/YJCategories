//
//  DrawView.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    
    UIColor *color = [UIColor orangeColor];
    [color set];
    
    UIBezierPath *drawPath = [UIBezierPath yj_customBezierPathOfPencilSymbolWithRect:CGRectMake(100, 100, 100, 100) scale:2 thick:30];
    [drawPath fill];
    
    NSLog(@"-->%f-----%@", [drawPath yj_length], NSStringFromCGPoint([drawPath yj_pointAtPercentOfLength:20]));
    
    UILabel *labelInit = [[UILabel alloc] initWithFrame:CGRectMake([drawPath yj_pointAtPercentOfLength:80].x, [drawPath yj_pointAtPercentOfLength:80].y, 100, 100)];
    labelInit.font = [UIFont systemFontOfSize:13];
    labelInit.textAlignment = NSTextAlignmentLeft;
    labelInit.backgroundColor = [UIColor redColor];
    [self addSubview:labelInit];
    
    
}

@end
