//
//  AttackModeViewController.h
//  iOS try app
//
//  Created by Maylen Medina on 2/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicModeViewController.h"
#import "../Models/BlockModel.h"
#import "SettingsViewController.h"

@import Firebase;

@interface AttackModeViewController : ClassicModeViewController 


@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (strong, nonatomic) FIRDatabaseReference *ref;


-(void)timerAction;
-(void)updateScore;
//-(BOOL)isGameFinished;



@end
