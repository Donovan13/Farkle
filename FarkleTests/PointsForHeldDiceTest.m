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
    XCTAssertEqual(1500, self.turn.heldDice.points);
}

- (void)testStraight_2_thru_6 {
    [self.turn addDicesToHeldDice:@[@6, @2, @3, @4, @5]];
    XCTAssertEqual(1500, self.turn.heldDice.points);
}

- (void)testFiveOfAKind_3 {
    [self.turn addDicesToHeldDice:@[@3, @3, @3, @3, @3]];
    XCTAssertEqual(1500, self.turn.heldDice.points);
}

- (void)testFiveOfAKind_1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @1, @1]];
    XCTAssertEqual(1600, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @2, @3]];
    XCTAssertEqual(1000, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_3 {
    [self.turn addDicesToHeldDice:@[@2, @3, @3, @2, @3]];
    XCTAssertEqual(300, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_6 {
    [self.turn addDicesToHeldDice:@[@2, @6, @6, @2, @6]];
    XCTAssertEqual(600, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_6_extrasv1 {
    [self.turn addDicesToHeldDice:@[@1, @6, @6, @2, @6]];
    XCTAssertEqual(700, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_6_extrasv2 {
    [self.turn addDicesToHeldDice:@[@1, @6, @6, @5, @6]];
    XCTAssertEqual(750, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_1_extrasv1 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @2, @1]];
    XCTAssertEqual(1100, self.turn.heldDice.points);
}

- (void)testThreeOfAKind_1_extrasv2 {
    [self.turn addDicesToHeldDice:@[@1, @1, @1, @1]];
    XCTAssertEqual(1100, self.turn.heldDice.points);
}

- (void)testOnlyScoringDice_v1 {
    [self.turn addDicesToHeldDice:@[@1, @5, @2, @3, @2]];
    XCTAssertEqual(150, self.turn.heldDice.points);
}

- (void)testOnlyScoringDice_v2 {
    [self.turn addDicesToHeldDice:@[@1]];
    XCTAssertEqual(100, self.turn.heldDice.points);
}

- (void)testOnlyNoScoringDice_v1 {
    [self.turn addDicesToHeldDice:@[@2, @2, @3, @3, @4]];
    XCTAssertEqual(0, self.turn.heldDice.points);
}

- (void)testOnlyNoScoringDice_v2 {
    [self.turn addDicesToHeldDice:@[@2, @6]];
    XCTAssertEqual(0, self.turn.heldDice.points);
}

@end
