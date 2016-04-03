//
//  Game.m
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Game.h"

@interface Game()
@end

@implementation Game

-(instancetype) init {
    self = [super init];
    if (self) {
        _player = [Player new];
    }
    return self;
}

-(BOOL) canStopTurn{
    return NO;
}
-(void) stopTurn{}

-(BOOL) canMoveFromRolledDiceToHeldDice:(NSNumber *)dice{
    return NO;
}

-(void) moveFromRolledDiceToHeldDice:(NSNumber *)dice{}

-(BOOL) canRoll{
    return NO;
}

-(void) roll{}

-(BOOL) canAddPlayer{
    return NO;
}

-(void) addPlayer{}

@end
