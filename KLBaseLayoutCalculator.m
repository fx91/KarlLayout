//
//  KLBaseLayoutCalculator.m
//  LongImage
//
//  Created by fx on 16/8/16.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLBaseLayoutCalculator.h"

@implementation KLBaseLayoutCalculator

+ (instancetype)calculator
{
    return [[self alloc] init];
}

- (KLLayoutBaseLine)baseLineWithLayoutElements:(NSArray *)elements view:(UIView *)view
{
    return (KLLayoutBaseLine){0,0};
}

@end
