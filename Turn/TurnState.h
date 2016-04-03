//
//  State.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@protocol TurnState <NSObject>
@required

-(BOOL) isTurnOver;
-(BOOL) canStopTurn;
-(BOOL) canRollDice;

// events that transition between states
-(void) rollDice;
-(void) stay;
// *************************************

@optional
-(instancetype) initContextWithPlayer:(Player *) player;

@end
