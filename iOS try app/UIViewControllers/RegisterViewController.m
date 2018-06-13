//
//  RegisterViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 28/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "RegisterViewController.h"

@import Firebase;

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize usernameTextField,emailTextField,passwordTextField,confirmPasswordTextField, ref;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self firebaseTests];
    self.ref = [[FIRDatabase database] reference];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButton:(id)sender {
    
    @try{
        
    if (![usernameTextField.text isEqualToString:@""] ||
        ![emailTextField.text isEqualToString:@""] ||
        ![passwordTextField.text isEqualToString:@""] ||
        ![confirmPasswordTextField.text isEqualToString:@""])
    {
        if (passwordTextField.text == confirmPasswordTextField.text)
            {
                NSString *userName = usernameTextField.text;
                NSString *userEmail = emailTextField.text;
                NSString *userPassword = confirmPasswordTextField.text;
                
                NSString *userScore = @"123";
               // NSString *userScore = @"";
                
                //generate userobject
                UserModelClass *userModel = [[UserModelClass alloc] init];
                userModel.name = userName;
                userModel.email= userEmail;
                userModel.score = userScore;
                
                [[FIRAuth auth]
                 createUserWithEmail:userEmail
                 password:userPassword completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                     
                     if(authResult != nil){
                         
                         //get USER ID returned
                         NSString *userID;
                         userID = [FIRAuth auth].currentUser.uid;
                         
                         //Add user email after create login
                         userModel.email = userEmail;
                         
                         //insert new user profile
                         AppDataProvider *dbProvider = [[AppDataProvider alloc] init];
                         [dbProvider InsertUserProfileData:userModel WithUserID:userID];
                         
                         //go to home screen, insert segue identifier
                         [self performSegueWithIdentifier:@"goToMainMenuSegue" sender:self];
                     }
                     else{
                         //error
                         AlertViewController *errorFirebase = [[AlertViewController alloc] init];
                         [errorFirebase displayAlertMessage:[NSString stringWithFormat:@"%@",error.localizedDescription]];
                     }
                 }];
            }
        else{
            
            //password didnt match
            AlertViewController *errAlert = [[AlertViewController alloc] init];
            [errAlert displayAlertMessage:passwNotMatchingAlertMessageConstant];
        }
    }
    else{
        
        //display error input message
        AlertViewController *errAlert = [[AlertViewController alloc] init];
        [errAlert displayAlertMessage:ceroInputAlertMessageConstant];
    }

    }@catch(NSException *ex){
        
        AlertViewController *alertError = [[AlertViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
    
}

    /*
//alert to test firebase adding new user is working
-(void)alertShowWithTitle:(NSString *)titleInp andBody:(NSString *)bodyInp
{
    UIAlertController* alert;
    alert = [UIAlertController alertControllerWithTitle:titleInp message:bodyInp preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alert animated:true completion:nil];
}*/


@end
