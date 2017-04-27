//
//  CircleLoadingView.m
//  Animation
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "CircleLoadingView.h"

@interface CircleLoadingView ()

@property (nonatomic, strong) CAShapeLayer *incompleteLayer;
@property (nonatomic, strong) CAShapeLayer *checkMarkLayer;

@end

@implementation CircleLoadingView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    CGFloat diameter = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, diameter, diameter)];
    
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.path = bezierPath.CGPath;
    layer.strokeColor = [UIColor lightGrayColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2;
    
    CGPoint circleCenter = CGPointMake(CGRectGetWidth(self.frame)/2.f, CGRectGetHeight(self.frame)/2.f);
    UIBezierPath *incompletePath = [UIBezierPath bezierPathWithArcCenter:circleCenter radius:diameter/2.f startAngle:M_PI_2 endAngle:0 clockwise:YES];
    _incompleteLayer = [CAShapeLayer layer];
    _incompleteLayer.frame = self.bounds;
    _incompleteLayer.path = incompletePath.CGPath;
    _incompleteLayer.strokeColor = [UIColor redColor].CGColor;
    _incompleteLayer.fillColor = [UIColor clearColor].CGColor;
    _incompleteLayer.lineWidth = 2;
    [layer addSublayer:_incompleteLayer];
    
    UIBezierPath *checkMarkPath = [UIBezierPath bezierPath];
    [checkMarkPath moveToPoint:CGPointMake(0.2, 0.5)];
    [checkMarkPath addLineToPoint:CGPointMake(0.46, 0.75)];
    [checkMarkPath addLineToPoint:CGPointMake(0.75, 0.2)];
    checkMarkPath.lineJoinStyle = kCGLineJoinRound;
    checkMarkPath.lineCapStyle = kCGLineCapRound;
    
    CGFloat scale = CGRectGetWidth(self.frame)*1;
    [checkMarkPath applyTransform:CGAffineTransformMakeScale(scale, scale)];
    
    _checkMarkLayer = [CAShapeLayer layer];
    _checkMarkLayer.frame = self.bounds;
    _checkMarkLayer.path = checkMarkPath.CGPath;
    _checkMarkLayer.fillColor = [UIColor clearColor].CGColor;
    _checkMarkLayer.strokeColor = [UIColor clearColor].CGColor;
    _checkMarkLayer.lineWidth = 2.f;
    [self.layer addSublayer:_checkMarkLayer];
}

- (void)roateLayer:(CAShapeLayer *)shapeLayer {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.speed = 1.5;
    animation.duration = 1.f;
    animation.repeatCount = INFINITY;
    animation.byValue = @(M_PI * 2);
    [shapeLayer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)loadingAnimation {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _checkMarkLayer.strokeColor = [UIColor clearColor].CGColor;
    [CATransaction commit];
    
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.strokeColor = [UIColor lightGrayColor].CGColor;
    
    [self roateLayer:_incompleteLayer];
}

- (void)successAnimation {
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.strokeColor = [UIColor redColor].CGColor;
    
    [_incompleteLayer removeAllAnimations];
    
    [self drawCheckMark];
}

- (void)drawCheckMark {
    _checkMarkLayer.strokeColor = [UIColor redColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.duration = 1.f;
    animation.speed = 1.2;
    animation.fillMode = kCAFillModeForwards;
    [_checkMarkLayer addAnimation:animation forKey:@"Circle"];
}

#pragma mark - getters and setters
- (void)setState:(CircleViewStae)state {
    switch (state) {
        case CircleViewStaeLoading:
            [self loadingAnimation];
            break;
        case CircleViewStaeLoadSuccess:
            [self successAnimation];
            break;
            
        default:
            break;
    }
}

@end
