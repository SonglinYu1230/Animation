//
//  MMProgressView.m
//  Animation
//
//  Created by why001 on 17/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "MMProgressView.h"

@interface MMProgressView ()

@property (nonatomic, assign) MMProgressViewType progressViewType;
// MMProgressViewTypeTwoDots
@property (nonatomic, strong) CAShapeLayer *leftCircleLayer;
@property (nonatomic, strong) CAShapeLayer *rightCircleLayer;
// MMProgressViewTypePlanetRotation
@property (nonatomic, strong) CAShapeLayer *loopLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *CircleLayer1;
@property (nonatomic, strong) CAShapeLayer *CircleLayer2;
@property (nonatomic, strong) CAShapeLayer *CircleLayer3;

@end

@implementation MMProgressView

+ (MMProgressView *)progressViewWithType:(MMProgressViewType)type {
    MMProgressView *progressView = [[MMProgressView alloc] initWithFrame:CGRectZero type:type];
    return progressView;
}

- (instancetype)initWithFrame:(CGRect)frame type:(MMProgressViewType)type {
    CGSize size = [self sizeOfSpecificType:type];
    frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
    if (self = [super initWithFrame:frame]) {
        self.progressViewType = type;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame type:MMProgressViewTypeDefault];
}

- (void)setFrame:(CGRect)frame {
    CGSize size = [self sizeOfSpecificType:_progressViewType];
    frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (_progressViewType) {
        case MMProgressViewTypeDefault:
            
            break;
        case MMProgressViewTypeTwoDots:
            [self layoutTypeTwoDotsSubviews];
            break;
        case MMProgressViewTypePlanetRotation:
            [self layoutTypePlanetRotation];
            break;
        default:
            break;
    }
}

- (void)layoutTypeTwoDotsSubviews {
    CGFloat circleDiameter = 8.f;
    _leftCircleLayer.frame = CGRectMake(0.f, circleDiameter, circleDiameter, circleDiameter);
    _rightCircleLayer.frame = CGRectMake(circleDiameter * 2, circleDiameter, circleDiameter, circleDiameter);
}

- (void)layoutTypePlanetRotation {

}

- (void)startAnimating {
    switch (_progressViewType) {
        case MMProgressViewTypeDefault:
            
            break;
        case MMProgressViewTypeTwoDots:
            [self startTwoDotsAnimating];
            break;
        case MMProgressViewTypePlanetRotation:
            break;
        default:
            break;
    }
}

- (void)stopAnimating {
    [self.layer removeAllAnimations];
}

#pragma mark - setup method

- (void)setupTwoDots {
    CGFloat circleDiameter = 8.f;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, circleDiameter, circleDiameter) cornerRadius:circleDiameter/2];
    
    _leftCircleLayer = [CAShapeLayer layer];
    _leftCircleLayer.path = path.CGPath;
    _leftCircleLayer.fillColor = [UIColor brownColor].CGColor;
    [self.layer addSublayer:_leftCircleLayer];
    
    _rightCircleLayer = [CAShapeLayer layer];
    _rightCircleLayer.path = path.CGPath;
    _rightCircleLayer.fillColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:_rightCircleLayer];
}

- (void)setupPlanetRotation {
    CGFloat loopDiameter = self.width;
    UIBezierPath *loopPath = [UIBezierPath bezierPathWithOvalInRect:self.frame];
    
    _loopLayer = [CAShapeLayer layer];
    _loopLayer.frame = self.bounds;
    _loopLayer.path = loopPath.CGPath;
    _loopLayer.fillColor = [UIColor clearColor].CGColor;
    _loopLayer.strokeColor = [UIColor darkGrayColor].CGColor;
//    _loopLayer.lineWidth = 
//    _loopLayer.anchorPoint = CGPointMake(0.5, 0.5)
    _loopLayer.transform = CATransform3DMakeRotation(M_PI_2/3.f*2, 1, 0, 0); //CATransform3DRotate(_loopLayer.transform, M_PI_2/3.f*2, 1, 0, 0);
    [self.layer addSublayer:_loopLayer];
    
    CGFloat circleDiameter = loopDiameter - 2 * _loopLayer.lineWidth;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.f, 0.f, circleDiameter, circleDiameter)];
    
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.frame = self.bounds;
    _circleLayer.path = circlePath.CGPath;
    _circleLayer.fillColor = [UIColor clearColor].CGColor;
    _circleLayer.strokeColor = [UIColor darkGrayColor].CGColor;
    [self.layer addSublayer:_circleLayer];
}

- (CGSize)sizeOfSpecificType:(MMProgressViewType)progressViewType {
    CGSize size = self.frame.size;
    switch (progressViewType) {
        case MMProgressViewTypeDefault:
            break;
        case MMProgressViewTypeTwoDots:
            size =  CGSizeMake(24.f, 24.f);
            break;
        case MMProgressViewTypePlanetRotation:
            size = CGSizeMake(30.f, 30.f);
            break;
        default:
            break;
    }
    return size;
}


#pragma mark - different view type animation

- (void)startTwoDotsAnimating {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.speed = 1.2;
    animation.duration = 1.f;
    animation.repeatCount = INFINITY;
    animation.byValue = @(M_PI * 2);
    [self.layer addAnimation:animation forKey:@"rotateAnimation"];
}

#pragma mark setters

- (void)setProgressViewType:(MMProgressViewType)progressViewType {
    _progressViewType = progressViewType;
    switch (progressViewType) {
        case MMProgressViewTypeDefault:
            break;
        case MMProgressViewTypeTwoDots:
            [self setupTwoDots];
            break;
        case MMProgressViewTypePlanetRotation:
            [self setupPlanetRotation];
            break;
        default:
            break;
    }
}

@end
