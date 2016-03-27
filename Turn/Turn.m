
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

@interface Turn()
@property NSUInteger round;
@end

@implementation Turn

-(instancetype) init {
    self = [super init];
    if (self) {
        _state = [[Roll5State alloc] initContextWithTurn:self];
        _round = 0;
        _pointsForTurn = 0;
        _rolledDice = [NSCountedSet new];
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

-(BOOL) canMoveDiceToHeldDice:(NSNumber *)dice {
    NSUInteger intDice = [dice unsignedIntegerValue];
    if (intDice == 1 || intDice == 5) {
        return YES;
    } else if (YES) {
        // rolled dice straight containing number
        // or
        // rolled dice 3 of a kind containing number
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - private methods
-(BOOL) isStraightForDice:(NSCountedSet *)dices {
    BOOL has2Thru5 = [dices containsObject:@2] && [dices containsObject:@3] &&
                     [dices containsObject:@4] && [dices containsObject:@5];
    BOOL has1 = [dices containsObject:@1];
    BOOL has6 = [dices containsObject:@6];
    return (has2Thru5 && has1) || (has2Thru5 && has6);
}


#pragma mark - <TurnState>
-(BOOL) canStopTurn  { return [self.state canStopTurn]; }
-(BOOL) isTurnOver { return [self.state isTurnOver]; }
-(void) rollDice { [self.state rollDice]; }
-(void) stay { [self.state stay]; }

@end
