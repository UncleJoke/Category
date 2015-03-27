//
//  UIColor+Helper.h
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

// 颜色(RGB)
#define RGB_COLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA_COLOR(r, g, b, a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface UIColor (Helper)

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;
+ (UIColor *)colorWithW:(CGFloat)white a:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(int32_t)rgbValue;
+ (UIColor *)colorWithHex:(int32_t)rgbValue a:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)colorStr;
+ (UIColor *)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;

+ (UIColor *)themeColor;

+ (UIColor *)watermelonRedColor;

@end
