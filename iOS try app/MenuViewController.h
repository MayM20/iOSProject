//
//  MenuViewController.h
//  iOS try app
//
//  Created by Fatima Abreu on 21/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *catButton;
@property (weak, nonatomic) IBOutlet UIButton *dogsButton;
@property (weak, nonatomic) IBOutlet UIButton *flowerButton;
@property (weak, nonatomic) IBOutlet UIButton *labsButton;

-(IBAction)gotoGameAction:(id)sender;

@end
