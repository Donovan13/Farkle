//
//  SingleDice.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "SingleDice.h"
static u_int32_t diceSides = 6;

@implementation SingleDice

+(NSNumber *) rollSingleDice {
    u_int32_t i = arc4random_uniform(diceSides + 1);
    return [NSNumber numberWithInt:i];
}

@end
