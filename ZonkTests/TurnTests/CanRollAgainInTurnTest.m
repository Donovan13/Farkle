//
//  CanRollAgainInTurnTest.m
//  Zonk
//
//  Created by id on 4/2/16.
//  Copyright © 2016 IdRaja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"
#import "NSCountedSet+Dice.h"
#import "Roll5State.h"

@interface CanRollAgainInTurnTest : XCTestCase
@property Turn *turn;
@end

@implementation CanRollAgainInTurnTest

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    [super tearDown];
    [self.turn.heldDice   removeAllDice];
    [self.turn.rolledDice removeAllDice];
    [self.turn.bankedDice removeAllDice];
}

- (void)testCanRollWithHeldDiceState{
    NSArray *tmp = @[@6, @6, @6, @1, @5];
    [self.turn.rolledDice addDices:tmp];

    [self.turn moveFromRolledDiceToHeldDice:@6];
    XCTAssertFalse(self.turn.canRollDice);

    [self.turn moveFromRolledDiceToHeldDice:@6];
    XCTAssertFalse(self.turn.canRollDice);

    [self.turn moveFromRolledDiceToHeldDice:@6];
    XCTAssertTrue(self.turn.canRollDice);
}

-(void) testCanRollInRollState5 {
    // should always be yes
    NSString *expectedClass = NSStringFromClass([self.turn.state class]);
    NSString *receivedClass = NSStringFromClass([Roll5State class]);
    XCTAssertEqualObjects(expectedClass, receivedClass, @"exp:%@ rec:%@", expectedClass, receivedClass);
    XCTAssertTrue(self.turn.canRollDice);
}

@end
