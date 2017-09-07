//
//  ViewController.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/4.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "ViewController.h"
#import "HQPhotoBrowser.h"
#import <HQUIKit.h>
#import "HQPhotoProgressView.h"
#import <SDImageCache.h>
#import "HQPhotoBrowserScaleAnimator.h"
@interface ViewController ()<HQPhotoBrowserDelegate>

@property (nonatomic, strong) HQPhotoBrowser *photo;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.photo = [[HQPhotoBrowser alloc] init];
    self.photo.q_presentingViewController = self;
    self.photo.delegate = self;
    
    UIButton *button = [HQUIKit hq_buttonWithBackgroundColor:[UIColor cyanColor]];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    progress = [[HQPhotoProgressView alloc] initWithFrame:self.view.bounds];
//    progress.progress = 0.3;
//    [self.view addSubview:progress];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    
//    });
    
    
    
}

//- (void)viewDidAppear:(BOOL)animated {
//
//    NSTimer *timer = [NSTimer timerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//    
//        progress.progress += 0.1;
//        
//    }];
//    
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    
//}

- (void)add {

    
    
}

- (NSArray *)dataArray {

    if (!_dataArray) {
    
        _dataArray = @[@"http://img.taopic.com/uploads/allimg/111117/1716-11111G1321545.jpg",
                      @"http://upload-images.jianshu.io/upload_images/654237-8488badff679c905.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                      @"http://upload-images.jianshu.io/upload_images/4093530-5043466d7e204da5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                      @"http://upload-images.jianshu.io/upload_images/5927-3f87def320bd65f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
        
        
        
    }
    
    return _dataArray;
    
}

//- (HQPhotoBrowserPageControlStyle)pageStyleInPhotoBrowser:(HQPhotoBrowser *)photoBrowser {
//
//    return HQPhotoBrowserPageControlStyleTitle;
//    
//}

- (CGFloat)photoSpacingInPhotoBrowser:(HQPhotoBrowser *)photoBrowser {

    return 10;
    
}

- (NSInteger)numberOfPhotosInPhotoBrowser:(HQPhotoBrowser *)photoBrowser {

    return self.dataArray.count;
    
}

- (NSString *)photoBrowser:(HQPhotoBrowser *)photoBrowser thumbnailImageUrlStringForIndex:(NSInteger)index {

    return self.dataArray[index];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    
}

- (void)action {

//    [progress removeFromSuperview];

    
    [self.photo showWithIndex:0];
//    [self presentViewController:self.photo animated:YES completion:nil];
    
//    [UIView animateWithDuration:2 animations:^{
//        self.view.frame = CGRectZero;
//    } completion:^(BOOL finished) {
//        
//    }];
    
}


@end
