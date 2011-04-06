//
//  GridTableViewCell.m
//  Grid
//
//  Created by Sean Casserly on 4/6/11.
//  Copyright 2011 Sean Casserly. All rights reserved.
//

#import "GridTableViewCell.h"

#define cell1Width 80
#define cell2Width 80
#define cellHeight 44

@implementation GridTableViewCell

@synthesize lineColor, topCell, cell1, cell2, cell3;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

		topCell = NO;
		
		// Add labels for the three cells
		cell1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell1Width, cellHeight)];
		cell1.textAlignment = UITextAlignmentCenter;
		cell1.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
		[self addSubview:cell1];
		
		cell2 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width, 0, cell2Width, cellHeight)];
		cell2.textAlignment = UITextAlignmentCenter;
		cell2.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
		[self addSubview:cell2];

		cell3 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+cell2Width, 0, 320-(cell1Width+cell2Width), cellHeight)]; // Note - hardcoded 320 is not ideal; this can be done better
		cell3.textAlignment = UITextAlignmentCenter;
		cell3.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
		[self addSubview:cell3];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
	[cell1 release];
	[cell2 release];
	[cell3 release];
    [super dealloc];
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);       
	 
	// CGContextSetLineWidth: The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
	// Therefore, a 1 pixel vertical line will not draw crisply unless it is offest by 0.5. This problem does not seem to affect horizontal lines.
	CGContextSetLineWidth(context, 1.0);

	// Add the vertical lines
	CGContextMoveToPoint(context, cell1Width+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+0.5, rect.size.height);

	CGContextMoveToPoint(context, cell1Width+cell2Width+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+cell2Width+0.5, rect.size.height);

	// Add bottom line
	CGContextMoveToPoint(context, 0, rect.size.height);
	CGContextAddLineToPoint(context, rect.size.width, rect.size.height-0.5);
	
	// If this is the topmost cell in the table, draw the line on top
	if (topCell)
	{
		CGContextMoveToPoint(context, 0, 0);
		CGContextAddLineToPoint(context, rect.size.width, 0);
	}
	
	// Draw the lines
	CGContextStrokePath(context); 
}

- (void)setTopCell:(BOOL)newTopCell
{
	topCell = newTopCell;
	[self setNeedsDisplay];
}

@end
