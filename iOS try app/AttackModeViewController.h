//
//  AttackModeViewController.h
//  iOS try app
//
//  Created by Fatima Abreu on 2/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicModeViewController.h"

@interface AttackModeViewController : ClassicModeViewController 


@property (weak, nonatomic) IBOutlet UILabel *timer;

-(void)timerAction;



@end
