//
//  PointsForOngoingTurnTest.m
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface PointsForOngoingTurnTest : XCTestCase
@property Turn *turn;
@end

@implementation PointsForOngoingTurnTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.turn = [Turn new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self.turn.heldDice removeAllDice];
}

- (void)tstOngoingRoundPoints {
    [self.turn.heldDice addDices:@[@1, @2, @3, @4, @5]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@1, @1, @5]];
    [self.turn rollDice];

    XCTAssertEqual(1500 + 250, self.turn.pointsForTurn);
}


@end
