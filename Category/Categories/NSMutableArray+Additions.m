//
//  NSMutableArray+Additions.m
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (Additions)

- (void)removeViews
{
    if (self.count != 0) {
        [self makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeAllObjects];
    }
}

- (void)removeLayers
{
    if (self.count != 0) {
        [self makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
        [self removeAllObjects];
    }
}


@end
