//
//  MMProgressView.h
//  Animation
//
//  Created by why001 on 17/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MMProgressViewType) {
    MMProgressViewTypeDefault = 1,
    MMProgressViewTypeTwoDots,
    MMProgressViewTypePlanetRotation,
};

@interface MMProgressView : UIView

+ (MMProgressView *)progressViewWithType:(MMProgressViewType)type;
- (void)startAnimating;
- (void)stopAnimating;

@end
