//
//  MenuViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 21/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "MenuViewController.h"
#import "ClassicModeViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"toGameSegue"])
    {
        ClassicModeViewController* thisGameViewCtrl = [segue destinationViewController];
        
        if(sender == _catButton)
            thisGameViewCtrl.gameMode = @"cute";
        if(sender == _dogsButton)
            thisGameViewCtrl.gameMode =  @"dogs";
        if(sender == _flowerButton)
            thisGameViewCtrl.gameMode = @"flower";
        if (sender == _labsButton)
            thisGameViewCtrl.gameMode = @"labs";
    }
}

-(IBAction)gotoGameAction:(id)sender
{
    [self performSegueWithIdentifier:@"toGameSegue" sender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
