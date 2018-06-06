//
//  SettingsViewController.h
//  iOS try app
//
//  Created by Fatima Abreu on 5/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertViewController.h"
#import "AppDataProvider.h"
#import "UserModelClass.h"

@import Firebase;

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray *data;

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)logoutButton:(id)sender;

-(void)alertShowWithTitle:(NSString *)titleInp andBody:(NSString *)bodyInp;

@end
