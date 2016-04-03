//
//  MoveFromRolledDiceToHeldDice.m
//  Farkle
//
//  Created by id on 4/2/16.
//  Copyright © 2016 IdRaja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"
#import "NSCountedSet+Dice.h"

@interface MoveFromRolledDiceToHeldDice : XCTestCase
@property Turn *turn;
@end

@implementation MoveFromRolledDiceToHeldDice

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testCombiningHeldAndRolled {
    NSArray *tmp =@[@6, @6, @6];
    [self.turn.rolledDice addDices:tmp];
    [self.turn.heldDice addDices:@[@2, @2]];
    NSCountedSet *comboSet = [self.turn.heldDice setByAddingSet:self.turn.rolledDice];
    XCTAssertTrue(comboSet.diceCount == 5, @"%@", [comboSet myDescription]);
}

- (void)testMoveThreeOfAKind {
    NSArray *tmp =@[@2, @3, @6, @6, @6];
    [self.turn.rolledDice addDices:tmp];
    [self.turn moveFromRolledDiceToHeldDice:@6];
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@6]);
}


@end
