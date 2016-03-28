//
//  RollState.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "RollState.h"
#import "SingleDice.h"

@implementation RollState

-(instancetype) initContextWithTurn:(Turn *) turn {
    self = [super init];
    if (self) {
        _turnContext = turn;
    }
    return self;
}

-(void) rollDice {
    // figure out how many dice to roll
    NSUInteger heldDiceCount = self.turnContext.heldDice.diceCount;
    NSUInteger bankedDiceCount = self.turnContext.bankedDice.diceCount;
    NSUInteger diceToRoll = 5 - heldDiceCount - bankedDiceCount;

    // clear out the previously rolled die
    [self.turnContext.rolledDice removeAllObjects];

    // add the held dice to the banked dice
    [self.turnContext copyHeldDiceToBankedDice];

    // clear out held dice and add the points
    self.turnContext.pointsForTurn += self.turnContext.heldDice.points;
    [self.turnContext.heldDice removeAllDice];

    // switch to new state
    switch (diceToRoll) {
        case 0: // pick up all 5 and roll 5 again
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

    for (int i = 0; i < diceToRoll; i++) {
        [self.turnContext.rolledDice addObject:[SingleDice rollSingleDice]];
    }
}

-(void) stay { }

-(BOOL)canStopTurn {
    NSLog(@"shouldnt be here, should be overridden in all subclasses");
    return NO;
}

-(BOOL) isTurnOver {
    NSLog(@"shouldnt be here, should be overridden in all subclasses");
    return NO;
}

@end
