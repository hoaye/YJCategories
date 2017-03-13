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
    
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *drawPath = [UIBezierPath yj_stars:5 shapeInFrame:CGRectMake(100, 100, 100, 50)];
    [drawPath fill];
    
    NSLog(@"-->%@", [drawPath yj_SVGString]);
    
}

@end
