//
//  CircleLoadingView.h
//  Animation
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CircleViewStae) {
    CircleViewStaeLoading = 1,
    CircleViewStaeLoadSuccess,
};

@interface CircleLoadingView : UIView

@property (nonatomic, assign) CircleViewStae state;

@end
