//
//  HQPhotoBrowser.h
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/4.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HQPhotoBrowserPageControlStyle) {

    HQPhotoBrowserPageControlStyleTitle = 1,
    HQPhotoBrowserPageControlStyleNormal = 2,
    HQPhotoBrowserPageControlStyleNone = 3
    
};

@class HQPhotoBrowser;
@protocol HQPhotoBrowserDelegate <NSObject>

@required

- (NSInteger)numberOfPhotosInPhotoBrowser:(HQPhotoBrowser *)photoBrowser;

@optional

- (CGFloat)photoSpacingInPhotoBrowser:(HQPhotoBrowser *)photoBrowser;

- (HQPhotoBrowserPageControlStyle)pageStyleInPhotoBrowser:(HQPhotoBrowser *)photoBrowser;

- (UIImage *)photoBrowser:(HQPhotoBrowser *)photoBrowser thumbnailImageForIndex:(NSInteger)index;

- (NSString *)photoBrowser:(HQPhotoBrowser *)photoBrowser thumbnailImageUrlStringForIndex:(NSInteger)index;


@end

@interface HQPhotoBrowser : UIViewController

@property (nonatomic, weak) id <HQPhotoBrowserDelegate> delegate;

@property (nonatomic, weak) UIViewController *q_presentingViewController;

- (instancetype)initWithPresentingViewController:(UIViewController *)viewController delegate:(id<HQPhotoBrowserDelegate>)delegate;

- (void)show;

- (void)showWithIndex:(NSInteger)index;

@end
