//
//  HQPhotoBrowserCollectionViewCell.h
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/4.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQPhotoBrowserCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

- (void)setImage:(UIImage *)image;

- (void)setImageUrl:(NSString *)url;

@end
