//
//  RegisterViewController.m
//  iOS try app
//
//  Created by Fatima Abreu on 28/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButton:(id)sender {
    
    if (![_usernameTextField.text isEqualToString:@""] || ![_emailTextField.text isEqualToString:@""] || ![_passwordTextField.text isEqualToString:@""] || ![_confirmPasswordTextField.text isEqualToString:@""])
    {
        if (_passwordTextField.text == _confirmPasswordTextField.text)
            {
                NSString *email = _emailTextField.text;
                NSString *userPassword = _confirmPasswordTextField.text;
            }
    }
    
}
@end
