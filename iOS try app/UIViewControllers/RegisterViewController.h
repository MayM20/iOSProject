//
//  RegisterViewController.h
//  iOS try app
//
//  Created by Maylen Medina on 28/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Providers/AppDataProvider.h"
#import "../Alerts/AlertViewController.h"

@import Firebase;

@interface RegisterViewController : UIViewController

@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)confirmButton:(id)sender;

@end
