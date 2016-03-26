//
//  Player.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Player.h"
#import "Roll5State.h"

@interface Player()
@end

@implementation Player

-(instancetype) init {
    self = [super init];

    if (self) {
        self.state = [Roll5State new];
        self.round = 0;
    }
    return self;
}

-(void) roll5dice {
    [self.state roll5dice];
}

-(void) roll4dice {
    [self.state roll4dice];
}

-(void) roll3dice {
    [self.state roll4dice];
}

-(void) roll2dice {
    [self.state roll4dice];
}

-(void) roll1dice {
    [self.state roll1dice];
}

-(void) stay {
    [self.state stay];
}


@end
