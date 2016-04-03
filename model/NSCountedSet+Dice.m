//
//  NSCountedSet+Dice.m
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "NSCountedSet+Dice.h"

typedef BOOL (^comparisonType)(NSUInteger, NSUInteger);
comparisonType equalTo = ^BOOL(NSUInteger x, NSUInteger y) {return x == y;};
comparisonType greaterThanOrEqualTo = ^BOOL(NSUInteger x, NSUInteger y) {return x >= y;};

@implementation NSCountedSet (Dice)

#pragma mark - public methods
-(NSUInteger) diceCount {
    return [[self arrayFromSet] count];
}

-(NSCountedSet *) setByAddingSet:(NSCountedSet *)set {
    NSArray *array1 = [self arrayFromSet];
    NSArray *array2 = [set arrayFromSet];
    NSArray *comboArray = [array1 arrayByAddingObjectsFromArray:array2];
    return [[NSCountedSet alloc] initWithArray:comboArray];
}

-(NSUInteger) points {
    NSCountedSet *heldDiceCopy = [self copy];
    NSUInteger points = 0;

    // 5 dice scoring options. return immediately
    if ([self isStraight]) {
        return 1500;
    } else if ([self isFiveOfAKindWithOne]) {
        return 1600;
    } else if ([self isFiveOfAKind]) {
        return 1500;
        // 3 dice scoring options. dont return immediately to count extra dice
    } else if ([self isThreeOfAKindWithOne] || [self isFiveOfAKindWithOne]) {
        for (int i=0; i<3; i++) [heldDiceCopy removeObject:@1];
        points = 1000;
    } else if ([self isThreeOfAKind]) {
        NSNumber *threeKindDice = [self whichThreeOfAKind];
        for (int i=0; i<3; i++) [heldDiceCopy removeObject:threeKindDice];
        points = 100 * [threeKindDice intValue];
    }

    points += [heldDiceCopy countForObject:@1] * 100;
    points += [heldDiceCopy countForObject:@5] * 50;
    return points;
}

-(BOOL) isStraight {
    BOOL has2Thru5 = [self containsObject:@2] && [self containsObject:@3] &&
                     [self containsObject:@4] && [self containsObject:@5];
    BOOL has1 = [self containsObject:@1];
    BOOL has6 = [self containsObject:@6];
    return (has2Thru5 && has1) || (has2Thru5 && has6);
}

-(BOOL) isThreeOfAKind {
    return [[self whichValueRepeatedForCount:@3 forComparisonType:greaterThanOrEqualTo] intValue] != -1;
}

-(BOOL) isThreeOfAKindWithOne {
    return [self isThreeOfAKind] && [[self whichThreeOfAKind] integerValue]==1;
}

-(BOOL) isFiveOfAKind  {
    return [[self whichValueRepeatedForCount:@5 forComparisonType:equalTo] intValue] != -1;
}

-(BOOL) isFiveOfAKindWithOne {
    return [self isFiveOfAKind] && [[self whichFiveOfAKind] integerValue]==1;
}

-(NSNumber *) whichThreeOfAKind {
    return [self whichValueRepeatedForCount:@3 forComparisonType:greaterThanOrEqualTo];
}

-(NSNumber *) whichFiveOfAKind  {
    return [self whichValueRepeatedForCount:@5 forComparisonType:equalTo];
}

-(void) addDice:(NSNumber *) dice {
    [self addObject:dice];
}

-(void) addDices:(NSArray<NSNumber *> *) dices {
    for (NSNumber *dice in dices) {
        [self addDice:dice];
    }
}

-(void) removeDice:(NSNumber *) dice {
    [self removeObject:dice];
}

-(void) removeAllDice {
    [self removeAllObjects];
}

-(BOOL) isFiveOfAKindWithNumber:(NSNumber *) number {
    return [self whichValueRepeatedForCount:@5 forComparisonType:equalTo] == number;
}

-(BOOL) isThreeOfAKindWithNumber:(NSNumber *) number {
    return [self whichValueRepeatedForCount:@3 forComparisonType:greaterThanOrEqualTo] == number;
}

-(BOOL) isStraightWithNumber:(NSNumber *) number{
    return [self isStraight] && [self containsObject:number];
}

-(BOOL) isSingleScoringDiceWithNumber:(NSNumber *) number{
    return [number integerValue] == 5 || [number integerValue] == 1;
}

-(NSString *) myDescription {
    NSString *string = @"";
    for (NSNumber *dice in self) {
        string = [string stringByAppendingFormat:@"Dice:%@X:%li\n", dice, [self countForObject:dice]];
    }
    return string;
}

#pragma mark - private methods
-(NSArray *) arrayFromSet {
    NSArray *tmp = [self allObjects];
    NSMutableArray *mutTmp = [NSMutableArray new];
    long count = 0;
    for (NSNumber *num in tmp) {
        count = [self countForObject:num];
        for (int i = 0; i < count; i++) {
            [mutTmp addObject:num];
        }
    }
    return [NSArray arrayWithArray:mutTmp];
}

-(NSNumber *)whichValueRepeatedForCount:(NSNumber *)count
                     forComparisonType:(comparisonType) comparison {
    for (NSNumber *dice in self) {
        if (comparison([self countForObject:dice], [count intValue])) {
            return dice;
        }
    }
    return @-1;
}

@end
