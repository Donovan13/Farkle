//
//  CanStopTurnTests.m
//  CanStopTurnTests
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface CanStopTurnTests : XCTestCase
@property Turn *turn;

@end

@implementation CanStopTurnTests

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    [super tearDown];
    [self.turn removeAllDicesFromHeldDice];
}

- (void)testRoll5_0_HeldDice {
    XCTAssertFalse(self.turn.canStopTurn);
}

- (void)testRoll5_1_HeldDice {
    NSArray *tmp =@[@1];
    [self.turn addDicesToHeldDice:tmp];
    XCTAssertFalse(self.turn.canStopTurn);
}

- (void)testRoll5_2_HeldDice {
    NSArray *tmp =@[@1, @5];
    [self.turn addDicesToHeldDice:tmp];
    XCTAssertFalse(self.turn.canStopTurn);
}

- (void)testRoll5_3_heldDice{
    NSArray *tmp =@[@1, @5, @5];
    [self.turn addDicesToHeldDice:tmp];
    XCTAssertTrue(self.turn.canStopTurn);
};

- (void)testRoll5_4_heldDice{
    NSArray *tmp =@[@1, @2, @2, @2];
    [self.turn addDicesToHeldDice:tmp];
    XCTAssertTrue(self.turn.canStopTurn);
};

- (void)testRoll5_5_heldDice{
    NSArray *tmp =@[@1, @2, @2, @2, @5];
   [self.turn addDicesToHeldDice:tmp];
    XCTAssertFalse(self.turn.canStopTurn);
};



@end
