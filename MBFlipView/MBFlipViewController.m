//
//  MBFlipViewController.m
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14, based on work by Rebekah Claypool.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import "MBFlipViewController.h"

@interface MBFlipViewController ()
@property(strong, nonatomic) MBFlipView* coinView;
@end

@implementation MBFlipViewController
- (void)flipWithCompletion:(void (^)(BOOL))completion
{
    [self.coinView flipWithCompletion:completion];
}

+ (NSArray*)segues
{
    return @[
        @"primaryView",
        @"secondaryView"
    ];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.instantiatedSegues = [NSMutableDictionary dictionary];

    self.coinView = [[MBFlipView alloc] initWithFrame:self.view.frame];
    self.coinView.spinTime = 1.0;

    for (NSString* segue in [MBFlipViewController segues]) {
        [self performSegueWithIdentifier:segue
                                  sender:self];
        UIViewController* vc = self.instantiatedSegues[segue];
        [self.coinView setValue:vc.view
                         forKey:segue];
    }

    [self.view addSubview:self.coinView];
}

@end
