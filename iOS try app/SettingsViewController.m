//
//  SettingsViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 5/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "SettingsViewController.h"
@import Firebase;

@interface SettingsViewController (){
    NSString *userID;
}

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
//loading user profile data to settings
-(void)prepareData{
    
    @try{
       
        
        UserModelClass *user = [[UserModelClass alloc] init];
        AppDataProvider *db = [[AppDataProvider alloc] init];
        
        if([FIRAuth auth].currentUser != nil){
            
            //get the user id from authentication
            userID = [FIRAuth auth].currentUser.uid;
            
            [[[[[db rootNode] child:@"users"] child:userID] child:@"profile"]
             observeSingleEventOfType:FIRDataEventTypeValue
             withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                 
                 if(snapshot != nil){
                     NSDictionary *usersDictionary = snapshot.value;
                     
                     //values from user model class, set
                     [user setName: [usersDictionary valueForKey:@"first_name"]];
                    
                     
                     self.firstNameLabel.text = user.name;
                  
                 }
                 
             } withCancelBlock:^(NSError * _Nonnull error) {
                 AlertViewController *alertError = [[AlertViewController alloc] init];
                 [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
             }];
        }
    }
    @catch(NSException *ex){
    
        
        AlertViewController *alertError = [[AlertViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
    
}
-(void)viewDidAppear:(BOOL)animated {
    
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
