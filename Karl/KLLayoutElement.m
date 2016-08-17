//
//  KLLayoutElement.m
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLLayoutElement.h"
#import "KLLayoutEngine.h"
#import "KLLayoutElement+ForEngine.h"

@interface KLLayoutElement ()

@property (nonatomic, strong) NSMutableSet *installedPolicies;

@property (nonatomic, readwrite) KLLayoutElementType type;

@property (nonatomic) CGFloat layoutOffset;

@property (nonatomic) CGFloat layoutMultipliedBy;

@property (nonatomic) BOOL layoutFlexible;

@end

@implementation KLLayoutElement

- (instancetype)initWithType:(KLLayoutElementType)type
{
    self = [self init];
    if (!self) {
        return nil;
    }
    
    _type = type;
    
    return self;
}

- (KLLayoutElement * (^)(CGFloat))offset
{
    return ^id(CGFloat offset){
        self.offset = offset;
        return self;
    };
}

- (KLLayoutElement * (^)(CGFloat))multipliedBy
{
    return ^id(CGFloat multipliedBy){
        self.multipliedBy = multipliedBy;
        return self;
    };
}

- (KLLayoutElement * (^)(BOOL flexible))flexible
{
    return ^id(BOOL flexible){
        self.flexible = flexible;
        return self;
    };
}

- (void)setFlexible:(BOOL)flexible
{
    self.layoutFlexible = flexible;
}

- (void)setOffset:(CGFloat)offset
{
    self.layoutOffset = offset;
}

- (void)setMultipliedBy:(CGFloat)multipliedBy
{
    self.layoutMultipliedBy = multipliedBy;
}

- (void)installForView:(UIView *)view
{
    [[KLLayoutEngine sharedEngine] registerLayoutElement:self forView:view];
}

- (void)uninstall
{
    
}

@end
