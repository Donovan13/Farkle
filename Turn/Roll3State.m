//
//  Roll3State.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Roll3State.h"

@implementation Roll3State

-(BOOL) canStopTurn {
    // must hold 1 or 2 dice, but cant stop with 3 held
    // todo - if party bowl
    return (self.turnContext.heldDice.diceCount >= 1 &&
            self.turnContext.heldDice.diceCount != 3);
}

@end
