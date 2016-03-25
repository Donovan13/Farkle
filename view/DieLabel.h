//
//  DieLabel.h
//  Farkle
//
//  Created by Kyle on 3/24/16.
//  Copyright © 2016 Kyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>

@end


@interface DieLabel : UILabel
@property (nonatomic, assign) id<DieLabelDelegate>delegate;
-(void) dieRoll;
@end
