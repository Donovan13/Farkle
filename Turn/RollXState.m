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

-(instancetype) initContextWithPlayer:(Player *) player {
    self = [super init];
    if (self) {
        _playerContext = player;
    }
    return self;
}

-(void) rollXDice:(NSUInteger) count {
    for (int i = 0; i < count; count++) {
        [SingleDice rollSingleDice];
    }
}

-(void) roll5dice { [self rollXDice:5]; }
-(void) roll4dice { [self rollXDice:4]; }
-(void) roll3dice { [self rollXDice:3]; }
-(void) roll2dice { [self rollXDice:2]; }
-(void) roll1dice { [self rollXDice:1]; }
-(void) stay { }


@end
