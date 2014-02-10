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
        @"primary",
        @"secondary"
    ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.instantiatedSegues = [NSMutableDictionary dictionary];

    self.coinView = [[MBFlipView alloc] initWithFrame:self.view.frame];
    self.coinView.spinTime = 1.0;

    for (NSString* segue in [MBFlipViewController segues]) {
        [self performSegueWithIdentifier:segue
                                  sender:self];
        UIViewController* vc = self.instantiatedSegues[segue];
        [self.coinView setValue:vc
                         forKey:segue];
    }

    [self.view addSubview:self.coinView];
}

- (void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.coinView.frame = self.view.frame;
    for (NSString* segue in [MBFlipViewController segues]) {
        UIViewController* vc = self.instantiatedSegues[segue];
        vc.view.frame = self.view.frame;
    }
}

@end
