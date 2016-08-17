//
//  View+KLLayout.h
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLLayoutElementMaker.h"

@interface UIView (KLLayout)

- (NSArray *)kl_makeLayoutElement:(void (^)(KLLayoutElementMaker *make))block;

@end
