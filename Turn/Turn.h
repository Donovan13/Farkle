//
//  Turn.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurnState.h"
#import "NSCountedSet+Dice.h"

@interface Turn:NSObject <TurnState>

// states
@property id <TurnState> state;
@property id <TurnState> roll1State;
@property id <TurnState> roll2State;
@property id <TurnState> roll3State;
@property id <TurnState> roll4State;
@property id <TurnState> roll5State;
@property NSUInteger pointsForTurn;

@property NSCountedSet<NSNumber*> *rolledDice;
@property NSCountedSet<NSNumber*> *heldDice;
@property NSCountedSet<NSNumber*> *bankedDice;

-(BOOL) canStopTurn;
-(BOOL) canMoveFromRolledDiceToHeldDice:(NSNumber *)dice;
-(void) copyHeldDiceToBankedDice;

@end
