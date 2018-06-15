//
//  SettingsViewController.h
//  iOS try app
//
//  Created by Maylen Medina on 5/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Alerts/AlertViewController.h"
#import "../Providers/AppDataProvider.h"
#import "../Models/UserModelClass.h"

@import Firebase;

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UILabel *bestTimeLabel;

- (IBAction)logoutButton:(id)sender;

-(void)prepareData;

-(void)alertShowWithTitle:(NSString *)titleInp andBody:(NSString *)bodyInp;

@end
