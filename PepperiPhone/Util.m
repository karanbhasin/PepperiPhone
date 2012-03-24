//
//  Util.m
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Util.h"

@implementation Util

// http://stackoverflow.com/questions/1757303/parsing-json-dates-on-iphone
+ (NSDate *)mfDateFromDotNetJSONString:(NSString *)string {
    if(string != nil){
    static NSRegularExpression *dateRegEx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateRegEx = [[NSRegularExpression alloc] initWithPattern:@"^\\/date\\((-?\\d++)(?:([+-])(\\d{2})(\\d{2}))?\\)\\/$" options:NSRegularExpressionCaseInsensitive error:nil];
    });
    NSTextCheckingResult *regexResult = [dateRegEx firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    if (regexResult) {
        // milliseconds
        NSTimeInterval seconds = [[string substringWithRange:[regexResult rangeAtIndex:1]] doubleValue] / 1000.0;
        // timezone offset
        if ([regexResult rangeAtIndex:2].location != NSNotFound) {
            NSString *sign = [string substringWithRange:[regexResult rangeAtIndex:2]];
            // hours
            seconds += [[NSString stringWithFormat:@"%@%@", sign, [string substringWithRange:[regexResult rangeAtIndex:3]]] doubleValue] * 60.0 * 60.0;
            // minutes
            seconds += [[NSString stringWithFormat:@"%@%@", sign, [string substringWithRange:[regexResult rangeAtIndex:4]]] doubleValue] * 60.0;
        }
        
        return [NSDate dateWithTimeIntervalSince1970:seconds];
    }
    }
    return nil;
}

+ (NSString *) toFormattedDateString:(NSDate *)date {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSString *string=[dateFormatter stringFromDate:date];
    return string;
}

+(NSString*) toFormattedCurrency:(int) val{
    NSNumberFormatter *frm = [[NSNumberFormatter alloc] init];
    [frm setNumberStyle:NSNumberFormatterCurrencyStyle];
    [frm setCurrencySymbol:@""];
    [frm setMaximumFractionDigits:0];
    NSString *formatted = [frm stringFromNumber:[NSNumber numberWithInt:val]];
    return formatted;
    
}

+(NSString*) toDecimalString:(NSString*) val{
    //return [NSString stringWithFormat: @"%.2f", val];
    
    NSDecimalNumber *someAmount = [NSDecimalNumber decimalNumberWithString:val];
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return [NSString stringWithFormat:@"%@", [currencyFormatter stringFromNumber:someAmount]];
}

+(NSString*) toDecimalStringFromNumber:(double) val{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"#,##0.00" ];
    
    NSString *string = [formatter stringFromNumber:[ NSNumber numberWithDouble:val ] ];
    return string;
    // string is now "1,234,567.89"
}

+ (NSString*) formattedString:(id) val{
    return [NSString stringWithFormat:@"%@",val];
}

+(NSString*) getSeperatedString: (NSString*) string{
    // http://stackoverflow.com/questions/7322498/insert-or-split-string-at-uppercase-letters-objective-c
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"([a-z])([A-Z])" options:0 error:NULL];
    NSString *newString = [regexp stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@"$1 $2"];
    NSLog(@"Changed '%@' -> '%@'", string, newString);
    return newString;
}

// The returned json sometimes has format like "Carry":null, in which case we dont want to set
+ (id) getValueFromJson:(id) val {
    if([val isKindOfClass:[NSString class]]){ 
        return val;
    }
    return nil;
}

// The returned json sometimes has format like "Carry":null, in which case we dont want to parse the value
+ (BOOL) isValidValue : (id) val{
    // NSLog(@"Class name %@", [val class]);
    if([val isKindOfClass:[NSString class]] && [val length] > 0) {
        return true;
    } else if([val isKindOfClass:[NSNumber class]]){
        return true;
    }
    return false;
}

+ (NSMutableDictionary* ) getFilteredDictionary : (NSDictionary*) original
                               withPropertyNames: (NSArray*)properties 
                                withOverrideKeys: (NSDictionary*) overrideKeys  
                                withDateKeys    : (NSArray*) dateKeys  {
    NSMutableDictionary* filteredDictionary = [[NSMutableDictionary alloc] init];
    NSEnumerator *enumerator = [original keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        id val = [original objectForKey:key];
        if([Util isValidValue:val]){
            // Its a valid value
            if([properties containsObject:key]){
                NSString* overrideKey = (NSString*)key;
                // see if we have the override key
                if(overrideKeys){
                    if([[overrideKeys allKeys] containsObject:key]){
                        overrideKey = (NSString*)[overrideKeys objectForKey:key];
                    } else {
                        overrideKey = [Util getSeperatedString:overrideKey];
                    }
                }
                if(dateKeys && [dateKeys containsObject:key]){
                    val = [Util toFormattedDateString:[Util mfDateFromDotNetJSONString:(NSString*)val]];
                } else {
                    val = [Util formattedString:val];
                }
                [filteredDictionary setValue:val forKey:overrideKey];
            }
        }
    }
    return filteredDictionary;
}

@end
