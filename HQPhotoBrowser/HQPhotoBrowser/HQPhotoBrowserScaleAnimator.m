//
//  HQPhotoBrowserScaleAnimator.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/5.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQPhotoBrowserScaleAnimator.h"
#import "HQPhotoBrowser.h"
#import "HQPhotoBrowserCollectionViewCell.h"

@interface HQPhotoBrowserScaleAnimator () {}



@end

@implementation HQPhotoBrowserScaleAnimator


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return .5f;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    if (self.option == HQAnimationOptionStylePresent) {
        
        [containerView addSubview:fromViewController.view];
        toViewController.view.alpha = 0;
        [containerView addSubview:toViewController.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            toViewController.view.alpha = 1;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
            
        }];
    
    } else {
    
        CGRect frame = fromViewController.view.frame;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.center = containerView.center;
        imageView.image = [self hq_captureWithView:fromViewController.view];
        
        [containerView addSubview:toViewController.view];
        [containerView addSubview:imageView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            imageView.alpha = 0;
            imageView.frame = CGRectMake(0, 0, imageView.frame.size.width*3/2, imageView.frame.size.height*3/2);
            imageView.center = containerView.center;
            
        } completion:^(BOOL finished) {
            
            [imageView removeFromSuperview];
            [transitionContext completeTransition:YES];
            
        }];
        
    }
        
    
    
    
  
    
}

- (UIImage *)hq_captureWithView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [UIScreen mainScreen].scale);
    // IOS7及其后续版本
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    } else { // IOS7之前的版本
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
    
}

@end
