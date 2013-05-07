//
//  RDSegmentedImageControl.h
//  RDSegmentedImageControl
//
//  Created by Richard Das on 7/5/13.
//  Copyright (c) 2013 RNA Productions, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDSegmentedControl : UIControl

- (id)initWithControls:(NSMutableArray *)array andDividerImage:(UIImage *)dividerImage;

- (UIControl *)segmentAtIndex:(NSUInteger)index;

@property(nonatomic, readonly) NSUInteger numberOfSegments;

@property(nonatomic) NSUInteger selectedSegmentIndex;

@end
