//
//  ViewController.m
//  Zonk
//
//  Created by Id Raja on 3/24/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import "ViewController.h"
#import "NSCountedSet+Dice.h"
#import "Game.h"

@interface ViewController ()
@property (strong, nonatomic) Game *game;
@end

@implementation ViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [Game new];
}

#pragma mark - IBActions
- (IBAction)rollButtonPressed:(UIButton *)sender {
    if ([self.game canRoll]) {
        [self.game roll];
    }
}

- (IBAction)stopTurnButtonPressed:(UIButton *)sender {
    if ([self.game canStopTurn]) {
        [self.game stopTurn];
    }
}

-(void) canMoveFromRolledDiceToHeldDice:(NSNumber *)dice {
    if ([self.game canMoveFromRolledDiceToHeldDice:dice]) {
        [self.game canMoveFromRolledDiceToHeldDice:dice];
    }
}

-(void) setDiceValue { }

@end