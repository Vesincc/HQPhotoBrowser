//
//  HQPhotoBrowserCollectionViewCell.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/4.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQPhotoBrowserCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "HQPhotoProgressView.h"

@interface HQPhotoBrowserCollectionViewCell() <UIScrollViewDelegate> {
    
}

@property (nonatomic, strong) HQPhotoProgressView *progress;

@end

@implementation HQPhotoBrowserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.scrollView];
        self.scrollView.delegate = self;
        self.scrollView.maximumZoomScale = 2.0f;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        
        [self.scrollView addSubview:self.imageView];
        self.imageView.clipsToBounds = YES;
        
        self.progress = [[HQPhotoProgressView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        self.progress.progress = 0.f;
        [self addSubview:self.progress];


        
    }
    return self;
}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
    
        _scrollView = [[UIScrollView alloc] init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        tap.numberOfTapsRequired = 2;
        [_scrollView addGestureRecognizer:tap];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction)];
        [_scrollView addGestureRecognizer:tap1];
        
        [tap1 requireGestureRecognizerToFail:tap];
        
    }
    
    return _scrollView;
    
}

- (UIImageView *)imageView {

    if (!_imageView) {
    
        _imageView = [[UIImageView alloc] init];


        
    }

    return _imageView;
    
}

- (CGRect)fitFrame {

    UIImage *image = self.imageView.image ? self.imageView.image : nil;
    
    if (image == nil) {
    
        return CGRectZero;
        
    }
    
    if (image.size.width < self.scrollView.bounds.size.width) {
    
        CGSize size = image.size;
        
        CGFloat y = self.scrollView.bounds.size.height - size.height > 0 ? (self.scrollView.bounds.size.height - size.height) * 0.5f : 0;
        
        return CGRectMake((self.scrollView.bounds.size.width - size.width)/2.0f, y, size.width, size.height);
        
    } else {
    
        CGFloat width = self.scrollView.bounds.size.width;
        CGFloat scale = image.size.height / image.size.width;
        
        CGSize size = CGSizeMake(width, width * scale);
        
        CGFloat y = self.scrollView.bounds.size.height - size.height > 0 ? (self.scrollView.bounds.size.height - size.height) * 0.5f : 0;
        
        return CGRectMake(0, y, width, width * scale);
        
    }
    
}

- (void)updateLayout {

    self.scrollView.frame = self.bounds;
    [self.scrollView setZoomScale:1.0f animated:NO];
    self.scrollView.contentSize = [self fitFrame].size;
    self.progress.alpha = 0;
    self.imageView.frame = [self fitFrame];

}

- (void)setImage:(UIImage *)image {
    
    self.imageView.image = image;
    [self updateLayout];

}

- (void)setImageUrl:(NSString *)url {
    
    self.progress.progress = 0;
    self.progress.alpha = 1;
    
    __weak typeof(self) WeakSelf = self;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            WeakSelf.progress.progress = (float)receivedSize/(float)expectedSize;
        });
        
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        [WeakSelf updateLayout];
        
    }];
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    return self.imageView;
    
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {

    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    self.imageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
    
    
}

- (void)singleTapAction {

    UIViewController *vc = [self getCurrentViewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)tapAction {

    CGFloat scale = self.scrollView.zoomScale;
    
    if (scale > 1.2) {
    
        [self.scrollView setZoomScale:1 animated:YES];
        
    } else {
    
        [self.scrollView setZoomScale:2 animated:YES];
        
    }
    
    
}

- (UIViewController *)getCurrentViewController {
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                
                window = tmpWin;
                break;
            
            }
        
        }
    
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
    
        result = nextResponder;
        
    } else {
    
        result = window.rootViewController;
        
    }
    
    return result;
}

@end
