//
//  HQPhotoProgressView.m
//  HQPhotoBrowser
//
//  Created by HanQi on 2017/9/5.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "HQPhotoProgressView.h"

@interface HQPhotoProgressView () {

    CAShapeLayer *circleLayer;
    CAShapeLayer *fanshapeLayer;
    
    CGFloat fanshapeR;
    CGFloat circleR;
    
}

@end

@implementation HQPhotoProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = NO;
        
        fanshapeR = 27;
        circleR = 30;
        
        self.backgroundColor = [UIColor clearColor];
        
        CGColorRef strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8].CGColor;
        
        circleLayer = [[CAShapeLayer alloc] init];
        circleLayer.strokeColor = strokeColor;
        circleLayer.fillColor = [UIColor clearColor].CGColor;
        circleLayer.lineWidth = 2.f;
        circleLayer.path = [self makeCirclePath:circleR];
        
        fanshapeLayer = [[CAShapeLayer alloc] init];
        fanshapeLayer.strokeColor = strokeColor;
        fanshapeLayer.fillColor = strokeColor;
        fanshapeLayer.lineWidth = .0f;
        fanshapeLayer.lineCap = kCALineCapRound;
        fanshapeLayer.lineJoin = kCALineJoinRound;
        
        fanshapeLayer.path = [self makeProgressPath:0 radius:fanshapeR];
        
        [self.layer addSublayer:circleLayer];
        [self.layer addSublayer:fanshapeLayer];
        
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    
    if (progress > 1) {
    
        return;
        
    }

    _progress = progress;
    fanshapeLayer.path = [self makeProgressPath:progress radius:fanshapeR];
    
}

- (CGPathRef)makeProgressPath:(CGFloat)progress radius:(CGFloat)radius {

    CGFloat angle = M_PI * 2 * progress;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:self.center];
    
    [path addLineToPoint:CGPointMake(self.center.x, self.bounds.size.height/2.0f - radius)];
    [path addArcWithCenter:self.center radius:radius startAngle:-M_PI/2 endAngle:-M_PI/2 + angle clockwise:YES];
    
    [path closePath];
    
    return path.CGPath;
    
}

- (CGPathRef)makeCirclePath:(CGFloat)radius {
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(self.center.x, self.bounds.size.height/2.0f - radius)];
    [path addArcWithCenter:self.center radius:radius startAngle:-M_PI/2 endAngle:-M_PI/2 + 2*M_PI clockwise:YES];
    
    return path.CGPath;
    
}

@end
