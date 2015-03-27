//
//  RIButtonItem.m
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "RIButtonItem.h"

@implementation RIButtonItem
@synthesize label;
@synthesize action;

+(id)item
{
    return [self new];
}

+(id)itemWithLabel:(NSString *)inLabel
{
    RIButtonItem *newItem = [self item];
    [newItem setLabel:inLabel];
    return newItem;
}

+(id)itemWithLabel:(NSString *)inLabel action:(void(^)(void))action
{
  RIButtonItem *newItem = [self itemWithLabel:inLabel];
  [newItem setAction:action];
  return newItem;
}

@end

