//
//  NavigationLiveRoomCountView.m
//  Animation
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "NavigationLiveRoomCountView.h"

@interface NavigationLiveRoomCountView () <CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSArray *animatedImages;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation NavigationLiveRoomCountView

- (instancetype)initWithImage:(UIImage *)image animatedImages:(NSArray *)animatedImages {
    return [self initWithImage:image animatedImages:animatedImages frame:CGRectMake(0, 0, 44, 44)];
}

- (instancetype)initWithImage:(UIImage *)image animatedImages:(NSArray *)animatedImages frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _animatedImages = [animatedImages copy];
        _imageView = [UIImageView new];
        CGFloat inset = 6.f;
        CGRect imageViewFrame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(inset, inset, inset, inset));
        _imageView.frame = imageViewFrame;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = image;
        [self addSubview:_imageView];
        
        _countLabel = [UILabel new];
        _countLabel.backgroundColor = [UIColor clearColor];
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.text = @"15";
        _countLabel.font = [UIFont systemFontOfSize:11.f];
        [_countLabel sizeToFit];
        [self addSubview:_countLabel];
        _countLabel.center = CGPointMake(CGRectGetMinX(imageViewFrame), CGRectGetMinY(imageViewFrame) + CGRectGetHeight(imageViewFrame)/2);
    }
    return self;
}

- (void)animate {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    NSMutableArray *tempArray = [NSMutableArray new];
    [_animatedImages enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArray addObject:(__bridge id)image.CGImage];
    }];
    [animation setKeyPath:@"contents"];
    [animation setValues:tempArray];
    animation.repeatDuration = 2.f;
    animation.repeatCount = 5;
    [animation setValue:@"Countdown" forKey:@"name"];
    [_imageView.layer addAnimation:animation forKey:nil];
    
    CGFloat translateX = 8.f;
    [UIView animateWithDuration:0.2f delay:0.8f usingSpringWithDamping:0.4 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _countLabel.transform = CGAffineTransformTranslate(_countLabel.transform, -translateX, 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:0.f usingSpringWithDamping:0.1 initialSpringVelocity:50 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _countLabel.transform = CGAffineTransformTranslate(_countLabel.transform, translateX, 0);
        } completion:nil];
    }];
}

@end
