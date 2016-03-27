//
//  Roll4.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll4State.h"

@implementation Roll4State

-(void)rollDice {
    // figure out how many dice to roll
    NSUInteger diceToRoll = 5 - self.turnContext.heldDiceCount;

    // clear out the previously rolled die
    [self.turnContext.rolledDice removeAllObjects];

    // switch to new state
    switch (diceToRoll) {
        case 5:
            self.turnContext.state = self.turnContext.roll5State;
            break;
        case 4:
            self.turnContext.state = self.turnContext.roll4State;
            break;
        case 3:
            self.turnContext.state = self.turnContext.roll3State;
            break;
        case 2:
            self.turnContext.state = self.turnContext.roll2State;
            break;
        case 1:
            self.turnContext.state = self.turnContext.roll1State;
            break;
        default:
            break;
    }

    // and now roll the dice
    [self.turnContext.state rollDice];
}


-(BOOL) canStopTurn {
    // must hold 2 or 3 dice, but cant stop with 4 held
    // todo - if party bowl
    return (self.turnContext.heldDiceCount >= 2 &&
            self.turnContext.heldDiceCount != 4);
}

@end
