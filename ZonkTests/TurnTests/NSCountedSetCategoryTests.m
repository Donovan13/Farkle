//
//  NSCountedSetCategoryTests.m
//  Zonk
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
    self.set = [NSCountedSet new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.set = nil;
}

- (void)testDescriptionWorks{
    NSArray *tmp = @[@1, @5];
    [self.set addDices:tmp];
    NSString *description = [self.set myDescription];
    XCTAssertFalse([description isEqualToString:@""], @"goddamn empty");
}

-(void) DISABLED_CombiningSets {
//    NSArray *tmp = @[@1, @5];
    NSCountedSet *comboSet = [self.set setByAddingSet:self.set];
    XCTAssertTrue(comboSet.diceCount == 5, @"%li", comboSet.count);
    XCTAssertTrue([comboSet countForObject:@3] == 2);
    XCTAssertTrue([comboSet countForObject:@2] == 1);
    XCTAssertTrue([comboSet countForObject:@1] == 1);
}

-(void) DISABLED_DiceCount {

}

@end
