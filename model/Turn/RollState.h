//
//  RollState.h
//  Zonk
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turn.h"

@interface RollState : NSObject <TurnState>
@property Turn *turnContext;
-(instancetype) initContextWithTurn:(Turn *) turn;
@end
