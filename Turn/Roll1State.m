//
//  Roll1State.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll1State.h"

@implementation Roll1State
-(void) roll5dice {};
-(void) roll4dice {};
-(void) roll3dice {};
-(void) roll2dice {};

-(BOOL) canStopTurn {
    // can never stop after rolling one. either turn continues or turn over
    return NO;
}

@end
