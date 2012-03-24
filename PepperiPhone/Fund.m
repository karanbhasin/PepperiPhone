//
//  Fund.m
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fund.h"
#import "Util.h"

@implementation Fund
@synthesize fundId = _fundId;
@synthesize fundName = _fundName;
@synthesize taxId = _taxId;
@synthesize  inceptionDate = _inceptionDate;
@synthesize  scheduleTerminationDate = _scheduleTerminationDate;
@synthesize  finalTerminationDate = _finalTerminationDate;
@synthesize  numofAutoExtensions = _numofAutoExtensions;
@synthesize  dateClawbackTriggered = _dateClawbackTriggered;
@synthesize recycleProvision = _recycleProvision;
@synthesize  mgmtFeesCatchUpDate = _mgmtFeesCatchUpDate;
@synthesize carry = _carry;

- (Fund*)initWithDictionary:(NSDictionary *)dict {
	if (![super init]) {
		return nil;
	}
    // TODO: try this to automatically populate the dictionary into an object
    // Fund *unit = [[Fund alloc] init];
    // [unit setValuesForKeysWithDictionary:dictionary];
    
    self.fundId = [dict objectForKey:@"FundId"];
    self.fundName = [dict objectForKey:@"FundName"];
    self.taxId = [dict objectForKey:@"TaxId"];
    self.numofAutoExtensions = [dict objectForKey:@"NumofAutoExtensions"];
    self.recycleProvision = [dict objectForKey:@"RecycleProvision"];
    self.carry = [dict objectForKey:@"Carry"];
    
    // Parse the dates
    id val = [dict objectForKey:@"InceptionDate"];
    if([val isKindOfClass:[NSString class]]){ 
        self.inceptionDate = [Util mfDateFromDotNetJSONString:(NSString*)val];
    }
    val = [dict objectForKey:@"ScheduleTerminationDate"];
    if([val isKindOfClass:[NSString class]]){ 
        self.scheduleTerminationDate = [Util mfDateFromDotNetJSONString:(NSString*)val];
    }
    val = [dict objectForKey:@"FinalTerminationDate"];
    if([val isKindOfClass:[NSString class]]){ 
        self.finalTerminationDate = [Util mfDateFromDotNetJSONString:(NSString*)val];
    }
    val = [dict objectForKey:@"DateClawbackTriggered"];
    if([val isKindOfClass:[NSString class]]){ 
        self.dateClawbackTriggered = [Util mfDateFromDotNetJSONString:(NSString*)val];
    }
    val = [dict objectForKey:@"MgmtFeesCatchUpDate"];
    if([val isKindOfClass:[NSString class]]){ 
        self.mgmtFeesCatchUpDate = [Util mfDateFromDotNetJSONString:(NSString*)val];
    }
    return self;
}

+ (Fund *)populateFromDictionary: (NSDictionary *)dict{
    return [[Fund alloc] initWithDictionary:dict];
}
@end
