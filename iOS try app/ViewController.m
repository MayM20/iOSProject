//
//  ViewController.m
//  iOS try app
//
//  Created by 5526 on 3/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)settingsButton:(id)sender {
    [self performSegueWithIdentifier:@"goToSettingsView" sender:self];
}
@end
