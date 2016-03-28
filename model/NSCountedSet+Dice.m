//
//  NSCountedSet+Dice.m
//  Farkle
//
//  Created by id on 3/27/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "NSCountedSet+Dice.h"

@implementation NSCountedSet (Dice)

-(NSUInteger) diceCount {
    NSUInteger count = 0;
    NSArray *tmp = [self allObjects];
    for (NSNumber *num in tmp) {
        count += [self countForObject:num];
    }
    return count;
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

-(BOOL) isThreeOfAKindWithOne {
    return [self isThreeOfAKind] && [[self whichThreeOfAKind] integerValue]==1;
}

-(BOOL) isFiveOfAKindWithOne {
    return [self isFiveOfAKind] && [[self whichFiveOfAKind] integerValue]==1;
}

-(BOOL) isThreeOfAKind { return ![[self whichValueRepeatedForCount:@3 greaterThanOrEqual:@"greater"] isEqual: @-1]; }
-(BOOL) isFiveOfAKind  { return ![[self whichValueRepeatedForCount:@5 greaterThanOrEqual:@"equal"] isEqual: @-1]; }

-(NSNumber *) whichThreeOfAKind { return [self whichValueRepeatedForCount:@3 greaterThanOrEqual:@"greater"]; }
-(NSNumber *) whichFiveOfAKind  { return [self whichValueRepeatedForCount:@5 greaterThanOrEqual:@"equal"]; }

-(NSNumber *)whichValueRepeatedForCount:(NSNumber *)count
                     greaterThanOrEqual:(NSString *)comparison{
    // todo: ugly. NSComparator? blocks?
    if ([comparison isEqualToString:@"equal"]){
        for (NSNumber *dice in self) {
            if ([self countForObject:dice] == [count integerValue]) {
                return dice;
            }
        }
        return @-1;
    } else if ([comparison isEqualToString:@"greater"]){
        for (NSNumber *dice in self) {
            if ([self countForObject:dice] >= [count integerValue]) {
                return dice;
            }
        }
        return @-1;
    }
    return @-1;
}

-(NSNumber *) lowNumberForStraight {
    return @-1;
}


-(void) addDices:(NSArray<NSNumber *> *) dices {
    for (NSNumber *dice in dices) {
        [self addDice:dice];
    }
}

-(void) addDice:(NSNumber *) dice { [self addObject:dice]; }
-(void) removeDice:(NSNumber *) dice { [self removeObject:dice]; }
-(void) removeAllDice { [self removeAllObjects]; }

-(NSString *) description {
    NSString *string = @"";
    NSLog(@"%@", self);
    for (NSNumber *dice in self) {
        [string stringByAppendingFormat:@"%@", dice];
    }
    return @"wtf";
    return string;
}

@end
