//
//  CircleDisplayView.h
//  CircleDisplay
//
//  Created by Patrick Zearfoss on 9/1/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CircleDisplayView : UIView
{
    CADisplayLink *displayLink;
    
    BOOL animationRunning;
    NSTimeInterval drawDuration;
    CFTimeInterval lastDrawTime;
    CGFloat drawProgress;
}
@end
