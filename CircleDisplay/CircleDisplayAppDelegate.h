//
//  CircleDisplayAppDelegate.h
//  CircleDisplay
//
//  Created by Patrick Zearfoss on 9/1/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleDisplayViewController;

@interface CircleDisplayAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CircleDisplayViewController *viewController;

@end
