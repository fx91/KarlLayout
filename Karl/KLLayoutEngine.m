//
//  KLLayoutEngine.m
//  LongImage
//
//  Created by fx on 16/8/5.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLLayoutEngine.h"
#import "KLLayoutElement+ForEngine.h"
#import "KLHorizontalLayoutCalculator.h"
#import "KLVerticalLayoutCalculator.h"

static inline UIColor *RGB_A(NSInteger rgbValue, CGFloat alpha) {
    return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:alpha];
};

@interface KLLayoutEngine ()

@property (nonatomic, strong) NSMutableDictionary *viewLayoutElementDict;

@end

@implementation KLLayoutEngine

+ (instancetype)sharedEngine
{
    static KLLayoutEngine *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[self alloc] init];
    });
    
    return sharedEngine;
}

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _viewLayoutElementDict = [NSMutableDictionary dictionary];
    
    return self;
}

- (void)registerLayoutElement:(KLLayoutElement *)layoutElement forView:(UIView *)view
{
    KLLayoutElement *toReplaceElement;
    for (KLLayoutElement *element in [self elementsForView:view]){
        if (element.type == layoutElement.type) {
            toReplaceElement = element;
        }
    }
    [[self elementsForView:view] removeObject:toReplaceElement];
    [[self elementsForView:view] addObject:layoutElement];
    
    [self makeLayoutElementsAvaliableForView:view];
}

- (void)makeLayoutElementsAvaliableForView:(UIView *)view
{
    CGRect frame = view.frame;
    
    NSArray *elements = [self elementsForView:view];
    
    KLLayoutBaseLine horizontalLine = [[KLHorizontalLayoutCalculator calculator] baseLineWithLayoutElements:elements view:view];
    KLLayoutBaseLine verticalLine = [[KLVerticalLayoutCalculator calculator] baseLineWithLayoutElements:elements view:view];
    
    frame.origin.x = horizontalLine.offset;
    frame.origin.y = verticalLine.offset;
    frame.size.width = horizontalLine.length;
    frame.size.height = verticalLine.length;
    
    view.frame = frame;
    
    for (KLLayoutElement *element in elements) {
        switch (element.type) {
            case KLLayoutElementTypeTop: {
                
                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleTopMargin;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleTopMargin);
                }
                
                break;
            }
            case KLLayoutElementTypeBottom: {

                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleBottomMargin;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleBottomMargin);
                }
                
                break;
            }
            case KLLayoutElementTypeLeft: {

                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleLeftMargin;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleLeftMargin);
                }
                
                break;
            }
            case KLLayoutElementTypeRight: {

                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleRightMargin;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleRightMargin);
                }
                
                break;
            }
            case KLLayoutElementTypeWidth: {

                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleWidth;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleWidth);
                }
                
                break;
            }
            case KLLayoutElementTypeHeight: {

                if (element.layoutFlexible) {
                    view.autoresizingMask = view.autoresizingMask | UIViewAutoresizingFlexibleHeight;
                }else{
                    view.autoresizingMask = view.autoresizingMask & (~UIViewAutoresizingFlexibleHeight);
                }
                
                break;
            }
        }
    }
}

#pragma mark - Inner 

- (NSMutableArray *)elementsForView:(UIView *)view
{
    NSMutableArray *arrayForView;
    
    if ([self.viewLayoutElementDict objectForKey:[self addressForView:view]]) {
        arrayForView = [self.viewLayoutElementDict objectForKey:[self addressForView:view]];
        
    }
    else{
        arrayForView = [NSMutableArray array];
        [self.viewLayoutElementDict setObject:arrayForView forKey:[self addressForView:view]];
    }
    
    return arrayForView;
}

- (NSString *)addressForView:(UIView *)view
{
    NSString *address = [NSString stringWithFormat:@"%p", view];
    return address;
}

- (UIView *)viewAtAddress:(NSString *)address
{
    __unsafe_unretained UIView *view;
    sscanf([address cStringUsingEncoding:NSUTF8StringEncoding], "%p", &view);

    return view;
}

#pragma mark - Debug

- (void)setDebugModeEnable:(BOOL)enable
{
    if (enable) {
        for (NSString *address in [self.viewLayoutElementDict allKeys]) {
            UIView *view = [self viewAtAddress:address];
            [self setupRandomColorWithView:view];
        }
    }
}

- (void)setupRandomColorWithView:(UIView *)view
{
    int randomIndex = rand() % [[self colorArray] count];
    [view setBackgroundColor:[[self colorArray] objectAtIndex:randomIndex]];
}

- (NSArray *)colorArray
{
    return @[
             RGB_A(0xF9D7C9, 1),
             RGB_A(0xCFC2AD, 1),
             RGB_A(0xC5CAE9, 1),
             RGB_A(0xC8E6C9, 1),
             RGB_A(0xFFCDD2, 1),
             RGB_A(0xFDEFBA, 1),
             RGB_A(0xF9D7C1, 1),
             RGB_A(0xCFC2A1, 1),
             RGB_A(0xC5CAE1, 1),
             RGB_A(0xC8E6C1, 1),
             RGB_A(0xFFCDD1, 1),
             RGB_A(0xFDEFB1, 1),
             
             ];
}

@end


