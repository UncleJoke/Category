//
//  UIColor+Helper.m
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha];
}

+ (UIColor *)colorWithW:(CGFloat)white a:(CGFloat)alpha {
    return [UIColor colorWithWhite:white/255.0f alpha:alpha];
}

+ (UIColor *)colorWithHex:(int32_t)rgbValue {
    return [[self class] colorWithHex:rgbValue a:1.0];
}

+ (UIColor *)colorWithHex:(int32_t)rgbValue a:(CGFloat)alpha {
    return [[self class] colorWithR:((float)((rgbValue & 0xFF0000) >> 16))
                                  g:((float)((rgbValue & 0xFF00) >> 8))
                                  b:((float)(rgbValue & 0xFF))
                                  a:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)colorStr {
    return [[self class] colorWithHexString:colorStr alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha {
    NSString *cString = [[colorStr stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:rString] scanHexInt:&red];
    [[NSScanner scannerWithString:gString] scanHexInt:&green];
    [[NSScanner scannerWithString:bString] scanHexInt:&blue];
    
    return [[self class] colorWithR:(float)red
                                  g:(float)green
                                  b:(float)blue
                                  a:alpha];
}

+ (UIColor *)randomColor
{
    CGFloat red     = ( arc4random() % 256);
    CGFloat green   = ( arc4random() % 256);
    CGFloat blue    = ( arc4random() % 256);
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}

+ (UIColor *)themeColor
{
    CGFloat red     = 14;
    CGFloat green   = 219;
    CGFloat blue    = 212;
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}

+ (UIColor *)watermelonRedColor
{
    CGFloat red     = 251;
    CGFloat green   = 99;
    CGFloat blue    = 120;
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}

@end
