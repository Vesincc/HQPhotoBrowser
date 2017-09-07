//
//  HQPhotoBrowser.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/4.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQPhotoBrowser.h"
#import "HQPhotoBrowserCollectionViewCell.h"
#import "HQPhotoBrowserFlowLayout.h"
#import "HQPhotoBrowserScaleAnimator.h"

@interface HQPhotoBrowser () <UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate> {

    CGFloat photoSpacing;
    HQPhotoBrowserPageControlStyle pageControlStyle;
    
}

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) HQPhotoBrowserFlowLayout *flowLayout;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) HQPhotoBrowserScaleAnimator *presentAnimation;

@property (nonatomic, strong) UILabel *titlePageControl;
@property (nonatomic, strong) UIPageControl *normalPageControl;

@property (nonatomic, assign) NSInteger count;

@end

@implementation HQPhotoBrowser

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    if ([self.delegate respondsToSelector:@selector(photoSpacingInPhotoBrowser:)]) {
    
        photoSpacing = [self.delegate photoSpacingInPhotoBrowser:self];
        
    } else {
    
        photoSpacing = 30.f;
        
    }
    
    self.count = [self.delegate numberOfPhotosInPhotoBrowser:self];
    
    self.flowLayout = [[HQPhotoBrowserFlowLayout alloc] init];
    self.flowLayout.minimumLineSpacing = photoSpacing;
    self.flowLayout.itemSize = self.view.bounds.size;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
//    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[HQPhotoBrowserCollectionViewCell class] forCellWithReuseIdentifier:@"photoBrowserCell"];
    [self.collectionView setContentOffset:CGPointMake(self.currentIndex * (self.view.bounds.size.width + photoSpacing), 0)];
    [self.view addSubview:self.collectionView];
    
    self.presentAnimation = [HQPhotoBrowserScaleAnimator new];
    
    if ([self.delegate respondsToSelector:@selector(pageStyleInPhotoBrowser:)]) {
    
        pageControlStyle = [self.delegate pageStyleInPhotoBrowser:self];
        
    } else {
    
        pageControlStyle = HQPhotoBrowserPageControlStyleNormal;
        
    }
    
    if (pageControlStyle == HQPhotoBrowserPageControlStyleTitle) {
        
        [self titlePageControl];
    
    } else if (pageControlStyle == HQPhotoBrowserPageControlStyleNormal) {
    
        [self normalPageControl];
        
    }
    
}

- (UILabel *)titlePageControl {

    if (!_titlePageControl) {
    
        _titlePageControl = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 30)];
        _titlePageControl.text = [NSString stringWithFormat:@"%ld / %ld", self.currentIndex + 1, self.count];
        _titlePageControl.textColor = [UIColor whiteColor];
        _titlePageControl.font = [UIFont systemFontOfSize:18];
        _titlePageControl.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_titlePageControl];
        
    }
    
    return _titlePageControl;
    
}

- (UIPageControl *)normalPageControl {

    if (!_normalPageControl) {
    
        _normalPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 20 - 10, self.view.bounds.size.width, 20)];
        _normalPageControl.numberOfPages = self.count;
        _normalPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _normalPageControl.pageIndicatorTintColor = [UIColor grayColor];
        _normalPageControl.userInteractionEnabled = NO;
        _normalPageControl.currentPage = self.currentIndex;
        
        [self.view addSubview:_normalPageControl];
        
        
    }
    
    return _normalPageControl;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    self.currentIndex = round((scrollView.contentOffset.x / (self.view.bounds.size.width + photoSpacing)));
    
    if (pageControlStyle == HQPhotoBrowserPageControlStyleTitle) {
        
        _titlePageControl.text = [NSString stringWithFormat:@"%ld / %ld", self.currentIndex + 1, self.count];
        
    } else if (pageControlStyle == HQPhotoBrowserPageControlStyleNormal) {
    
        [_normalPageControl setCurrentPage:self.currentIndex];
        
    }
    
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.delegate numberOfPhotosInPhotoBrowser:self];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HQPhotoBrowserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoBrowserCell" forIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(photoBrowser:thumbnailImageForIndex:)]) {
    
        [cell setImage:[self.delegate photoBrowser:self thumbnailImageForIndex:indexPath.item]];
        
    } else {
    
        [cell setImageUrl:[self.delegate photoBrowser:self thumbnailImageUrlStringForIndex:indexPath.item]];
        
    }
    
    return cell;
    
}

#pragma mark - init

- (instancetype)initWithPresentingViewController:(UIViewController *)viewController delegate:(id<HQPhotoBrowserDelegate>)delegate {

    self = [super init];
    
    if (self) {
    
        self.q_presentingViewController = viewController;
        self.delegate = delegate;
        
    }
    
    return self;
    
}

- (void)setDelegate:(id<HQPhotoBrowserDelegate>)delegate {

    _delegate = delegate;
    
    if ([_delegate respondsToSelector:@selector(photoSpacingInPhotoBrowser:)]) {
        
        photoSpacing = [_delegate photoSpacingInPhotoBrowser:self];
        self.flowLayout.minimumLineSpacing = photoSpacing;
        
    }

}

#pragma mark - show

- (void)show {
    
    self.transitioningDelegate = self;

    [self.collectionView setContentOffset:CGPointMake(self.currentIndex * (self.view.bounds.size.width + photoSpacing), 0)];
    [self.q_presentingViewController presentViewController:self animated:YES completion:nil];
    self.flowLayout.lastPageString = [NSString stringWithFormat:@"%ld", self.currentIndex];
    
}

- (void)showWithIndex:(NSInteger)index {

    self.currentIndex = index;
    [self show];
    
}

- (BOOL)prefersStatusBarHidden {

    return YES;
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    self.presentAnimation.option = HQAnimationOptionStylePresent;
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    self.presentAnimation.option = HQAnimationOptionStyleDismiss;
    return self.presentAnimation;
    
}


@end
