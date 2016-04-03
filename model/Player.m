//
//  Player.m
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Player.h"
#import "Turn.h"

@implementation Player

-(instancetype) init {
    self = [super init];
    if (self) {
        _turn = [Turn new];
    }
    return self;
}

-(void)startNewTurn {
    // get a turn object
    Turn *turn = [Turn new];

    // roll the dice
    [turn rollDice];
    // stop
}



@end
