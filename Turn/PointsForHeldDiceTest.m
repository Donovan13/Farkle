//
//  PointsForHeldDiceTest.m
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface PointsForHeldDiceTest : XCTestCase
@property Turn *turn;
@end

@implementation PointsForHeldDiceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.turn = [Turn new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self.turn removeAllDicesFromHeldDice];
}

- (void)testStraight_1_thru_5 {
    [self.turn addDicesToHeldDice:@[@1, @2, @3, @4, @5]];
    [self.turn rollDice];
    XCTAssertEqual(1500, self.turn.pointsForHeldDice);
}

- (void)testStraight_2_thru_6 {
    [self.turn addDicesToHeldDice:@[@6, @2, @3, @4, @5]];
    [self.turn rollDice];
    XCTAssertEqual(1500, self.turn.pointsForHeldDice);
}

@end
