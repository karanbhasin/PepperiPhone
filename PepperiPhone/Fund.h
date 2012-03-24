//
//  Fund.h
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fund : NSObject{
    
}

@property (nonatomic, assign) int fundId;
@property (nonatomic, copy) NSString *fundName;
@property (nonatomic, copy) NSString *taxId;
@property (nonatomic, copy) NSDate* inceptionDate;
@property (nonatomic, copy) NSDate* scheduleTerminationDate;
@property (nonatomic, copy) NSDate* finalTerminationDate;
@property (nonatomic, assign) int numofAutoExtensions;
@property (nonatomic, copy) NSDate* dateClawbackTriggered;
@property (nonatomic, assign) int recycleProvision;
@property (nonatomic, copy) NSDate* mgmtFeesCatchUpDate;
@property (nonatomic, assign) int carry;

+ (Fund *)populateFromDictionary: (NSDictionary *)dict;
@end



