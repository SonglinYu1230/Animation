//
//  MarqueeLabel.h
//  Animation
//
//  Created by why001 on 28/07/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarqueeLabel : UIView

@property (nonatomic, copy) NSString *text;

//@property(nullable, nonatomic,copy)   NSString           *text;            // default is nil
//@property(null_resettable, nonatomic,strong) UIFont      *font;            // default is nil (system font 17 plain)
//@property(null_resettable, nonatomic,strong) UIColor     *textColor;       // default is nil (text draws black)
//@property(nullable, nonatomic,strong) UIColor            *shadowColor;     // default is nil (no shadow)
//@property(nonatomic)        CGSize             shadowOffset;    // default is CGSizeMake(0, -1) -- a top shadow
//@property(nonatomic)        NSTextAlignment    textAlignment;   // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
//@property(nonatomic)        NSLineBreakMode    lineBreakMode;   // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text
//
//// the underlying attributed string drawn by the label, if set, the label ignores the properties above.
//@property(nullable, nonatomic,copy)   NSAttributedString *attributedText NS_AVAILABLE_IOS(6_0);  // default is nil
//
//// the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property
//
//@property(nullable, nonatomic,strong)               UIColor *highlightedTextColor; // default is nil
//@property(nonatomic,getter=isHighlighted) BOOL     highlighted;          // default is NO
//
//@property(nonatomic,getter=isUserInteractionEnabled) BOOL userInteractionEnabled;  // default is NO
//@property(nonatomic,getter=isEnabled)                BOOL enabled;                 // default is YES. changes how the label is drawn
//
//// this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
//// if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
//// truncated using the line break mode.
//
//@property(nonatomic) NSInteger numberOfLines;
//
//// these next 3 property allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
//// and to specify how the text baseline moves when it needs to shrink the font.
//
//@property(nonatomic) BOOL adjustsFontSizeToFitWidth;         // default is NO
//@property(nonatomic) UIBaselineAdjustment baselineAdjustment; // default is UIBaselineAdjustmentAlignBaselines
//@property(nonatomic) CGFloat minimumScaleFactor NS_AVAILABLE_IOS(6_0); // default is 0.0
//
//
//// Tightens inter-character spacing in attempt to fit lines wider than the available space if the line break mode is one of the truncation modes before starting to truncate.
//// The maximum amount of tightening performed is determined by the system based on contexts such as font, line width, etc.
//@property(nonatomic) BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE_IOS(9_0); // default is NO
//
//- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;
//- (void)drawTextInRect:(CGRect)rect;

@end
