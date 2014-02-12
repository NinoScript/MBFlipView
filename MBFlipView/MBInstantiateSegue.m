//
//  MBInstantiateSegue.m
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import "MBInstantiateSegue.h"

@implementation MBInstantiateSegue

- (void)perform
{
    id<InstantiatedSegueStore> store = self.sourceViewController;
    if (![[store class] conformsToProtocol:@protocol(InstantiatedSegueStore)]) {
        @throw [NSException exceptionWithName:@"source ViewController doesn't conform to protocol SeguedInstantiationStore"
                                       reason:@"When using an MBInstantiateAndStoreSegue, your source ViweController should conform to the protocol"
                                     userInfo:nil];
    }
    [store.instantiatedSegues setObject:self.destinationViewController
                                 forKey:self.identifier];
    [self.sourceViewController addChildViewController:self.destinationViewController];
}

@end
