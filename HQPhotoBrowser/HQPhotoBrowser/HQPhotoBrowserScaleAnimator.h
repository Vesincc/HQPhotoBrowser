//
//  HQPhotoBrowserScaleAnimator.h
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/5.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HQAnimationOptionStyle) {

    HQAnimationOptionStylePresent = 1,
    HQAnimationOptionStyleDismiss = 2
    
};

@interface HQPhotoBrowserScaleAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) HQAnimationOptionStyle option;

@end
