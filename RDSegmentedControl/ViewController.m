//
//  ViewController.m
//  RDSegmentedImageControl
//
//  Created by Richard Das on 7/5/13.
//  Copyright (c) 2013 RNA Productions, Ltd. All rights reserved.
//

#import "ViewController.h"

#import "RDSegmentedControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *items = [@[] mutableCopy];

    int numButtons = 6;
    UIButton *btn = nil;
    while( --numButtons )
    {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIImage *buttonImage = [UIImage imageNamed:@"sample.png"];
        
        [btn setImage:buttonImage forState:UIControlStateNormal];
        btn.frame = CGRectMake( 0.f, 0.f, buttonImage.size.width, buttonImage.size.height);
        [items addObject:btn];
    }
    
    UIImage *dividerImage = [UIImage imageNamed:@"divider.png"];
    
    RDSegmentedControl *control = [[RDSegmentedControl alloc] initWithControls:items andDividerImage:dividerImage];
    [self.view addSubview:control];
    
    [control addTarget:self action:@selector(onSelectedItemChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSelectedItemChanged:(id)sender
{
    RDSegmentedControl *control = (RDSegmentedControl *)sender;
    NSLog(@" onSelectedItemChanged: %d", control.selectedSegmentIndex );
}

@end
