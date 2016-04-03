//
//  Roll1State.m
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Roll1State.h"

@implementation Roll1State

-(BOOL) canStopTurn {
    // can never stop after rolling one. either turn continues or turn over
    return NO;
}

@end
