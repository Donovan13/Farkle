//
//  FarkleTests.m
//  FarkleTests
//
//  Created by id on 3/26/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Turn.h"

@interface FarkleTests : XCTestCase
@property Turn *turn;

@end

@implementation FarkleTests

- (void)setUp {
    [super setUp];
    self.turn = [Turn new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.turn roll5dice];
}


@end
