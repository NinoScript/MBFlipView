//
//  MBFlipViewController.h
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14, based on work by Rebekah Claypool.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBFlipView.h"
#import "MBInstantiateSegue.h"

@interface MBFlipViewController : UIViewController <InstantiatedSegueStore>
@property(strong, nonatomic) NSMutableDictionary* instantiatedSegues;

- (void)flipWithCompletion:(void (^)(BOOL))completion;

@end
