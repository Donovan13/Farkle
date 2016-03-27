//
//  Roll3State.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Roll3State.h"

@implementation Roll3State
-(void) roll5dice {};
-(void) roll4dice {};

-(BOOL) canStopTurn {
    // must hold 1 or 2 dice, but cant stop with 3 held
    // todo - if party bowl
    return (self.turnContext.selectedDice >= 1 && self.turnContext.selectedDice != 3);
}

@end
