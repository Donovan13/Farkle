//
//  TurnStateChangeTests.m
//  Farkle
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "Turn.h"
#import "Roll5State.h"
#import "Roll4State.h"
#import "Roll3State.h"
#import "Roll2State.h"
#import "Roll1State.h"

@interface TurnStateChangeTests : XCTestCase
@property Turn *turn;
@end

@implementation TurnStateChangeTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self.turn.heldDice removeAllDice];
}

- (void)testRollState5_isInitialState{
    // doing strings instead of actual classes because of this wtfness:http://davidstechtips.com/2015/04/iskindofclass-and-xctest/
    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll5State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

- (void)testRollState5_to_RollState4 {
    [self.turn.heldDice  addDices:@[@1]];
    [self.turn rollDice];

    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll4State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

- (void)testRollState5_to_RollState1 {
    [self.turn.heldDice addDices:@[@1, @1, @1, @5]];
    [self.turn rollDice];

    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll1State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

- (void)testRollState5_to_RollState5 {
    [self.turn.heldDice addDices:@[@1, @1, @1, @5, @5]];
    [self.turn rollDice];

    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll5State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

- (void)testRollState4_to_RollState1 {
    [self.turn.heldDice addDices:@[@1]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@2, @2, @2]];
    [self.turn rollDice];

    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll1State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

- (void)testRollState1_to_RollState5 {
    [self.turn.heldDice addDices:@[@1, @1, @5, @5]];
    [self.turn rollDice];
    [self.turn.heldDice addDices:@[@5]];
    [self.turn rollDice];

    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll5State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
}

@end
