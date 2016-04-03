//
//  Game.h
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@protocol GameProtocol <NSObject>
-(BOOL) canStopTurn;
-(void) stopTurn;

-(BOOL) canMoveFromRolledDiceToHeldDice:(NSNumber *)dice;
-(void) moveFromRolledDiceToHeldDice:(NSNumber *)dice;

-(BOOL) canRoll;
-(void) roll;

-(BOOL) canAddPlayer;
-(void) addPlayer;
@end

@interface Game : NSObject <GameProtocol>
@property Player *player;
@end