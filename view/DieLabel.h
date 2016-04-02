//
//  DieLabel.h
//  Farkle
//
//  Created by Id Raja on 3/24/16.
//  Copyright © 2016 Id Raja. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DieLabel;

@protocol DieLabelDelegate <NSObject>
-(void) didSelectDie:(DieLabel *) dieLabel;
-(void) moveDieToHeldArea:(DieLabel *) dieLabel;
@end

@interface DieLabel : UILabel
@property (nonatomic, assign) id<DieLabelDelegate>delegate;
-(void) dieRoll;
@end
