//
//  KLLayoutEngine.h
//  LongImage
//
//  Created by fx on 16/8/5.
//  Copyright © 2016年 fx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLLayoutElement.h"

@interface KLLayoutEngine : NSObject

//调试模式
- (void)setDebugModeEnable:(BOOL)enable;

+ (instancetype)sharedEngine;

- (void)registerLayoutElement:(KLLayoutElement *)layoutElement forView:(UIView *)view;

@end
