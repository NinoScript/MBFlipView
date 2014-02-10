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
                @"view" : @"primary",
                @"transition" : @(UIViewAnimationOptionTransitionFlipFromLeft)
            },
            @{
                @"view" : @"secondary",
                @"transition" : @(UIViewAnimationOptionTransitionFlipFromRight)
            }
        ];
        self.spinTime = 1.0;
    }
    return self;
}

- (void)setPrimary:(UIViewController*)viewController
{
    _primary = viewController;
    [self setViewController:_primary];
}

- (void)setSecondary:(UIViewController*)viewController
{
    _secondary = viewController;
    [self setViewController:_secondary];
    [self sendSubviewToBack:viewController.view];
}

- (void)setViewController:(UIViewController*)viewController
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [viewController.view setFrame:frame];
    [self addSubview:viewController.view];
}

- (void)flipWithCompletion:(void (^)(BOOL))completion
{
    UIViewController* from = [self valueForKey:self.viewsAndTransitions[0][@"view"]];
    UIViewController* next = [self valueForKey:self.viewsAndTransitions[1][@"view"]];
    NSUInteger transitionOptions = [self.viewsAndTransitions[0][@"transition"] integerValue];

    [from viewWillDisappear:YES];
    [next viewWillAppear:YES];

    [UIView transitionFromView:from.view
                        toView:next.view
                      duration:self.spinTime
                       options:transitionOptions
                    completion:^(BOOL finished)
    {
        if (finished) {
            [from viewDidDisappear:YES];
            [next viewDidAppear:YES];
            self.viewsAndTransitions = [[self.viewsAndTransitions reverseObjectEnumerator] allObjects];
        }
        if (completion)
            completion(finished);
    }];
}

@end
