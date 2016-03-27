//
//  RollXState.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "Turn.h"
#import "TurnState.h"
#import <Foundation/Foundation.h>

@interface RollXState : NSObject <TurnState>
@property Turn *turnContext;
-(void) rollXDice:(NSUInteger) count;
-(instancetype) initContextWithTurn:(Turn *) turn;
@end
