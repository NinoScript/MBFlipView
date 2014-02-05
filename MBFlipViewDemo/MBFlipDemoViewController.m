//
//  MBFlipDemoViewController.m
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import "MBFlipDemoViewController.h"
#import "MBFlipViewController.h"

@interface MBFlipDemoViewController ()
@property(weak, nonatomic) MBFlipViewController* coin;
@property(weak, nonatomic) MBFlipViewController* test;

@end

@implementation MBFlipDemoViewController

- (IBAction)flip:(UIButton*)sender
{
    sender.userInteractionEnabled = NO;
    [self.coin flipWithCompletion:^(BOOL finished)
    {
        sender.userInteractionEnabled = YES;
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    NSString* segueName = segue.identifier;
    [self setValue:segue.destinationViewController
            forKey:segueName];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[self.test methodSignatureForSelector:@selector(flipWithCompletion:)]];
    invocation.target = self.test;
    invocation.selector = @selector(flipWithCompletion:);
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                 invocation:invocation
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
