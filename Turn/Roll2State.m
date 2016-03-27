//
//  Roll2State.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll2State.h"

@implementation Roll2State

-(void) roll5dice {};
-(void) roll4dice {};
-(void) roll3dice {};
-(void) stay {};

-(BOOL) canStopTurn {
    // must hold 1 dice, but cant stop with 2 held
    return (self.turnContext.heldDiceCount == 1);
}

@end
