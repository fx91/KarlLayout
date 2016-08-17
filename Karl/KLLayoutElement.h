//
//  KLLayoutElement.h
//  LongImage
//
//  Created by fx on 16/8/4.
//  Copyright © 2016年 fx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KLLayoutElementType) {
    KLLayoutElementTypeTop = 0,
    KLLayoutElementTypeBottom,
    KLLayoutElementTypeLeft,
    KLLayoutElementTypeRight,
    KLLayoutElementTypeWidth,
    KLLayoutElementTypeHeight

};

@interface KLLayoutElement : NSObject

- (instancetype)initWithType:(KLLayoutElementType)type;

- (KLLayoutElement * (^)(CGFloat offset))offset;

- (KLLayoutElement * (^)(CGFloat multipliedBy))multipliedBy;

- (KLLayoutElement * (^)(BOOL flexible))flexible;

- (void)installForView:(UIView *)view;

@property (nonatomic, readonly) KLLayoutElementType type;

@end
