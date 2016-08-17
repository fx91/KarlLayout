//
//  View+KLLayout.m
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "View+KLLayout.h"

@implementation UIView (KLLayout)

- (NSArray *)kl_makeLayoutElement:(void (^)(KLLayoutElementMaker *))block
{
    KLLayoutElementMaker *maker = [[KLLayoutElementMaker alloc] initWithView:self];
    
    block(maker);
    
    return [maker install];
}

@end
