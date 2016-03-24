//
//  ViewController.m
//  Farkle
//
//  Created by Kyle on 3/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *dieLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onRollButtonPressed:(UIButton *)sender {
    for (DieLabel *dieLabel in self.dieLabels) {
        [dieLabel dieRoll];
    }
}

@end
