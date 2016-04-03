//
//  PointsForOngoingTurnTest.m
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface PointsForOngoingTurnTest : XCTestCase
@property Turn *turn;
@end

@implementation PointsForOngoingTurnTest

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    [super tearDown];
    [self.turn.heldDice removeAllDice];
}

- (void)testOngoingRoundPoints {
    [self.turn.heldDice addDices:@[@1, @2, @3, @4, @5]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@1, @1, @5]];
    [self.turn rollDice];

    XCTAssertEqual(1500 + 250, self.turn.pointsForTurn);
}

- (void)testOngoingRoundPoints3Rounds {
    [self.turn.heldDice addDices:@[@1, @2, @3, @4, @5]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@1, @1, @5]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@1, @1]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@6, @6, @6]];
    [self.turn rollDice];

    XCTAssertEqual(1500 + 250 + 200 + 600, self.turn.pointsForTurn);
}

@end
