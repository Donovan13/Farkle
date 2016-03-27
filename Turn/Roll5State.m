//
//  Roll5.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll5State.h"
#import "SingleDice.h"

@implementation Roll5State

-(void)roll5dice {
    [self rollXDice:5];
}

-(BOOL) canStopTurn {
    // must hold 3 or 4 dice, but cant stop with 5 held
    // todo - if party bowl
    return (self.turnContext.selectedDice >= 3 && self.turnContext.selectedDice != 5);
}

// orphaned comments
// user most hold at least 3, but cannot hold 5 and stop
// if no
//    are there are any scoring die for you to continue?
//    if yes
//         wait for user to select more die
//    if no
//         transition to turn over

// were there scoring die on the last turn
// are you at a party bowl amount
@end
