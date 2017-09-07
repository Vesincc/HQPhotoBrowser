//
//  HQUIKit.m
//  HQUIKit
//
//  Created by HanQi on 2017/8/30.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQUIKit.h"
#import "UIImageView+WebCache.h"

@implementation HQUIKit

#pragma mark - UILabel

/**
 UILabel 字色 字号
 
 @param textColor 字色
 @param size 字号
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_labelWithTextColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}


/**
 UILabel 字色 字体
 
 @param textColor 字色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor font:(UIFont *)font {

    return [HQUIKit hq_labelWithText:@"" textColor:textColor font:font];
    
}


/**
 UILabel 字色 字号 对齐
 
 @param textColor 字色
 @param size 字号
 @param textAlignment 对齐
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size textAlignment:(NSTextAlignment)textAlignment {

    return [HQUIKit hq_labelWithTextColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin] textAlignment:textAlignment];
    
}


/**
 UILabel 字色 字体 对齐
 
 @param textColor 字色
 @param font 字体
 @param textAlignment 对齐
 @return UILabel
 */
+ (UILabel *)hq_labelWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment {

    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    
    return label;
    
}

/**
 UILabel 内容 字色 字体
 
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)hq_labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {

    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    return label;
    
}


/**
 UILabel 内容 字色 字号
 
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UILabel
 */
+ (UILabel *)hq_labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_labelWithText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}


#pragma mark - UIImageView


/**
 UIImageView 名字
 
 @param named 名字
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageNamed:(NSString *)named {

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:named]];
    
    return imageView;
    
}


/**
 UIImageView 地址
 
 @param urlString 地址
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageUrlString:(NSString *)urlString {

    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    return imageView;
}


/**
 UIImageView 地址 占位图名
 
 @param urlString 地址
 @param named 占位图名
 @return UIImageView
 */
+ (UIImageView *)hq_imageViewWithImageUrlString:(NSString *)urlString placeholderImageNamed:(NSString *)named {

    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:named]];
    
    return imageView;
    
}

#pragma mark - UIButton


/**
 UIButton 背景色
 
 @param backgroundColor 背景色
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor {

    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = backgroundColor;
    return button;
    
}


/**
 UIButton 背景色 内容 字色 字号
 
 @param backgroundColor 背景色
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_buttonWithBackgroundColor:backgroundColor titleText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}

/**
 UIButton 内容 字色 字号
 
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_buttonWithText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}

/**
 UIButton 内容 字色 字体
 
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {

    return [HQUIKit hq_buttonWithBackgroundColor:[UIColor clearColor] titleText:text textColor:textColor font:font];
    
}


/**
 UIButton 背景色 内容 字色 字体
 
 @param backgroundColor 背景色
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithBackgroundColor:(UIColor *)backgroundColor titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {

    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = backgroundColor;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    return button;
    
}

/**
 UIButton 图片
 
 @param named 图片
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named {

    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    
    return button;
    
}


/**
 UIButton 图片 选中图片
 
 @param named 图片
 @param selectedNamed 选中图片
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed {

    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedNamed] forState:UIControlStateSelected];
    
    return button;
    
}


/**
 UIButton 图片 内容 字色 字号
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_buttonWithImageNamed:named titleText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}

/**
 UIButton 图片 内容 字色 字体
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;

    return button;
    
}


/**
 UIButton 图片 内容 字色 字号 间距
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size space:(CGFloat)space {

    return [HQUIKit hq_buttonWithImageNamed:named titleText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin] space:space];
    
}


/**
 UIButton 图片 内容 字色 字体 间距
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font space:(CGFloat)space {

    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -space/2.0f, 0, space/2.0f)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, space/2.0f, 0, -space/2.0f)];
    
    return button;
    
}

/**
 UIButton 图片 选中图片 内容 字色 字号
 
 @param named 图片
 @param selectedNamed 选中图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size {

    return [HQUIKit hq_buttonWithImageNamed:named selectedImageNamed:selectedNamed titleText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin]];
    
}

/**
 UIButton 图片 选中图片 内容 字色 字体
 
 @param named 图片
 @param selectedNamed 选中图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_buttonWithImageNamed:(NSString *)named selectedImageNamed:(NSString *)selectedNamed titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {

    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedNamed] forState:UIControlStateSelected];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    return button;
    
}


/**
 UIButton 上下排列 图片 内容 字色 字号 间距
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param size 字号
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonLinedWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)size space:(CGFloat)space {

    return [HQUIKit hq_buttonLinedWithImageNamed:named titleText:text textColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin] space:space];
    
}


/**
 UIButton 上下排列 图片 内容 字色 字体 间距
 
 @param named 图片
 @param text 内容
 @param textColor 字色
 @param font 字体
 @param space 间距
 @return UIButton
 */
+ (UIButton *)hq_buttonLinedWithImageNamed:(NSString *)named titleText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font space:(CGFloat)space {

    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:named] forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    NSDictionary *dic = @{NSFontAttributeName : font};
    CGSize textSize = [text boundingRectWithSize:[[UIScreen mainScreen] bounds].size
                                         options:(NSStringDrawingUsesLineFragmentOrigin |
                                                  NSStringDrawingTruncatesLastVisibleLine)
                                      attributes:dic context:nil].size;
    
    CGSize imageSize = button.imageView.image.size;
    CGSize labelSize = textSize;

//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, labelSize.width/2.0f, 0, -labelSize.width/2.0f)];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width/2.0f, 0, imageSize.width/2.0f)];
//    
//    [button setImageEdgeInsets:UIEdgeInsetsMake(-labelSize.height/2.0f, 0, labelSize.height/2.0f, 0)];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height/2.0f, 0, -imageSize.height/2.0f, 0)];
//
//    [button setImageEdgeInsets:UIEdgeInsetsMake(-space/2.0f, 0, space/2.0f, 0)];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(space/2.0f, 0, -space/2.0f, 0)];
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(-labelSize.height/2.0f - space/2.0f, labelSize.width/2.0f, labelSize.height/2.0f + space/2.0f, -labelSize.width/2.0f)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height/2.0f + space/2.0f, -imageSize.width/2.0f, -imageSize.height/2.0f-space/2.0f, imageSize.width/2.0f)];
    
    return button;
    
}

#pragma mark - UITextField


/**
 UITextField 字色 字号 占位
 
 @param textColor 字色
 @param size 字号
 @param placeholder 占位
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size placeholder:(NSString *)placeholder {

    return [HQUIKit hq_textFieldWithTextColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin] placeholder:placeholder];
    
}


/**
 UITextField 字色 字体 占位
 
 @param textColor 字色
 @param font 字体
 @param placeholder 占位
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder {

    UITextField *textField = [[UITextField alloc] init];
    textField.textColor = textColor;
    textField.font = font;
    textField.placeholder = placeholder;
    
    return textField;
    
}


/**
 UITextField 字色 字体 占位 占位字色 占位字体
 
 @param textColor 字色
 @param font 字体
 @param placeholder 占位
 @param placeholderTextColor 占位字色
 @param placeholderFont 占位字体
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)placeholderTextColor placeholderFont:(UIFont *)placeholderFont {

    UITextField *textField = [[UITextField alloc] init];
    textField.textColor = textColor;
    textField.font = font;
    textField.placeholder = placeholder;
    
    [textField setValue:placeholderTextColor forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
    
    return textField;
    
}


/**
 UITextField 字色 字号 占位 占位字色 占位字体
 
 @param textColor 字色
 @param size 字号
 @param placeholder 占位
 @param placeholderTextColor 占位字色
 @param placeholderFont 占位字体
 @return UITextField
 */
+ (UITextField *)hq_textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)size placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)placeholderTextColor placeholderFont:(UIFont *)placeholderFont {

    return [HQUIKit hq_textFieldWithTextColor:textColor font:[UIFont systemFontOfSize:size weight:UIFontWeightThin] placeholder:placeholder placeholderTextColor:placeholderTextColor placeholderFont:placeholderFont];
    
}

#pragma mark - UITableView


/**
 UITableView section header跟随
 
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithGrouped {

    return [HQUIKit hq_tableViewWithGroupedSeparatorSpace:0];
    
}


/**
 UITableView section header悬停
 
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithPlain {

    return [HQUIKit hq_tableViewWithPlainSeparatorSpace:0];
    
}

/**
 UITableView section header跟随 分割线右移
 
 @param separatorSpace 分割线右移间距
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithGroupedSeparatorSpace:(CGFloat)separatorSpace {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    tableView.sectionHeaderHeight = 0.01f;
    tableView.sectionFooterHeight = 0.01f;
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
    
    tableView.backgroundColor = [UIColor clearColor];
    
    //解决iOS8下,cell分割线右移的问题
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, separatorSpace, 0, -separatorSpace)];
        
    } else if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [tableView setLayoutMargins:UIEdgeInsetsMake(0, separatorSpace, 0, -separatorSpace)];
        
    }
    
    return tableView;
    
}


/**
 UITableView section header悬停 分割线右移
 
 @param separatorSpace 分割线右移间距
 @return UITableView
 */
+ (UITableView *)hq_tableViewWithPlainSeparatorSpace:(CGFloat)separatorSpace {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    tableView.tableHeaderView = [UIView new];
    tableView.tableFooterView = [UIView new];
    
    tableView.backgroundColor = [UIColor clearColor];
    
    //解决iOS8下,cell分割线右移的问题
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, separatorSpace, 0, -separatorSpace)];
        
    } else if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [tableView setLayoutMargins:UIEdgeInsetsMake(0, separatorSpace, 0, -separatorSpace)];
        
    }
    
    return tableView;
    
}

#pragma mark - NavigationButton


/**
 NavigationButton 图片
 
 @param named 图片
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named {

    UIButton *button = [HQUIKit hq_buttonWithImageNamed:named];
    button.frame = CGRectMake(0, 0, button.imageView.image.size.width, button.imageView.image.size.height > 40 ? button.imageView.image.size.height : 40);
    
    return button;
}


/**
 NavigationButton 文字 字色
 
 @param text 文字
 @param color 字色
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithText:(NSString *)text textColor:(UIColor *)color {

    return [HQUIKit hq_navigationButtonWithText:text textColor:color font:[UIFont systemFontOfSize:14 weight:UIFontWeightThin]];
    
}


/**
 NavigationButton 文字 字色 字体
 
 @param text 文字
 @param color 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font {

    NSDictionary *dic = @{NSFontAttributeName : font};
    
    CGSize textSize = [text boundingRectWithSize:[[UIScreen mainScreen] bounds].size
                                         options:(NSStringDrawingUsesLineFragmentOrigin |
                                                  NSStringDrawingTruncatesLastVisibleLine)
                                      attributes:dic context:nil].size;
    
    UIButton *button = [HQUIKit hq_buttonWithBackgroundColor:[UIColor clearColor] titleText:text textColor:color font:font];
    button.frame = CGRectMake(0, 0, textSize.width < 20 ? 20 : textSize.width, 40);
    
    return button;
    
}


/**
 NavigationButton 图片 文字 字色
 
 @param named 图片
 @param text 文字
 @param textColor 字色
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor {

    return [HQUIKit hq_navigationButtonWithImageNamed:named andText:text textColor:textColor font:[UIFont systemFontOfSize:14 weight:UIFontWeightThin]];
    
}


/**
 NavigationButton 图片 文字 字色 字体
 
 @param named 图片
 @param text 文字
 @param textColor 字色
 @param font 字体
 @return UIButton
 */
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {

    return [HQUIKit hq_navigationButtonWithImageNamed:named andText:text textColor:textColor font:font imageLeft:YES space:5];
    
}


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
+ (UIButton *)hq_navigationButtonWithImageNamed:(NSString *)named andText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font imageLeft:(BOOL)isLeft space:(CGFloat)space {

    NSDictionary *dic = @{NSFontAttributeName : font};
    
    CGSize textSize = [text boundingRectWithSize:[[UIScreen mainScreen] bounds].size
                                         options:(NSStringDrawingUsesLineFragmentOrigin |
                                                  NSStringDrawingTruncatesLastVisibleLine)
                                      attributes:dic context:nil].size;
    
    UIButton *button = [HQUIKit hq_buttonWithImageNamed:named titleText:text textColor:textColor font:font];
    button.frame = CGRectMake(0, 0, textSize.width + space + button.imageView.image.size.width < 20 ? 20 : textSize.width + space + button.imageView.image.size.width, 40);
    
    if (isLeft) {
    
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -space/2.0f, 0, space/2.0f)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, space/2.0f, 0, -space/2.0f)];
        
    } else {
    
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, space/2.0f + textSize.width, 0, -space/2.0f - textSize.width)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -space/2.0f - button.imageView.image.size.width, 0, space/2.0f + button.imageView.image.size.width)];
        
    }
    
    return button;
    
    
}


@end
