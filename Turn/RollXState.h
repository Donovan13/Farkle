//
//  RollXState.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurnState.h"
#import "Player.h"

@interface RollXState : NSObject <TurnState>
@property Player *playerContext;
@end
