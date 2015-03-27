//
//  UIButton+Additions.h
//  Orimuse
//
//  Created by Bingjie on 14/12/2.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

@end


typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (Block)

- (void)addAction:(ButtonBlock)block;
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end