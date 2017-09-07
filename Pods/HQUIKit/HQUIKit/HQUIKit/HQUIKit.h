//
//  HQUIKit.h
//  HQUIKit
//
//  Created by HanQi on 2017/8/30.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HQUIKit : NSObject

#pragma mark - UILabel

/**
 UILabel 字色 字号

 @param textColor 字色
 @param size 字号
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size;


/**
 UILabel 字色 字体

 @param textColor 字色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor font:(UIFont *)font;


/**
 UILabel 字色 字号 对齐

 @param textColor 字色
 @param size 字号
 @param textAlignment 对齐
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size textAlignment:(NSTextAlignment)textAlignment;


/**
 UILabel 字色 字体 对齐

 @param textColor 字色
 @param font 字体
 @param textAlignment 对齐
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

/**
 UILabel 内容 字色 字体

 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)hq_labelWithText:(NSString *)text
                    textColor:(UIColor *)textColor
                         font:(UIFont *)font;


/**
 UILabel 内容 字色 字号

 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UILabel
 */
+ (UILabel *)hq_labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size;


#pragma mark - UIImageView


/**
 UIImageView 名字

 @param named 名字
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageNamed:(NSString *)named;


/**
 UIImageView 地址

 @param urlString 地址
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageUrlString:(NSString *)urlString;


/**
 UIImageView 地址 占位图名

 @param urlString 地址
 @param named 占位图名
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageUrlString:(NSString *)urlString placeholderImageNamed:(NSString *)named;

#pragma mark - UIButton


/**
 UIButton 背景色

 @param backgroundColor 背景色
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor;


/**
 UIButton 背景色 内容 字色 字号

 @param backgroundColor 背景色
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size;

/**
 UIButton 内容 字色 字号
 
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size;

/**
 UIButton 内容 字色 字体
 
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/**
 UIButton 背景色 内容 字色 字体

 @param backgroundColor 背景色
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/**
 UIButton 图片

 @param named 图片
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named;


/**
 UIButton 图片 选中图片

 @param named 图片
 @param selectedNamed 选中图片
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed;


/**
 UIButton 图片 内容 字色 字号

 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size;

/**
 UIButton 图片 内容 字色 字体
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;


/**
 UIButton 图片 内容 字色 字号 间距

 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size space:(CGFloat)space;


/**
 UIButton 图片 内容 字色 字体 间距

 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font space:(CGFloat)space;

/**
 UIButton 图片 选中图片 内容 字色 字号

 @param named 图片
 @param selectedNamed 选中图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size;

/**
 UIButton 图片 选中图片 内容 字色 字体
 
 @param named 图片
 @param selectedNamed 选中图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;


/**
 UIButton 上下排列 图片 内容 字色 字号 间距

 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonLinedWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size space:(CGFloat)space;


/**
 UIButton 上下排列 图片 内容 字色 字体 间距

 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonLinedWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font space:(CGFloat)space;

#pragma mark - UITextField


/**
 UITextField 字色 字号 占位

 @param textColor 字色
 @param size 字号
 @param placeholder 占位
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size placeholder:(NSString *)placeholder;


/**
 UITextField 字色 字体 占位

 @param textColor 字色
 @param font 字体
 @param placeholder 占位
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder;


/**
 UITextField 字色 字体 占位 占位字色 占位字体

 @param textColor 字色
 @param font 字体
 @param placeholder 占位
 @param placeholderTextColor 占位字色
 @param placeholderFont 占位字体
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)placeholderTextColor placeholderFont:(UIFont *)placeholderFont;


/**
 UITextField 字色 字号 占位 占位字色 占位字体

 @param textColor 字色
 @param size 字号
 @param placeholder 占位
 @param placeholderTextColor 占位字色
 @param placeholderFont 占位字体
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)placeholderTextColor placeholderFont:(UIFont *)placeholderFont;

#pragma mark - UITableView


/**
 UITableView section header跟随

 @return UITableView
 */
+ (UITableView *)hq_tableViewWithGrouped;


/**
 UITableView section header悬停

 @return UITableView
 */
+ (UITableView *)hq_tableViewWithPlain;

/**
 UITableView section header跟随 分割线右移
 
 @param separatorSpace 分割线右移间距
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithGroupedSeparatorSpace:(CGFloat)separatorSpace;


/**
 UITableView section header悬停 分割线右移
 
 @param separatorSpace 分割线右移间距
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithPlainSeparatorSpace:(CGFloat)separatorSpace;

#pragma mark - NavigationButton


/**
 NavigationButton 图片

 @param named 图片
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named;


/**
 NavigationButton 文字 字色

 @param text 文字
 @param color 字色
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithText:(NSString *)text textColor:(UIColor *)color;


/**
 NavigationButton 文字 字色 字体

 @param text 文字
 @param color 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font;


/**
 NavigationButton 图片 文字 字色

 @param named 图片
 @param text 文字
 @param textColor 字色
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor;


/**
 NavigationButton 图片 文字 字色 字体

 @param named 图片
 @param text 文字
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;


/**
 NavigationButton 图片 文字 字色 字体 图片位置 间距

 @param named 图片
 @param text 文字
 @param textColor 字色
 @param font 字体
 @param isLeft 图片位置
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font imageLeft:(BOOL)isLeft space:(CGFloat)space;

@end
