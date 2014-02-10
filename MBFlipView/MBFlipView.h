//
//  MBFlipView.h
//  MBFlipView
//
//  Created by Cristián Arenas on 2/5/14.
//  Copyright (c) 2014 NiñoScript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBFlipView : UIView

@property(nonatomic, retain) UIViewController* primary;
@property(nonatomic, retain) UIViewController* secondary;
@property float spinTime;

- (void)flipWithCompletion:(void (^)(BOOL))completion;
@end
