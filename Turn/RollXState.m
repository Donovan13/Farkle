//
//  RollXState.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "RollXState.h"
#import "SingleDice.h"

@implementation RollXState

-(instancetype) initContextWithTurn:(Turn *) turn {
    self = [super init];
    if (self) {
        _turnContext = turn;
    }
    return self;
}

-(void) rollXDice:(NSUInteger) count {
    for (int i = 0; i < count; i++) {
        NSUInteger diceValue = [SingleDice rollSingleDice];
        NSLog(@"%li", diceValue);
    }
    NSLog(@"out of loop");
}

-(void) roll5dice { [self rollXDice:5]; }
-(void) roll4dice { [self rollXDice:4]; }
-(void) roll3dice { [self rollXDice:3]; }
-(void) roll2dice { [self rollXDice:2]; }
-(void) roll1dice { [self rollXDice:1]; }
-(void) stay { }

-(BOOL)canStopTurn {
    NSLog(@"shouldnt be here, should be overridden in all subclasses");
    return NO;
}

@end
