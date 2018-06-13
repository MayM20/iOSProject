//
//  LoginViewController.h
//  iOS try app
//
//  Created by Maylen Medina on 1/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Alerts/AlertViewController.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButton:(id)sender;

@end
