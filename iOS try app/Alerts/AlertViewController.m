//
//  AlertViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 30/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

//Constants for Alerts/Users/Maylen/Documents/iOSProject/iOS try app/Alerts/AlertViewController.h/Users/Maylen/Documents/iOSProject/iOS try app/Alerts/AlertViewController.m
NSString *const alertMessageConstant = @"default";
NSString *const alertTitleConstant = @"PuzzleAttack";
NSString *const alertButtonConstant = @"Ok";


NSString *const inputAlertMessageConstant = @"Please complete: ";
NSString *const inputAlertTitleConstant = @"Empty field";
NSString *const ceroInputAlertMessageConstant = @"Please fill information in all fields";
NSString *const passwNotMatchingAlertMessageConstant = @"Sorry, try again, passwords not matching";


NSString *const alertLoggedOutTitle= @"LOGGED OUT";
NSString *const alertMessageLoggedOut = @"You have succesfully logged out";


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UIViewController *)topViewController {
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

//get current view controller
- (UIViewController *)topViewController:(UIViewController *)rootViewController {
    
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}


-(void)displayInputAlert: (NSString *) fieldName{
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle: inputAlertTitleConstant
                                message: [inputAlertMessageConstant stringByAppendingString: fieldName]
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle: alertButtonConstant
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action)
                               {
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    [alert addAction: okButton];
    
    //display alert
    UIViewController *rootViewController = self.topViewController;
    [rootViewController presentViewController:alert animated:YES completion:nil];
}



-(void)displayAlertMessage: (NSString *) message{
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle: alertTitleConstant
                                message: message
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle: alertButtonConstant
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action)
                               {
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    //OK button added
    [alert addAction: okButton];
    
    //display alert
    UIViewController *rootViewController = self.topViewController;
    [rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
