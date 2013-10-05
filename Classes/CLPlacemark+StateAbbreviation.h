//
//  CLPlacemark+StateAbbreviation.h
//
//  Created by Jardel Weyrich on 10/5/13.
//  Copyright (c) 2013 Jardel Weyrich. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLPlacemark (StateAbbreviation)

- (NSString *)stateAbbreviation;
- (NSString *)stateAbbreviationFromStateName:(NSString *)StateName;
- (NSString *)stateAbbreviationFromStateName:(NSString *)StateName
						   andISOCountryCode:(NSString *)ISOCountryCode;
- (NSString *)stateNameFromStateAbbreviation:(NSString *)StateAbbr;
- (NSString *)stateNameFromStateAbbreviation:(NSString *)StateAbbr
						   andISOCountryCode:(NSString *)ISOCountryCode;

@end