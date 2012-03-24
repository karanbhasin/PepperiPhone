//
//  Bank.h
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bank : NSObject

@property (nonatomic, assign) int accountId;
@property (nonatomic, copy) NSString* bankName;
@property (nonatomic, copy) NSString* account;
@property (nonatomic, copy) NSString* accountNumber;
@property (nonatomic, copy) NSString* accountOf;
@property (nonatomic, copy) NSString* reference;
@property (nonatomic, copy) NSString* attention;
@property (nonatomic, copy) NSString* swift;
@property (nonatomic, copy) NSString* ffc;
@property (nonatomic, copy) NSString* ffcNumber;
@property (nonatomic, copy) NSString* iban;
@property (nonatomic, copy) NSString* accountPhone;
@property (nonatomic, copy) NSString* abaNumber;
@property (nonatomic, copy) NSString* accountFax;
@property (nonatomic, copy) NSString* byOrderOf;

  /* populates an Bank object from a NSDictionary */
+ (Bank *)populateFromDictionary: (NSDictionary *)dict;
@end
