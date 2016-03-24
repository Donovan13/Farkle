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

- (instancetype) init {
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(tapTarget)];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(panTarget)];
        
        [self addGestureRecognizer:tap];
        [self addGestureRecognizer:pan];
    }
}


@end
