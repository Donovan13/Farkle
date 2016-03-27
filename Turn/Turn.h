//
//  Turn.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurnState.h"

@interface Turn : NSObject <TurnState>
@property id <TurnState> state;

-(BOOL) canStopTurn;
-(NSUInteger) currentScoreTurn;
-(NSUInteger) selectedDice; // returns count of dice that are selected to hold. User has not yet committed to holding these dice

@end
