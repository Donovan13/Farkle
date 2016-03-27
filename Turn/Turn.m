
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
    // straight
    // 5 of a kind
    // 3 of a kind
    // scoring die
    return 0;
}

#pragma mark - <TurnState>
-(BOOL) canStopTurn  { return [self.state canStopTurn]; }
-(BOOL) isTurnOver { return [self.state isTurnOver]; }
-(void) rollDice { [self.state rollDice]; }
-(void) stay { [self.state stay]; }



@end
