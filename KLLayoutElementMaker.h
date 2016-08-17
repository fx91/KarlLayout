//
//  KLLayoutElementMaker.h
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLLayoutElement.h"

@interface KLLayoutElementMaker : NSObject

//默认相对于父视图
@property (nonatomic, strong, readonly) KLLayoutElement *top;
@property (nonatomic, strong, readonly) KLLayoutElement *bottom;
@property (nonatomic, strong, readonly) KLLayoutElement *left;
@property (nonatomic, strong, readonly) KLLayoutElement *right;
@property (nonatomic, strong, readonly) KLLayoutElement *width;
@property (nonatomic, strong, readonly) KLLayoutElement *height;

- (NSArray *)install;

- (instancetype)initWithView:(UIView *)view;

@end
