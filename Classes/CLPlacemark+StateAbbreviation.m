//
//  CLPlacemark+StateAbbreviation.m
//
//  Created by Jardel Weyrich on 10/5/13.
//  Copyright (c) 2013 Jardel Weyrich. All rights reserved.
//

#import "CLPlacemark+StateAbbreviation.h"

@implementation CLPlacemark (StateAbbreviation)

static NSDictionary *abbreviationsDict = nil;

- (void)makeSureResourceIsLoaded
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSString *resourceName = [NSString stringWithFormat:@"%@-StateAbbreviation", NSStringFromClass([self class])];
		NSString *path = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"plist"];
		abbreviationsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
	});
}

- (NSDictionary *)abbreviationsDict
{
	[self makeSureResourceIsLoaded];
	return abbreviationsDict;
}

- (NSString *)stateAbbreviation
{
	return [self stateAbbreviationFromStateName:self.administrativeArea
							  andISOCountryCode:self.ISOcountryCode];
}


- (NSString *)stateAbbreviationFromStateName:(NSString *)StateName
{
	return [self stateAbbreviationFromStateName:StateName
							  andISOCountryCode:self.ISOcountryCode];
}

- (NSString *)stateAbbreviationFromStateName:(NSString *)StateName
						   andISOCountryCode:(NSString *)ISOCountryCode
{
	NSDictionary *states = self.abbreviationsDict[ISOCountryCode];
	return states ? states[StateName] : nil;
}

- (NSString *)stateNameFromStateAbbreviation:(NSString *)StateAbbr
{
	return [self stateNameFromStateAbbreviation:StateAbbr
							  andISOCountryCode:self.ISOcountryCode];
}

- (NSString *)stateNameFromStateAbbreviation:(NSString *)StateAbbr
						   andISOCountryCode:(NSString *)ISOCountryCode
{
	NSString *stateAbbrUpper = [StateAbbr uppercaseString];
	NSDictionary *states = self.abbreviationsDict[ISOCountryCode];
	for (NSString *abbr in [states allValues]) {
		if ([abbr isEqualToString:stateAbbrUpper])
			return states[stateAbbrUpper];
	}
	return nil;
}

@end