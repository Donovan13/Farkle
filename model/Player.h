//
//  Player.h
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurnState.h"

@interface Player : NSObject

@property NSString *name;
@property NSUInteger hits;
@property NSUInteger points;

@end