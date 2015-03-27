//
//  UIFont+Additions.h
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Additions)

//斜体
+ (UIFont*)HelveticaNeueItalic:(CGFloat)fontsize;
//粗体
+ (UIFont*)HelveticaNeueBold:(CGFloat)fontsize;
//超轻体
+ (UIFont*)HelveticaNeueUltraLight:(CGFloat)fontsize;
//浓黑（粗）体
+ (UIFont*)HelveticaNeueCondensedBlack:(CGFloat)fontsize;
//粗斜体
+ (UIFont*)HelveticaNeueBoldItalic:(CGFloat)fontsize;
//浓粗体
+ (UIFont*)HelveticaNeueCondensedBold:(CGFloat)fontsize;
//中
+ (UIFont*)HelveticaNeueMedium:(CGFloat)fontsize;
//细
+ (UIFont*)HelveticaNeueLight:(CGFloat)fontsize;
//薄
+ (UIFont*)HelveticaNeueThin:(CGFloat)fontsize;
//薄斜体
+ (UIFont*)HelveticaNeueThinItalic:(CGFloat)fontsize;
//细斜体
+ (UIFont*)HelveticaNeueLightItalic:(CGFloat)fontsize;
//超轻斜体
+ (UIFont*)HelveticaNeueUltraLightItalic:(CGFloat)fontsize;
//中斜体
+ (UIFont*)HelveticaNeueMediumItalic:(CGFloat)fontsize;

+ (UIFont*)HelveticaNeue:(CGFloat)fontsize;
@end
