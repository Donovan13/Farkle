//
//  Roll5.m
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "Roll5State.h"
#import "SingleDice.h"

@implementation Roll5State


-(BOOL) canStopTurn {
    // must hold 3 or 4 dice, but cant stop with 5 held
    // todo - if party bowl
    return (self.turnContext.heldDice.diceCount == 3 ||
            self.turnContext.heldDice.diceCount == 4);
}

@end
