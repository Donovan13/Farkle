//
//  Turn.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Turn.h"
#import "Roll5State.h"

@interface Turn()
@property NSUInteger round;
@property NSMutableSet<NSNumber*> *heldDie;
@property NSMutableSet<NSNumber*> *rolledDie;
@end

@implementation Turn

-(instancetype) init {
    self = [super init];
    if (self) {
        _state = [Roll5State new];
        _round = 0;
    }
    return self;
}

#pragma mark - <TurnState>

-(BOOL) canStopTurn  {
    return [self.state canStopTurn];
}

-(void) roll5dice {
    [self.state roll5dice];
}

-(void) roll4dice {
    [self.state roll4dice];
}

-(void) roll3dice {
    [self.state roll3dice];
}

-(void) roll2dice {
    [self.state roll2dice];
}

-(void) roll1dice {
    [self.state roll1dice];
}

-(void) stay {
    [self.state stay];
}

-(NSUInteger) selectedDice {
    // need to get this from the UI somehow
    return 3;
}

@end
