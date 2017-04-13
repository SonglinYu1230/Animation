//
//  MMTabBarController.m
//  Animation
//
//  Created by why001 on 12/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "MMTabBarController.h"

@interface MMTabBarController () <UITabBarControllerDelegate>

@end

@implementation MMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    [tabBarController.view.layer addAnimation:transition forKey:nil];
}

@end
