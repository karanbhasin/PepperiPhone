//
//  dealsViewController.h
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dealsViewController : UITableViewController
{
    IBOutlet UITableView *table;
}
@property (nonatomic) int selectedFundID;

@end
