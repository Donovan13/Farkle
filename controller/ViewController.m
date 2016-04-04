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
#import "DiceHeaderTypeCollectionReusableView.h"

typedef NS_ENUM(NSUInteger, DiceSection) {
    DiceSectionBanked = 0,
    DiceSectionHeld,
    DiceSectionRolled
};

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) Game *game;
@end

@implementation ViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.game = [Game new];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case DiceSectionBanked:
            return self.game.player.turn.bankedDice.diceCount;
            break;

        case DiceSectionHeld:
            return self.game.player.turn.heldDice.diceCount;
            break;

        case DiceSectionRolled:
            return self.game.player.turn.rolledDice.diceCount;
            break;

        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID = @"cellID";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID
                                                                           forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor blueColor].CGColor;
    cell.layer.borderWidth = 2.0f;
    return cell;
}

-(BOOL) collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void) collectionView:(UICollectionView *)collectionView
   moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath {

}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;

    NSString *reuseID;
    if (kind == UICollectionElementKindSectionHeader){
        reuseID = @"headerView";
        DiceHeaderTypeCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                              withReuseIdentifier:reuseID
                                                                                                     forIndexPath:indexPath];
        NSString *title = nil;
        switch (indexPath.section) {
            case DiceSectionBanked:
                title = @"Banked Dice";
                break;

            case DiceSectionHeld:
                title = @"Held Dice";
                break;

            case DiceSectionRolled:
                title = @"Rolled Dice";
                break;
            default:
                break;
        }
        headerView.label.text = title;
        reusableView = headerView;
    }
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0., 50.);
}


#pragma mark - IBActions
- (IBAction)rollButtonPressed:(UIButton *)sender {
    if ([self.game.player.turn canRollDice]) {
        [self.game.player.turn rollDice];
        [self.collectionView reloadData];
    }
}

- (IBAction)stopTurnButtonPressed:(UIButton *)sender {
    if ([self.game.player.turn canStopTurn]) {
        [self.game.player.turn rollDice];
        [self.collectionView reloadData];
    }
}

@end