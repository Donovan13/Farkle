//
//  Player.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Player.h"
#import "Turn.h"

@implementation Player

-(void)startNewTurn {
    // get a turn object
    Turn *turn = [Turn new];

    // roll the dice
    [turn rollDice];

    // decide which dice to bank
    // something like
//    if ([turn canMoveDiceToHeldDice:dice ]) {
//    }


    // keep going until turn is over
    // add points to the total
}



@end
