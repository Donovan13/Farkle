//  Player.h - Farkle
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turn.h"

@protocol PlayerDelegate <NSObject>
@end

@interface Player:NSObject

@property NSString *name;
@property NSUInteger hits;
@property NSUInteger points;
@property Turn *turn;

-(instancetype)initWithName:(NSString *) name;
-(void) startNewTurn;

// start turn
// roll the dice
// pick the dice

@end
