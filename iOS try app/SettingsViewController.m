//
//  SettingsViewController.m
//  iOS try app
//
//  Created by Fatima Abreu on 5/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutButton:(id)sender {
    [self performSegueWithIdentifier:@"goToEntryView" sender:self];
}
@end
