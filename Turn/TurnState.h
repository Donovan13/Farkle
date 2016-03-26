//
//  State.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@protocol TurnState <NSObject>

@optional
-(instancetype) initContextWithPlayer:(Player *) player;
-(void) roll5dice;
-(void) roll4dice;
-(void) roll3dice;
-(void) roll2dice;
-(void) roll1dice;
-(void) stay;

@end
