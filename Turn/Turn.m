
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
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
        _bankedDice = [NSCountedSet new];
        _roll1State = [[Roll1State alloc] initContextWithTurn:self];
        _roll2State = [[Roll2State alloc] initContextWithTurn:self];
        _roll3State = [[Roll3State alloc] initContextWithTurn:self];
        _roll4State = [[Roll4State alloc] initContextWithTurn:self];
        _roll5State = [[Roll5State alloc] initContextWithTurn:self];
    }
    return self;
}

#pragma mark - public methods
-(void) moveFromRolledDiceToHeldDice:(NSNumber *)dice {

}

-(BOOL) canMoveFromRolledDiceToHeldDice:(NSNumber *)dice {
    assert([self.rolledDice countForObject:dice] > 0);
    if      ([self.rolledDice isSingleScoringDiceWithNumber:dice]) { return YES; }
    else if ([self.rolledDice isFiveOfAKindWithNumber:dice]) { return YES; }
    else if ([self.rolledDice isThreeOfAKindWithNumber:dice]) { return YES; }
    else if ([self.rolledDice isStraightWithNumber:dice]) { return YES; }
    else { return NO; }
}

-(void) copyHeldDiceToBankedDice {
    for (NSNumber *dice in self.heldDice) {
        for (int i = 0; i < [self.heldDice countForObject:dice] ; i++) {
            [self.bankedDice addDice:dice];
        }
    }
}

-(NSString *) description {
    return [NSString stringWithFormat:@"Banked: %@\nRolled:%@\nHeld:%@\nPoints:%li",
            self.bankedDice, self.rolledDice, self.heldDice, self.pointsForTurn];
}

#pragma mark - private methods

#pragma mark - <TurnState>
-(BOOL) canStopTurn  { return [self.state canStopTurn]; }
-(BOOL) isTurnOver { return [self.state isTurnOver]; }
-(void) rollDice { [self.state rollDice]; }
-(void) stay { [self.state stay]; }

@end
