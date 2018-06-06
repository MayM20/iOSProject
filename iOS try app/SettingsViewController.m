//
//  SettingsViewController.m
//  iOS try app
//
//  Created by Fatima Abreu on 5/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "SettingsViewController.h"
@import Firebase;

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize firstNameLabel, ref;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.ref = [[FIRDatabase database] reference];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
//trying to display data from one screen to the other
-(void)prepareData{
    /*
    FIRDatabaseReference *rootNode= [[FIRDatabase database] referenceFromURL:[NSString stringWithFormat:@"%@/agreements",<database-url>]];
    [rootNode observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot)
     {
         if (snapshot.exists)
         {
             NSLog(@“%@”,snapshot.value);
         }
     }];*/
    [[self.ref child:@"profile"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        NSDictionary *postFirebase = snapshot.value;
        
        NSLog(@"first_name: %@", postFirebase);
        
        
        
    }];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self prepareData];
}
- (IBAction)logoutButton:(id)sender {
    
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        //NSLog(@"Error signing out: %@", signOutError);
        AlertViewController *errorFirebase = [[AlertViewController alloc] init];
        [errorFirebase displayAlertMessage:[NSString stringWithFormat:@"%@",signOutError.localizedDescription]];
        return;
    }
    else{
        /*UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle: alertLoggedOutTitle
                                    message:alertMessageLoggedOut
                                    preferredStyle:UIAlertControllerStyleAlert];*/
        NSLog(@"You have successfully logout");

    [self performSegueWithIdentifier:@"goToEntryView" sender:self];
    }
}
-(void)alertShowWithTitle:(NSString *)titleInp andBody:(NSString *)bodyInp{
    UIAlertController* alert;
    alert = [UIAlertController alertControllerWithTitle:titleInp
                                                message:bodyInp
                                         preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alert animated:true completion:nil];
}
@end
