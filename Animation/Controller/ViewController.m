//
//  ViewController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonEvent:(UIButton *)sender {
    NSArray *vcs = @[@"PropertyAnimationController", @"GroupAnimationController", @"TransitionAnmationController"];
    [self.navigationController pushViewController:[NSClassFromString(vcs[sender.tag]) new] animated:YES];
}


@end
