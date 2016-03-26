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

+(NSInteger) rollSingleDice {
    return arc4random_uniform(diceSides + 1);
}

@end
