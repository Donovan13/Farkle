//
//  Game.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Game : NSObject

@property NSArray<Player *> *players;
@property NSUInteger playerTurn;

// whose turn is it?
// how many players?
// is there a winner?
// can player stop at this point?

@end
