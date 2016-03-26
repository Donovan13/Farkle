//
//  ViewController.m
//  Farkle
//
//  Created by Kyle on 3/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()<DieLabelDelegate>

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *dieLabels;
@property NSMutableArray<DieLabel*> *heldDice;
@end

@implementation ViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.heldDice = [NSMutableArray new];
    for (DieLabel *dieLabel in self.dieLabels) {
        dieLabel.delegate = self;
    }
}

#pragma mark - IBActions
- (IBAction)onRollButtonPressed:(UIButton *)sender {
    NSArray *unrolled = [self inArray:self.dieLabels andNotInArray:self.heldDice];
    for (DieLabel *dieLabel in unrolled) {
        [dieLabel dieRoll];
    }
}

#pragma mark - DieLabelDelegate
-(void) didSelectDie:(DieLabel *) dieLabel {
    [self.heldDice addObject:dieLabel];
    [self moveDieToHeldArea:dieLabel];
}

-(void) moveDieToHeldArea:(DieLabel *) dieLabel {
    CGPoint newCenter = [self pointForNextEmptyHeldDieArea];

    NSLog(@"before frame %@", NSStringFromCGRect(dieLabel.frame));
    NSLog(@"before bounds %@", NSStringFromCGRect(dieLabel.bounds));
    [UIView animateWithDuration:0.5
                     animations:^{ dieLabel.center = newCenter; }
                     completion:^(BOOL finished) {
                         [self.view removeConstraints:dieLabel.constraints];
                     }];


    NSLog(@"after frame%@", NSStringFromCGRect(dieLabel.frame));
    NSLog(@"after bounds %@", NSStringFromCGRect(dieLabel.bounds));
}

#pragma mark - private methods
-(NSArray *) inArray:(NSArray *)array1
       andNotInArray:(NSArray *)array2 {
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:array1];
    [newArray removeObjectsInArray:array2];
    return newArray;;
}

-(CGPoint) pointForNextEmptyHeldDieArea {
    CGFloat yOffsetFromTop = 100;
    CGFloat width = self.view.frame.size.width;
    CGFloat xDivider = width / (self.dieLabels.count + 1);
    long heldDie = self.heldDice.count;

    CGFloat xOffsetFromRight = xDivider * heldDie;
    CGPoint heldDieCenter = CGPointMake(xOffsetFromRight, yOffsetFromTop);
    return heldDieCenter;
}

@end
