//
//  UIImage+Helper.h
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

+ (UIImage *)getImageFromResource:(NSString *)filename;

- (UIImage *)reSizeImage:(CGSize)reSize;
- (UIImage *)getScreenImage:(CGRect)rect;
- (UIImage *)scaleToSize:(CGSize)size;

- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;


- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

+ (UIImage *)imageWithColor:(UIColor *)color andRect:(CGRect)rect;
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

- (UIImage*)blurredImage:(CGFloat)blurAmount;


+ (UIImage*)defaultHead;

@end