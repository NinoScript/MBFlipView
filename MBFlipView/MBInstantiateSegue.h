//
//  MBInstantiateSegue.h
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InstantiatedSegueStore <NSObject>
@property(strong, nonatomic) NSMutableDictionary* instantiatedSegues;
@end

@interface MBInstantiateSegue : UIStoryboardSegue

@end
