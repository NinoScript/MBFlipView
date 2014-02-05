//
//  MBFlipView.m
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14, based on work by Rebekah Claypool.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import "MBFlipView.h"

@interface MBFlipView ()
@property(strong, nonatomic) NSArray* viewsAndTransitions;
@end

@implementation MBFlipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewsAndTransitions = @[
            @{
                @"view" : @"primaryView",
                @"transition" : @(UIViewAnimationOptionTransitionFlipFromLeft)
            },
            @{
                @"view" : @"secondaryView",
                @"transition" : @(UIViewAnimationOptionTransitionFlipFromRight)
            }
        ];
        self.spinTime = 1.0;
    }
    return self;
}

- (void)setPrimaryView:(UIView*)primaryView
{
    _primaryView = primaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.primaryView setFrame:frame];
    [self addSubview:self.primaryView];
}

- (void)setSecondaryView:(UIView*)secondaryView
{
    _secondaryView = secondaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.secondaryView setFrame:frame];
    [self addSubview:self.secondaryView];
    [self sendSubviewToBack:self.secondaryView];
}

- (void)flipWithCompletion:(void (^)(BOOL))completion
{
    UIView* from = [self valueForKey:self.viewsAndTransitions[0][@"view"]];
    UIView* next = [self valueForKey:self.viewsAndTransitions[1][@"view"]];
    NSUInteger transitionOptions = [self.viewsAndTransitions[0][@"transition"] integerValue];
    [UIView transitionFromView:from
                        toView:next
                      duration:self.spinTime
                       options:transitionOptions
                    completion:^(BOOL finished)
    {
        if (finished) {
            self.viewsAndTransitions = [[self.viewsAndTransitions reverseObjectEnumerator] allObjects];
        }
        if (completion)
            completion(finished);
    }];
}

@end
