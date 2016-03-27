//
//  Roll4.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll4State.h"

@implementation Roll4State

-(BOOL) canStopTurn {
    // must hold 2 or 3 dice, but cant stop with 4 held
    // todo - if party bowl
    return (self.turnContext.selectedDice >= 2 && self.turnContext.selectedDice != 4);
}

@end
