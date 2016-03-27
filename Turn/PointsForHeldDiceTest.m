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

- (void)testFiveOfAKind_3 {
    [self.turn addDicesToHeldDice:@[@3, @3, @3, @3, @3]];
    [self.turn rollDice];
    XCTAssertEqual(1500, self.turn.pointsForHeldDice);
}

- (void)testFiveOfAKind_1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @1, @1]];
    [self.turn rollDice];
    XCTAssertEqual(1600, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @2, @3]];
    [self.turn rollDice];
    XCTAssertEqual(1000, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_3 {
    [self.turn addDicesToHeldDice:@[@2, @3, @3, @2, @3]];
    [self.turn rollDice];
    XCTAssertEqual(300, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_6 {
    [self.turn addDicesToHeldDice:@[@2, @6, @6, @2, @6]];
    [self.turn rollDice];
    XCTAssertEqual(600, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_6_extrasv1 {
    [self.turn addDicesToHeldDice:@[@1, @6, @6, @2, @6]];
    [self.turn rollDice];
    XCTAssertEqual(700, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_6_extrasv2 {
    [self.turn addDicesToHeldDice:@[@1, @6, @6, @5, @6]];
    [self.turn rollDice];
    XCTAssertEqual(750, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_1_extrasv1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @2, @1]];
    [self.turn rollDice];
    XCTAssertEqual(1100, self.turn.pointsForHeldDice);
}

- (void)testThreeOfAKind_1_extrasv2 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @1]];
    [self.turn rollDice];
    XCTAssertEqual(1100, self.turn.pointsForHeldDice);
}

- (void)testOnlyScoringDice_v1 {
    [self.turn addDicesToHeldDice:@[@1, @5, @2, @3, @2]];
    [self.turn rollDice];
    XCTAssertEqual(150, self.turn.pointsForHeldDice);
}

- (void)testOnlyScoringDice_v2 {
    [self.turn addDicesToHeldDice:@[@1]];
    [self.turn rollDice];
    XCTAssertEqual(100, self.turn.pointsForHeldDice);
}

- (void)testOnlyNoScoringDice_v1 {
    [self.turn addDicesToHeldDice:@[@2, @2, @3, @3, @4]];
    [self.turn rollDice];
    XCTAssertEqual(0, self.turn.pointsForHeldDice);
}

- (void)testOnlyNoScoringDice_v2 {
    [self.turn addDicesToHeldDice:@[@2, @6]];
    [self.turn rollDice];
    XCTAssertEqual(0, self.turn.pointsForHeldDice);
}

@end
