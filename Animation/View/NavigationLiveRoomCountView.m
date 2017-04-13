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

@end

@implementation NavigationLiveRoomCountView

- (instancetype)initWithImage:(UIImage *)image animatedImages:(NSArray *)animatedImages {
    return [self initWithImage:image animatedImages:animatedImages frame:CGRectMake(0, 0, 40, 40)];
}

- (instancetype)initWithImage:(UIImage *)image animatedImages:(NSArray *)animatedImages frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _animatedImages = [animatedImages copy];
        _imageView = [UIImageView new];
        _imageView.frame = frame;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = image;
        [self addSubview:_imageView];
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
}

@end
