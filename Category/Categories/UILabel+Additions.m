//
//  UILabel+Additions.m
//  ElementFresh
//
//  Created by Bingjie on 14-9-26.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (CGSize)getLabeSizeWithMaxSize:(CGSize)maxsize
{
    CGSize size = CGSizeZero;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.font forKey: NSFontAttributeName];
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0
    
    size = [self.text boundingRectWithSize:maxsize
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:dict
                              context:nil].size;
#else
    size = [self.text sizeWithFont:self.font
            constrainedToSize:maxsize
                lineBreakMode:NSLineBreakByWordWrapping];
#endif
    
    return size;
}

@end
