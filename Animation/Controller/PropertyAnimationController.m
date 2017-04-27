//
//  PropertyAnimationController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "PropertyAnimationController.h"
#import "NavigationLiveRoomCountView.h"
#import "CircleLoadingView.h"
#import "MMProgressView.h"

@interface PropertyAnimationController ()

@property(nonatomic, strong) NavigationLiveRoomCountView *countView;
@property (nonatomic, strong) CircleLoadingView *circleLoadingView;

@end

@implementation PropertyAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:kNetEaseRedColor];
    [self configureleftBarButtonItem];
    
    CGFloat margin = 10.f;
    // cicrle loading view
    _circleLoadingView = [[CircleLoadingView alloc] initWithFrame:CGRectMake(10, 80, 25, 25)];
    [self.view addSubview:_circleLoadingView];
    
    MMProgressView *planetProgressView = [MMProgressView progressViewWithType:MMProgressViewTypePlanetRotation];
    planetProgressView.frame = CGRectMake(_circleLoadingView.right + margin, _circleLoadingView.top, 144.f, 144.f);
    [self.view addSubview:planetProgressView];
    [planetProgressView startAnimating];
    planetProgressView.backgroundColor = [UIColor cyanColor];
    
    MMProgressView *progressView = [MMProgressView progressViewWithType:MMProgressViewTypeTwoDots];
    progressView.frame = CGRectMake(_circleLoadingView.left, _circleLoadingView.bottom + margin, 144.f, 144.f);
    [self.view addSubview:progressView];
    [progressView startAnimating];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [progressView stopAnimating];
//    });
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate {
    [_countView animate];
    
    [_circleLoadingView setState:CircleViewStaeLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_circleLoadingView setState:CircleViewStaeLoadSuccess];
    });
}

#pragma mark - UI method
- (void)configureleftBarButtonItem {
    NSArray *imageNames = @[@"nav_live_room_rolling_first", @"nav_live_room_rolling_second", @"nav_live_room_rolling_third"];
    NSMutableArray *images = [NSMutableArray new];
    [imageNames enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:imageName]];
    }];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    
    _countView = [[NavigationLiveRoomCountView alloc] initWithImage:[UIImage imageNamed:@"nav_live_room_image"] animatedImages:[images copy]];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_countView];
    
    [self.navigationItem setLeftBarButtonItems:@[negativeSpacer, leftBarButtonItem] animated:YES];
}

@end
