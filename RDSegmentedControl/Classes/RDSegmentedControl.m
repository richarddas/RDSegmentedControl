//
//  RDSegmentedImageControl.m
//  RDSegmentedImageControl
//
//  Created by Richard Das on 7/5/13.
//  Copyright (c) 2013 RNA Productions, Ltd. All rights reserved.
//

#import "RDSegmentedControl.h"

@interface RDSegmentedControl () {

NSMutableArray *segmentItems;
UIImage *dividerImageRef;

}
@end


@implementation RDSegmentedControl

- (id)init
{
    self = [super init];
    if (self) {
        segmentItems = [@[] mutableCopy];
        self.selectedSegmentIndex = 0;
    }
    return self;
}


- (id)initWithControls:(NSMutableArray *)array andDividerImage:(UIImage *)dividerImage
{
    self = [super init];
    if (self) {
        segmentItems = array;
        
        dividerImageRef = dividerImage;
        
        __block CGFloat maxWidth = 0.f; // will grow as items are added
        __block CGFloat maxHeight = 0.f; // will be set to the tallest item
        
        __block CGRect rect = CGRectZero;
        __block UIControl *control = nil;
        [array enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL *stop)
        {
            control = (UIControl *)item;

            // position button
            rect = control.frame;
            rect.origin.x = maxWidth;
            control.frame = rect;
            
            // update the max height (if item is taller)
            maxHeight = MAX( maxHeight, CGRectGetHeight( rect ));
            
            [control addTarget:self action:@selector(onSegmentSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:control];
            
            // if a divider image is specified, append it to all but the last item
            if( idx < segmentItems.count - 1 && dividerImage != nil )
            {
                CGRect dividerRect = CGRectMake( 0.f, 0.f, dividerImage.size.width, dividerImage.size.height );
                dividerRect.origin.x = maxWidth + CGRectGetWidth( control.frame );
                dividerRect.origin.y = (maxHeight - dividerRect.size.height)/2.f;
                
                UIImageView* divider = [[UIImageView alloc] initWithImage:dividerImage];
                divider.frame = dividerRect;
                [self addSubview:divider];
                
                maxWidth = CGRectGetMaxX( divider.frame );
            } else {
                maxWidth = CGRectGetMaxX( control.frame );
            }
        }];
        
        // set the frame
        CGRect ownFrame = self.frame;
        ownFrame.size.width = maxWidth;
        ownFrame.size.height = maxHeight;
        self.frame = ownFrame;
        
        self.selectedSegmentIndex = 0;
    }
    return self;
}


#pragma mark - selection handlers


- (void)onSegmentSelected:(id)sender
{
    UIControl *control = (UIButton *)sender;
    self.selectedSegmentIndex = [segmentItems indexOfObject:control];
}


#pragma mark - public selectors


- (void)setSelectedSegmentIndex:(NSUInteger)index
{
    __block UIControl *control = nil;
    [segmentItems enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL *stop)
    {
        control = (UIControl *)item;
        control.selected = ( idx == index );
     }];
    
    _selectedSegmentIndex = index;
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (UIControl *)segmentAtIndex:(NSUInteger)index
{
    return [segmentItems objectAtIndex:index];
}


- (NSUInteger)numberOfSegments
{
    return segmentItems.count;
}


@end
