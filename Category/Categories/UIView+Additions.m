//
//  UIView+Additions.m
//  Orimuse
//
//  Created by Bingjie on 14/12/11.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "UIView+Additions.h"
#import <QuartzCore/QuartzCore.h>

#define kTagBadgeView  1000

@implementation UIView (Additions)

- (UIViewController *)getViewController
{
    Class vcc = [UIViewController class];
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: vcc])
            return (UIViewController *)responder;
    return nil;
}

- (UIImage *)screenshot
{
    CGSize imageSize = [self bounds].size;
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, [self center].x, [self center].y);
    
    CGContextConcatCTM(context, [self transform]);
    
    CGContextTranslateCTM(context,
                          -[self bounds].size.width * [[self layer] anchorPoint].x,
                          -[self bounds].size.height * [[self layer] anchorPoint].y);
    
    [[self layer] renderInContext:context];
    
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setX:(CGFloat)x
{
  self.frame = CGRectMake(x, 
                          self.frame.origin.y, 
                          self.frame.size.width, 
                          self.frame.size.height);
}

- (void)setY:(CGFloat)y
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          y, 
                          self.frame.size.width, 
                          self.frame.size.height);
}

- (void)setWidth:(CGFloat)aWidth
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          self.frame.origin.y, 
                          aWidth, 
                          self.frame.size.height);
}

- (void)setHeight:(CGFloat)aHeight
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          self.frame.origin.y, 
                          self.frame.size.width, 
                          aHeight);
}

- (void)addX:(CGFloat)x
{
  self.frame = CGRectMake(self.frame.origin.x + x, 
                          self.frame.origin.y, 
                          self.frame.size.width, 
                          self.frame.size.height);
}

- (void)addY:(CGFloat)y
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          self.frame.origin.y + y, 
                          self.frame.size.width, 
                          self.frame.size.height);
}

- (void)addWidth:(CGFloat)aWidth
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          self.frame.origin.y, 
                          self.frame.size.width + aWidth, 
                          self.frame.size.height);
}
  
- (void)addHeight:(CGFloat)aHeight
{
  self.frame = CGRectMake(self.frame.origin.x, 
                          self.frame.origin.y, 
                          self.frame.size.width, 
                          self.frame.size.height + aHeight);
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)addTapGesturesTarget:(id)target selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [tapGesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tapGesture];
}

- (CGSize)doubleSizeOfFrame{
    CGSize size = self.frame.size;
    return CGSizeMake(size.width*2, size.height*2);
}

- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    if (cgColorArray && [cgColorArray count] > 0) {
        layer.colors = cgColorArray;
    }else{
        return;
    }
    if (floatNumArray && [floatNumArray count] == [cgColorArray count]) {
        layer.locations = floatNumArray;
    }
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    [self.layer addSublayer:layer];
}

- (void)drawLineStartPoint:(CGPoint)sPoint
                  endPoint:(CGPoint)ePoint
{
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(sPoint.x, sPoint.y, ePoint.x - sPoint.x, 3)];
    view.image = [UIImage imageNamed:@"orimuse_line"];
    [self addSubview:view];
}


- (void)scaleViewAnimationDuration:(CGFloat)duration scaleValue:(CGFloat)scaleValue
{
    CABasicAnimation *animation= [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue= @1.0;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.toValue= @(scaleValue);
    
    animation.duration= duration;
    
    animation.repeatCount = 0;
    
    animation.autoreverses = YES;
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode=kCAFillModeForwards;
    
    [self.layer addAnimation:animation forKey:@"Float"];
    
//    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//    k.values = @[@(1.0),@(1.2),@(1.5),@(1.0)];
//    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
//    k.calculationMode = kCAAnimationLinear;
}


- (CABasicAnimation *)fadeIn
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 0.35;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:0.8f];
    return animation;
}

- (CABasicAnimation *)fadeOut
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 0.2;
    animation.fromValue = [NSNumber numberWithFloat:0.8f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    return animation;
}


@end