//
//  KLLayoutElement+ForEngine.h
//  LongImage
//
//  Created by fx on 16/8/9.
//  Copyright © 2016年 fx. All rights reserved.
//

#ifndef KLLayoutElement_ForEngine_h
#define KLLayoutElement_ForEngine_h

@interface KLLayoutElement (ForEngine)

@property (nonatomic, readonly) CGFloat layoutOffset;

@property (nonatomic, readonly) CGFloat layoutMultipliedBy;

@property (nonatomic, readonly) BOOL layoutFlexible;

@end

#endif /* KLLayoutElement_Private_h */

