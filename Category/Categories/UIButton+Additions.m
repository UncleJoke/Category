//
//  UIButton+Additions.m
//  Orimuse
//
//  Created by Bingjie on 14/12/2.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "UIButton+Additions.h"
#import <objc/runtime.h>


@implementation UIButton (Additions)


@end



@implementation UIButton (Block)
static char ActionTag;

- (void)addAction:(ButtonBlock)block
{
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents
{
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

- (void)action:(id)sender
{
    ButtonBlock blockAction = (ButtonBlock)objc_getAssociatedObject(self, &ActionTag);
    if (blockAction)
    {
        blockAction(self);
    }
}

@end