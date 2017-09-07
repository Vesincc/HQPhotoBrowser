//
//  UIView+HQExtension.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HQExtension)

/**
 *  给视图四周加边框
 *
 *  @param width 边框粗细值
 *  @param color 颜色值
 */
- (void)hq_setBorderWithWidth:(CGFloat)width color:(UIColor *)color;


/**
 给四周加圆角

 @param radius 圆角大小
 */
- (void)hq_addCornerRadius:(CGFloat)radius;

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)hq_addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii;

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)hq_addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii viewRect:(CGRect)rect;


@end
