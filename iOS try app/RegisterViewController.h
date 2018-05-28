//
//  RegisterViewController.h
//  iOS try app
//
//  Created by Fatima Abreu on 28/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)confirmButton:(id)sender;

@end
