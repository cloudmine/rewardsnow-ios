//
//  RNCart.m
//  RewardsNow
//
//  Created by Ethan Mick on 4/18/13.
//  Copyright (c) 2013 CloudMine LLC. All rights reserved.
//

#import "RNCart.h"
#import "RNRedeemObject.h"
#import "RNUser.h"

@implementation RNCart

+ (instancetype)sharedCart {
    static RNCart *_sharedWebService;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedWebService = [[RNCart alloc] init];
    });
    
    return _sharedWebService;
}

- (instancetype)init {
    
    if ( (self = [super init]) ) {
        self.items = [NSMutableArray array];
        
    }
    return self;
}



- (NSString *)pointsStringBalance {
    return [self formattedStringFromNumber:_user.balance];
}

- (NSString *)getNamePoints {
    return [NSString stringWithFormat:@"%@ Rewards: %@ points.", _user.firstName, [self pointsStringBalance]];
}

- (void)addToCart:(RNRedeemObject *)card {
    [_items addObject:card];
}

- (NSNumber *)total {
    double points = 0;
    for (RNRedeemObject *redeem in _items) {
        points += [redeem priceInPoints];
    }
    return @(points);
}

- (NSString *)stringTotal {
    return [self formattedStringFromNumber:[self total]];
}

- (NSNumber *)pointsDifference {
    return @(_user.balance.doubleValue - self.total.doubleValue);
}

- (NSString *)stringPointsDifference {
    return [self formattedStringFromNumber:[self pointsDifference]];
}

- (NSString *)formattedStringFromNumber:(NSNumber *)num {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:[[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator]];
    return [formatter stringFromNumber:num];
}


@end
