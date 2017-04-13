//
//  PropertyAnimationController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "PropertyAnimationController.h"
#import "NavigationLiveRoomCountView.h"

@interface PropertyAnimationController ()

@property(nonatomic, strong) NavigationLiveRoomCountView *countView;

@end

@implementation PropertyAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:kNetEaseRedColor];
    [self configureleftBarButtonItem];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_countView animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI method
- (void)configureleftBarButtonItem {
    NSArray *imageNames = @[@"nav_live_room_rolling_first", @"nav_live_room_rolling_second", @"nav_live_room_rolling_third"];
    NSMutableArray *images = [NSMutableArray new];
    [imageNames enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:imageName]];
    }];
    _countView = [[NavigationLiveRoomCountView alloc] initWithImage:[UIImage imageNamed:@"nav_live_room_image"] animatedImages:[images copy]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_countView];
}

@end
