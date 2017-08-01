//
//  GroupAnimationController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "GroupAnimationController.h"
#import "Masonry.h"
#import "MarqueeLabel.h"

@interface GroupAnimationController ()

@end

@implementation GroupAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.4f];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *cyanView = [UIView new];
    cyanView.backgroundColor = [UIColor cyanColor];
    [scrollView addSubview:cyanView];
    [cyanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(64.f);
        make.height.equalTo(@144.f);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"我是跑马灯我跑马灯";
    //    label.text = @"我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯";
    label.backgroundColor = [UIColor lightGrayColor];
    [cyanView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.centerY.mas_equalTo(cyanView);
    }];
    
    MarqueeLabel *lengthyLabel = [MarqueeLabel new];
    lengthyLabel.backgroundColor = [UIColor lightGrayColor];
    lengthyLabel.text = @"我是司马登！";
    lengthyLabel.text = @"我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马灯我是跑马马灯我是跑马灯我是跑马灯结束了。";
    [cyanView addSubview:lengthyLabel];
    [lengthyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(cyanView);
        make.leading.mas_equalTo(cyanView).offset(30.f);
        make.trailing.mas_equalTo(cyanView).offset(-30.f);
        make.height.equalTo(@44.f);
    }];
    NSLog(@"%s", __func__);
    NSLog(@"helloooooooooooooooo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
