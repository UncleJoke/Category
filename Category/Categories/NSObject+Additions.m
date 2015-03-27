//
//  NSObject+Additions.m
//  Orimuse
//
//  Created by Bingjie on 15/1/21.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "NSObject+Additions.h"
#import <objc/runtime.h>

@implementation NSObject (Additions)

- (NSArray *)filterPropertys
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *keys = [NSMutableArray array];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keys addObject:propertyName];
        
//        DLog(@"\n%s %s", property_getName(property), property_getAttributes(property));
    }
    free(properties);
    return keys;
}

@end
