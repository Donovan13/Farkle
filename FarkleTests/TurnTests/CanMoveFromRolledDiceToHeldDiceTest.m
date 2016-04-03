//
//  CanMoveFromRolledDiceToHeldDiceTest.m
//  Zonk
//
//  Created by id on 3/28/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface CanMoveFromRolledDiceToHeldDiceTest : XCTestCase
@property Turn *turn;
@end

@implementation CanMoveFromRolledDiceToHeldDiceTest

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testCanMoveRolledToHeld_ScoringDice {
    NSArray *tmp =@[@1, @5];
    [self.turn.rolledDice addDices:tmp];

    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@5]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@1]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@1]);
}

-(void) testCanMoveRolledToHeld_NonScoringDice {
    NSArray *tmp =@[@2, @4];
    [self.turn.rolledDice addDices:tmp];

    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@2]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@4]);
}

-(void) testCanMoveRolledToHeld_ThreeKind{
    NSArray *tmp =@[@6, @6, @6, @3, @4];
    [self.turn.rolledDice addDices:tmp];

    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@6]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@4]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@3]);
}

-(void) testCanMoveRolledToHeld_Straight{
    NSArray *tmp =@[@1, @2, @3, @4, @5];
    [self.turn.rolledDice addDices:tmp];

    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@1]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@2]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@3]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@4]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@5]);
}

-(void) testCanMoveRolledToHeld_StraightAlmost{
    NSArray *tmp =@[@6, @2, @3, @4, @1];
    [self.turn.rolledDice addDices:tmp];
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@6]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@2]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@3]);
    XCTAssertFalse([self.turn canMoveFromRolledDiceToHeldDice:@4]);
    XCTAssertTrue([self.turn canMoveFromRolledDiceToHeldDice:@1]);
}

@end