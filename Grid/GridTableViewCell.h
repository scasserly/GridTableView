//
//  GridTableViewCell.h
//  Grid
//
//  Created by Sean Casserly on 4/6/11.
//  Copyright 2011 Sean Casserly. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GridTableViewCell : UITableViewCell {
	
	UIColor *lineColor;
	BOOL topCell;
	
	UILabel *cell1;
	UILabel *cell2;
	UILabel *cell3;
}

@property (nonatomic, retain) UIColor* lineColor;
@property (nonatomic) BOOL topCell;
@property (readonly) UILabel* cell1;
@property (readonly) UILabel* cell2;
@property (readonly) UILabel* cell3;

@end
