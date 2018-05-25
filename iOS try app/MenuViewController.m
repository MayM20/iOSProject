//
//  MenuViewController.m
//  iOS try app
//
//  Created by Fatima Abreu on 21/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"toGameSegue"])
    {
        UIViewController* thisGameViewCrtl = [segue destinationViewController];
        
        if(sender == _catButton)
            thisGameViewCrtl.gameMode = @"cute";
    }
}*/

-(IBAction)gotoGameAction:(id)sender
{
    [self performSegueWithIdentifier:@"toGameSegue" sender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
