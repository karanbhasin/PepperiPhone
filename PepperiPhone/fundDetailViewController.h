//
//  fundDetailViewController.h
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fundDetailViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *table;
}
@property (nonatomic) int selectedFundID;
@property (nonatomic, retain) NSMutableArray *sections;
@property (nonatomic, retain) NSMutableDictionary *dictionary;
@end
