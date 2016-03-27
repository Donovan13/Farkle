//
//  DieLabel.m
//  Farkle
//
//  Created by Kyle on 3/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel() <UIGestureRecognizerDelegate>
@end

@implementation DieLabel

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTarget:)];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTarget:)];

        self.gestureRecognizers = @[tap, pan];
        for (UIGestureRecognizer *gestureRecognizer in self.gestureRecognizers) {
            gestureRecognizer.delegate = self;
        }
    }
    return self;
}

-(void) tapTarget:(UIGestureRecognizer *)gestureRecognizer {
    [self.delegate didSelectDie:self];
    self.backgroundColor = [UIColor blueColor];
    [self removeGestureRecognizer:gestureRecognizer];
}

-(void) panTarget:(UIGestureRecognizer *)gestureRecognizer {
}

-(void) dieRoll {
    int i = arc4random_uniform(6);
    self.text = [NSString stringWithFormat:@"%i", i + 1];
}

@end
