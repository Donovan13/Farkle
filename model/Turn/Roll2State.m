//
//  Roll2State.m
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Roll2State.h"

@implementation Roll2State

-(BOOL) canStopTurn {
    // must hold 1 dice, but cant stop with 2 held
    return (self.turnContext.heldDice.diceCount == 1);
}

@end
