//
//  UITableView+Additions.h
//  ElementFresh
//
//  Created by Bingjie on 14-9-24.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Additions)

- (void)setExtraCellLineHidden;

- (void)addRadiusforCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace;

@end
