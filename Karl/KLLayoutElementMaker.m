//
//  KLLayoutElementMaker.m
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLLayoutElementMaker.h"

@interface KLLayoutElementMaker ()

@property (nonatomic, weak) UIView *view;
@property (nonatomic, strong) NSMutableArray *layoutElements;

@end

@implementation KLLayoutElementMaker

- (NSArray *)install
{
    NSArray *elements = [self.layoutElements copy];
    for (KLLayoutElement *element in elements) {
        [element installForView:self.view];
    }
    
    [self.layoutElements removeAllObjects];
    
    return elements;
}

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _view = view;
    _layoutElements = [NSMutableArray array];
    
    return self;
}

- (KLLayoutElement *)addElementWithType:(KLLayoutElementType)type
{
    KLLayoutElement *element = [[KLLayoutElement alloc] initWithType:type];
    [self.layoutElements addObject:element];
    
    return element;
}

- (KLLayoutElement *)top
{
    return [self addElementWithType:KLLayoutElementTypeTop];
}

- (KLLayoutElement *)bottom
{
    return [self addElementWithType:KLLayoutElementTypeBottom];
}

- (KLLayoutElement *)left
{
    return [self addElementWithType:KLLayoutElementTypeLeft];
}

- (KLLayoutElement *)right
{
    return [self addElementWithType:KLLayoutElementTypeRight];
}

- (KLLayoutElement *)width
{
    return [self addElementWithType:KLLayoutElementTypeWidth];
}

- (KLLayoutElement *)height
{
    return [self addElementWithType:KLLayoutElementTypeHeight];
}

@end
