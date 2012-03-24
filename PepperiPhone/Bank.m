//
//  Bank.m
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Bank.h"

@implementation Bank


@synthesize accountId = _accountId;
@synthesize bankName = _bankName;
@synthesize account = _account;
@synthesize accountNumber = _accountNumber;
@synthesize accountOf = _accountOf;
@synthesize reference = _reference;
@synthesize attention = _attention;
@synthesize swift = _swift;
@synthesize ffc = _ffc;
@synthesize ffcNumber = _ffcNumber;
@synthesize iban = _iban;
@synthesize accountPhone = _accountPhone;
@synthesize abaNumber = _abaNumber;
@synthesize accountFax = _accountFax;
@synthesize byOrderOf = _byOrderOf;

- (Bank*)initWithDictionary:(NSDictionary *)dict {
	if (![super init]) {
		return nil;
	}
    
    self.accountId = [dict objectForKey:@"AccountId"];
    NSLog(@"AccountID is: %@", [dict objectForKey:@"AccountId"]);
    self.bankName = [dict objectForKey:@"BankName"];
    self.account = [dict objectForKey:@"Account"];
    self.accountNumber = [dict objectForKey:@"AccountNumber"];
    self.accountPhone = [dict objectForKey:@"AccountPhone"];
    self.abaNumber = [dict objectForKey:@"ABANumber"];    //self.accountOf = [dict objectForKey:@"AccountOf"];
    self.accountFax = [dict objectForKey:@"AccountFax"];
    
    self.reference = [dict objectForKey:@"Reference"];
    self.swift = [dict objectForKey:@"Swift"];
    self.ffc = [dict objectForKey:@"FFC"];
    self.ffcNumber = [dict objectForKey:@"FFCNumber"];
    self.iban = [dict objectForKey:@"IBAN"];
    self.byOrderOf = [dict objectForKey:@"ByOrderOf"];
     
    return self;
}

+ (Bank *)populateFromDictionary: (NSDictionary *)dict {
	return [[Bank alloc] initWithDictionary:dict];
}

@end
