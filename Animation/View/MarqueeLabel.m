//
//  MarqueeLabel.m
//  Animation
//
//  Created by why001 on 28/07/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "MarqueeLabel.h"
#import "UIView+YYAdd.h"
#import <QuartzCore/QuartzCore.h>

@interface MarqueeLabel ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGSize textSize;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation MarqueeLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:frame];
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        _label.backgroundColor = [UIColor blueColor];
        [self addSubview:_label];
        
        _shapeLayer = [CAShapeLayer layer];
        self.layer.mask = _shapeLayer;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    _shapeLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    
    [self startAnimate];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (!newWindow) {
        _isAnimating = NO;
    }
}

- (void)didMoveToWindow {
    if (!self.window) {
        _isAnimating = NO;
    }
    else {
        [self startAnimate];
    }
}

- (void)translateLabelLayerWithDuration:(NSTimeInterval)duration {
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.duration = 10;
    animation.repeatCount = 10;
    animation.autoreverses = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:-_label.width];
    [CATransaction setCompletionBlock:^{
        _label.layer.frame = CGRectMake(self.width, 0, _label.width, _label.height);
        [self translateLabelLayerWithDuration:10];
    }];
    [_label.layer addAnimation:animation forKey:@"animateLayer"];
    [CATransaction commit];
}

- (void)animateLabel {

}

- (void)startAnimate {
    [_label sizeToFit];
    _textSize = [_label intrinsicContentSize];
    NSLog(@"%@", NSStringFromCGSize(_textSize));
    
    if (self.width > 0 && _textSize.width > self.width) {
        if (!_isAnimating) {
            _isAnimating = YES;
            NSTimeInterval duration = _textSize.width / self.width * 4;
            _label.frame = CGRectMake(0.f, 0.f, _label.width, _label.height);
            [self animateWithDuration:duration delay:0.3];
        }
    }
}

- (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay{
    CFTimeInterval startTime = CACurrentMediaTime();
    [UIView animateWithDuration:duration delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _label.frame = CGRectMake(-_textSize.width, 0, _label.width, _label.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             CFTimeInterval endTime = CACurrentMediaTime();
                             CFTimeInterval consumingTime = endTime - startTime;
                             NSLog(@"耗时：%@", @(consumingTime));
                             _label.frame = CGRectMake(self.width, 0, _label.width, _label.height);
                             [self animateWithDuration:duration delay:0];
                         }
                     }];
}

#pragma mark - getters and setters

- (void)setText:(NSString *)text {
    _label.text = text;
}

@end
