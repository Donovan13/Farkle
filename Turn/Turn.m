
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Turn.h"
#import "Roll5State.h"
#import "Roll4State.h"
#import "Roll3State.h"
#import "Roll2State.h"
#import "Roll1State.h"

//typedef NS_ENUM(NSUInteger, DicePointsType) {
//    DicePointsTypeStraight = 0
//};

@interface Turn()
@property NSUInteger round;
@property NSCountedSet <NSNumber*> *heldDice;
@end

@implementation Turn

-(instancetype) init {
    self = [super init];
    if (self) {
        _state = [[Roll5State alloc] initContextWithTurn:self];
        _round = 0;
        _heldDice = [NSCountedSet new];

        _roll1State = [[Roll1State alloc] initContextWithTurn:self];
        _roll2State = [[Roll2State alloc] initContextWithTurn:self];
        _roll3State = [[Roll3State alloc] initContextWithTurn:self];
        _roll4State = [[Roll4State alloc] initContextWithTurn:self];
        _roll5State = [[Roll5State alloc] initContextWithTurn:self];

    }
    return self;
}

#pragma mark - public methods
-(void) addDiceToHeldDice:(NSNumber *)dice { [self.heldDice addObject:dice]; }
-(void) removeDiceFromHeldDice:(NSNumber *)dice { [self.heldDice removeObject:dice]; }
-(void) addDicesToHeldDice:(NSArray *)dices { [self.heldDice addObjectsFromArray:dices]; }
-(void) removeAllDicesFromHeldDice { [self.heldDice removeAllObjects]; }
-(void) removeAllDices { [self.heldDice removeAllObjects]; }

-(NSUInteger)heldDiceCount {
    NSUInteger count = 0;
    for (NSNumber *num in [self.heldDice allObjects]) {
        count += [self.heldDice countForObject:num];
    }
    return count;
}

-(NSUInteger)pointsForHeldDice {
    if ([self isStraight]) {
        return 1500;
    } else if ([self isFiveOfAKindWithOne]){
        return 1600;
    } else if ([self isFiveOfAKind]) {
        return 1500;
    }
    return 0;
}

#pragma mark - private methods
-(BOOL) isStraight {
    BOOL has2Thru5 = [self.heldDice containsObject:@2] && [self.heldDice containsObject:@3] &&
                     [self.heldDice containsObject:@4] && [self.heldDice containsObject:@5];
    BOOL has1 = [self.heldDice containsObject:@1];
    BOOL has6 = [self.heldDice containsObject:@6];
    return (has2Thru5 && has1) || (has2Thru5 && has6);
}


-(BOOL) isFiveOfAKindWithOne {
    return [self.heldDice countForObject:@1]==5;
}

-(BOOL) isFiveOfAKind {
    for (NSNumber *dice in self.heldDice ) {
        if ([self.heldDice countForObject:dice] == 5) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - <TurnState>
-(BOOL) canStopTurn  { return [self.state canStopTurn]; }
-(BOOL) isTurnOver { return [self.state isTurnOver]; }
-(void) rollDice { [self.state rollDice]; }
-(void) stay { [self.state stay]; }

@end
