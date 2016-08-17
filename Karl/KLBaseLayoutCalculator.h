//
//  KLBaseLayoutCalculator.h
//  LongImage
//
//  Created by fx on 16/8/16.
//  Copyright © 2016年 fx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef struct {
    CGFloat offset;
    CGFloat length;
} KLLayoutBaseLine;

static inline CGFloat KLLengthMake(CGFloat originLength,CGFloat multipliedBy, CGFloat offset)
{
    return multipliedBy * originLength + offset;
}

@interface KLBaseLayoutCalculator : NSObject

+ (instancetype)calculator;

- (KLLayoutBaseLine)baseLineWithLayoutElements:(NSArray *)elements view:(UIView *)view;

@end
