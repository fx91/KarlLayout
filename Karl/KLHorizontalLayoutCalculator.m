//
//  KLHorizontalLayoutCalculator.m
//  LongImage
//
//  Created by fx on 16/8/16.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "KLHorizontalLayoutCalculator.h"
#import "KLLayoutElement.h"
#import "KLLayoutElement+ForEngine.h"

@implementation KLHorizontalLayoutCalculator

- (KLLayoutBaseLine)baseLineWithLayoutElements:(NSArray *)elements view:(UIView *)view
{
    KLLayoutBaseLine baseLine = (KLLayoutBaseLine){view.frame.origin.x, view.frame.size.width};
    
    if (elements.count == 0) {
        return baseLine;
    }
    
    KLLayoutElement *neededLastElement;
    
    //倒序遍历
    for (NSUInteger i = elements.count; i > 0; i--) {
        KLLayoutElement *element = [elements objectAtIndex:i - 1];
        switch (element.type) {
            case KLLayoutElementTypeLeft: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeRight) {
                        baseLine.offset = [self lengthForElement:element view:view];
                        baseLine.length = [self superViewWidthForView:view] - [self lengthForElement:element view:view] - [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeWidth) {
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
            case KLLayoutElementTypeRight: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeLeft) {
                        baseLine.offset = [self lengthForElement:neededLastElement view:view];
                        baseLine.length = [self superViewWidthForView:view] - [self lengthForElement:element view:view] - [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeWidth) {
                        baseLine.offset = [self superViewWidthForView:view] - [self lengthForElement:neededLastElement view:view] - [self lengthForElement:element view:view];
                        baseLine.length = [self lengthForElement:neededLastElement view:view];
                        return baseLine;
                    }
                }
                else{
                    neededLastElement = element;
                }
                break;
            }
            case KLLayoutElementTypeWidth: {
                if (neededLastElement) {
                    if (neededLastElement.type == KLLayoutElementTypeLeft) {
                        baseLine.offset = [self lengthForElement:neededLastElement view:view];
                        baseLine.length = [self lengthForElement:element view:view];
                        return baseLine;
                    }
                    if (neededLastElement.type == KLLayoutElementTypeRight) {
                        baseLine.offset = [self superViewWidthForView:view] - [self lengthForElement:element view:view] - [self lengthForElement:neededLastElement view:view];
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

- (CGFloat)superViewWidthForView:(UIView *)view
{
    return view.superview.frame.size.width;
}

- (CGFloat)lengthForElement:(KLLayoutElement *)element view:(UIView *)view
{
    return KLLengthMake([self superViewWidthForView:view], element.layoutMultipliedBy, element.layoutOffset);
}

@end
