//
//  UIImageView+BetterFace.h
//  Orimuse
//
//  Created by Bingjie on 14-6-20.
//  Copyright (c) 2014年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BetterFace)

@property (nonatomic) BOOL needsBetterFace;
@property (nonatomic) BOOL fast;

void hack_uiimageview_bf();
- (void)setBetterFaceImage:(UIImage *)image;

@end
