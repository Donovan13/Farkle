//
//  PlayerTests.m
//  Farkle
//
//  Created by id on 4/2/16.
//  Copyright © 2016 IdRaja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Player.h"

@interface PlayerTests : XCTestCase
@property Player *player;
@end

@implementation PlayerTests

- (void)setUp {
    [super setUp];
    self.player = [[Player alloc]initWithName:@"Idris"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPlayerDoingSomething{
    [self.player startNewTurn];
}

@end
