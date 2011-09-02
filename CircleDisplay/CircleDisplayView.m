//
//  CircleDisplayView.m
//  CircleDisplay
//
//  Created by Patrick Zearfoss on 9/1/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import "CircleDisplayView.h"

@implementation CircleDisplayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        displayLink = [CADisplayLink displayLinkWithTarget:self 
                                                  selector:@selector(setNeedsDisplay)];
        drawDuration = 15.0;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (!animationRunning)
    {
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        animationRunning = YES;
        return;
    }
    
    if (lastDrawTime == 0)
    {
        lastDrawTime = displayLink.timestamp;
        return;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [[UIColor blueColor] CGColor]);
    
    CFTimeInterval elapsedTime = displayLink.timestamp - lastDrawTime;
    NSLog(@"elapsed %f", elapsedTime);
    
    CGFloat radiansToDraw = drawProgress + ((2 * M_PI) / drawDuration) * elapsedTime;
    
    NSLog(@"drawing %f radians", radiansToDraw);
    
    CGContextMoveToPoint(ctx, self.center.x, self.center.y);
    CGContextAddLineToPoint(ctx, self.center.x + 100, self.center.y);
    CGContextAddArc(ctx, self.center.x, self.center.y, 100, 0, radiansToDraw, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    lastDrawTime = displayLink.timestamp;
    drawProgress = radiansToDraw;
    
    if (radiansToDraw > 2 * M_PI)
    {
        NSLog(@"Invalidate display link");
        [displayLink invalidate];
        animationRunning = NO;
        lastDrawTime = 0;
    }   
    
}


@end
