//
//  NSCountedSetCategoryTests.m
//  Farkle
//
//  Created by id on 4/2/16.
//  Copyright © 2016 IdRaja. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSCountedSet+Dice.h"

@interface NSCountedSetCategoryTests : XCTestCase
@property NSCountedSet *set;
@end

@implementation NSCountedSetCategoryTests

- (void)setUp {
    [super setUp];
    NSArray *tmp = @[@2, @3, @3];
    self.set = [[NSCountedSet alloc] initWithArray:tmp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDescriptionWorks{
    NSString *description = [self.set myDescription];
    XCTAssertFalse([description isEqualToString:@""], @"goddamn empty");
}

-(void) testCombiningSets {
    NSArray *tmp = @[@1, @5];
    NSCountedSet *newSet = [[NSCountedSet alloc] initWithArray:tmp];
    NSCountedSet *comboSet = [newSet setByAddingSet:self.set];
    XCTAssertTrue(comboSet.diceCount == 5, @"%li", comboSet.count);
    XCTAssertTrue([comboSet countForObject:@3] == 2);
    XCTAssertTrue([comboSet countForObject:@2] == 1);
    XCTAssertTrue([comboSet countForObject:@1] == 1);
}

@end
