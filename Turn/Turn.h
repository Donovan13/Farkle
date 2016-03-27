//
//  Turn.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurnState.h"


@interface Turn:NSObject <TurnState>

// states
@property id <TurnState> state;
@property id <TurnState> roll1State;
@property id <TurnState> roll2State;
@property id <TurnState> roll3State;
@property id <TurnState> roll4State;
@property id <TurnState> roll5State;

@property NSCountedSet<NSNumber*> *rolledDice;

-(BOOL) canStopTurn;
// returns count of dice that are held to hold. User has not yet committed to holding these dice
-(NSUInteger) heldDiceCount;

-(void) addDiceToHeldDice:(NSNumber *)dice;
-(void) removeDiceFromHeldDice:(NSNumber *)dice;

-(void) addDicesToHeldDice:(NSArray *)dices;
-(void) removeAllDicesFromHeldDice;

-(void) rollDice;
-(NSUInteger) pointsForHeldDice;

@end