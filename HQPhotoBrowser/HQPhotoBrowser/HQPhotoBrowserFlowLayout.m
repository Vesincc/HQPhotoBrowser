//
//  HQPhotoBrowserFlowLayout.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/5.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQPhotoBrowserFlowLayout.h"

@interface HQPhotoBrowserFlowLayout() {

    CGFloat minPage;

}

@end

@implementation HQPhotoBrowserFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        minPage = 0;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return self;
}

- (NSString *)lastPageString {

    if (!_lastPageString) {
    
        _lastPageString = [NSString stringWithFormat:@"%lf", round(self.collectionView.contentOffset.x / [self getPageWidth])];
        
    }
    
    return _lastPageString;
    
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat page = round(proposedContentOffset.x / [self getPageWidth]);
    
    if ([self.lastPageString floatValue] == 0 || [self.lastPageString floatValue] == [self getMaxPage]) {
    
        if ([self.lastPageString floatValue] == 0 && velocity.x > .2f) {
            
            page = 1;
            
        } else if ([self.lastPageString floatValue] == [self getMaxPage] && velocity.x < -.2f) {
            
            page = [self getMaxPage] - 1;
            
        } else {
        
            page = [self.lastPageString floatValue];
            
        }
        
        self.lastPageString = [NSString stringWithFormat:@"%lf", page];
        
    } else {
    
        BOOL flag = NO;
        
        if (velocity.x > .2f) {
            
            page += 1;
            
        } else if (velocity.x < .2f) {
        
            page -= 1;
            
        } else {
        
            flag = YES;
            
        }
        
        if (!flag) {
        
            if (page > [self.lastPageString floatValue]) {
                
                page = [self.lastPageString floatValue] + 1;
                
            } else if (page < [self.lastPageString floatValue]) {
                
                page = [self.lastPageString floatValue] - 1;
                
            }
            
            page = page > [self getMaxPage] ? [self getMaxPage] : page;
            
            self.lastPageString = [NSString stringWithFormat:@"%lf", page];
            
        } else {
        
            return CGPointMake([self.lastPageString floatValue] * [self getPageWidth], 0);
            
        }
        
    }

    return CGPointMake(page * [self getPageWidth], 0);
    
}

- (CGFloat)getPageWidth {

    return self.itemSize.width + self.minimumLineSpacing;
    
}

- (CGFloat)getMaxPage {

    CGFloat width = self.collectionView.contentSize.width;
    
    if (!width) {
        
        return .0f;
        
    }
    
    width += self.minimumLineSpacing;
    
    return round((width / [self getPageWidth]) - 1);
    
}

@end
