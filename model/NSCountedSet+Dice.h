//
//  NSCountedSet+Dice.h
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCountedSet (Dice)

@property (readonly) NSUInteger diceCount;
@property (readonly) NSUInteger points;

@property (readonly, getter = isStraight)            BOOL straight;
@property (readonly, getter = isThreeOfAKind)        BOOL threeOfAKind;
@property (readonly, getter = isThreeOfAKindWithOne) BOOL threeOfAKindWithOne;
@property (readonly, getter = isFiveOfAKind)         BOOL fiveOfAKind;
@property (readonly, getter = isFiveOfAKindWithOne)  BOOL fiveOfAKindWithOne;

@property (readonly) NSNumber* whichThreeOfAKind;    // 0 if no 3 of a kind present
@property (readonly) NSNumber* whichFiveOfAKind;     // 0 if no 5 of a kind present
@property (readonly) NSNumber* lowNumberForStraight; // 0 if no straight present

-(void) addDice:(NSNumber *) dice;
-(void) addDices:(NSArray *) dices;
-(void) removeDice:(NSNumber *) dice;
-(void) removeAllDice;

@end
