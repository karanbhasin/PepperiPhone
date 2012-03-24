//
//  investorDetailsViewController.h
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface investorDetailsViewController : UITableViewController
{
    NSMutableArray *myData;
}
@property (nonatomic) int selectedFundID;
@end
