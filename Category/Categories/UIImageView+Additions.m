//
//  UIImageView+Additions.m
//  Orimuse
//
//  Created by Bingjie on 14/12/22.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import "UIImageView+Additions.h"

@implementation UIImageView (Additions)


- (void)setCircleHeadWithPoint:(CGPoint)point radius:(CGFloat)radius
{
    CAShapeLayer *pMaskLayer = [CAShapeLayer layer];
    self.layer.mask = pMaskLayer;
    CAShapeLayer *pCircleLayer = [CAShapeLayer layer];
    pCircleLayer.lineWidth = 3.0;
    pCircleLayer.fillColor = [[UIColor clearColor] CGColor];
    pCircleLayer.strokeColor = [[UIColor clearColor] CGColor];
    [self.layer addSublayer:pCircleLayer];
    
    [self updateCirclePathAtLocation:point radius:radius mask:pMaskLayer circle:pCircleLayer];
}

- (void)updateCirclePathAtLocation:(CGPoint)location radius:(CGFloat)radius mask:(CAShapeLayer*)maskLayer circle:(CAShapeLayer*)circle
{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    maskLayer.path = [path CGPath];
    circle.path = [path CGPath];
}


@end
