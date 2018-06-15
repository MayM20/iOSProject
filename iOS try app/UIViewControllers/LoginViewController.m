//
//  LoginViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 1/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "LoginViewController.h"

@import Firebase;

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameTextField, passwordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)dismissKeyboard {
    
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
 
}


- (IBAction)loginButton:(id)sender {
    
    @try{
        
        if([usernameTextField.text isEqualToString:@""]){
            AlertViewController *customAlert = [[AlertViewController alloc] init];
            [customAlert displayInputAlert: [usernameTextField placeholder]];
        }
        else if([passwordTextField.text isEqualToString:@""]){
            AlertViewController *customAlert = [[AlertViewController alloc] init];
            [customAlert displayInputAlert: [passwordTextField placeholder]];
        }
        else{
           
           //start the login process
            
            [[FIRAuth auth] signInWithEmail:usernameTextField.text
                                    password:passwordTextField.text
                                    completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                 
            
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
                                dispatch_get_main_queue(),
                                ^{
                                    
                                    
                                    if(authResult){
                                        [self performSegueWithIdentifier:@"login_identifier_segue" sender:self];
                                    }
                                    else{
                                        AlertViewController *alertError = [[AlertViewController alloc] init];
                                        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
                                    }
                                });
             }];
        }
    }
    @catch(NSException *ex){
        
    
        AlertViewController *alertError = [[AlertViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}
@end
