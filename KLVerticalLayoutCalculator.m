//
//  KLVerticalLayoutCalculator.m
//  LongImage
//
//  Created by fx on 16/8/16.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLVerticalLayoutCalculator.h"
#import "KLLayoutElement.h"
#import "KLLayoutElement+ForEngine.h"

@implementation KLVerticalLayoutCalculator

- (KLLayoutBaseLine)baseLineWithLayoutElements:(NSArray *)elements view:(UIView *)view
{
    KLLayoutBaseLine baseLine = (KLLayoutBaseLine){view.frame.origin.y, view.frame.size.height};
    
    if (elements.count == 0) {
        return baseLine;
    }
    
    KLLayoutElement *neededLastElement;
    
    //倒序遍历
    for (NSUInteger i = elements.count; i > 0; i--) {
        KLLayoutElement *element = [elements objectAtIndex:i - 1];
        switch (element.type) {
            case KLLayoutElementTypeTop: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeBottom) {
                        baseLine.offset = [self lengthForElement:element view:view];
                        baseLine.length = [self superViewHeightForView:view]
                                        - [self lengthForElement:element view:view]
                                        - [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeHeight) {
                        baseLine.offset = [self lengthForElement:element view:view];
                        baseLine.length = [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                }
                else{
                    neededLastElement = element;
                }
                break;
            }
            case KLLayoutElementTypeBottom: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeTop) {
                        baseLine.offset = [self lengthForElement:neededLastElement view:view];
                        baseLine.length = [self superViewHeightForView:view] - [self lengthForElement:element view:view] - [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeHeight) {
                        baseLine.offset = [self superViewHeightForView:view] - [self lengthForElement:neededLastElement view:view] - [self lengthForElement:element view:view];
                        baseLine.length = [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                }
                else{
                    neededLastElement = element;
                }
                break;
            }
            case KLLayoutElementTypeHeight: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeTop) {
                        baseLine.offset = [self lengthForElement:neededLastElement view:view];
                        baseLine.length = [self lengthForElement:element view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeBottom) {
                        baseLine.offset = [self superViewHeightForView:view] - [self lengthForElement:element view:view] - [self lengthForElement:neededLastElement view:view];
                        baseLine.length = [self lengthForElement:element view:view];
                        return baseLine;
                    }
                }
                else{
                    neededLastElement = element;
                }
                break;
            }
            default: {
                break;
            }
        }
    }
    
    return baseLine;
}

- (CGFloat)superViewHeightForView:(UIView *)view
{
    return view.superview.frame.size.height;
}

- (CGFloat)lengthForElement:(KLLayoutElement *)element view:(UIView *)view
{
    return KLLengthMake([self superViewHeightForView:view], element.layoutMultipliedBy, element.layoutOffset);
}

@end
