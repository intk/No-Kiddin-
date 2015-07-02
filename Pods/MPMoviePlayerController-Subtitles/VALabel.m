//
//  VALabel.m
//  Pods
//
//  Created by Sjors Snoeren on 30-06-15.
//
//

#import "VALabel.h"

@implementation VALabel

@synthesize verticalAlignment;

#pragma mark -
#pragma mark Super

- (void) drawTextInRect:(CGRect)rect
{
    if(verticalAlignment == UIControlContentVerticalAlignmentTop ||
       verticalAlignment == UIControlContentVerticalAlignmentBottom)
    {
        //	If one line, we can just use the lineHeight, faster than querying sizeThatFits
        const CGFloat height = ((self.numberOfLines == 1) ? ceilf(self.font.lineHeight) : [self sizeThatFits:self.frame.size].height);
        
        if(height < self.frame.size.height)
            rect.origin.y = ((self.frame.size.height - height) / 2.0f) * ((verticalAlignment == UIControlContentVerticalAlignmentTop) ? -1.0f : 1.0f);
    }
    
    [super drawTextInRect:rect];
}

#pragma mark -
#pragma mark Self

- (void) setVerticalAlignment:(UIControlContentVerticalAlignment)_verticalAlignment
{
    verticalAlignment = _verticalAlignment;
    
    [self setNeedsDisplay];
}

@end
