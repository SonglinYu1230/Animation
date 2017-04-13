//
//  GroupAnimationController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "GroupAnimationController.h"
#import "Masonry.h"

@interface GroupAnimationController ()

@end

@implementation GroupAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.4f];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(200);
    }];
    
    self.navigationController.hidesBarsOnSwipe = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
