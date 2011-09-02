//
//  CircleDisplayViewController.m
//  CircleDisplay
//
//  Created by Patrick Zearfoss on 9/1/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import "CircleDisplayViewController.h"
#import "CircleDisplayView.h"

@implementation CircleDisplayViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    CircleDisplayView *circleView = [[CircleDisplayView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:circleView];
    [circleView release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
