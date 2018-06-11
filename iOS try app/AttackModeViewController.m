//
//  AttackModeViewController.m
//  iOS try app
//
//  Created by Maylen Medina on 2/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "AttackModeViewController.h"

@interface AttackModeViewController ()
{
    int timeCount;
    NSTimer* gameTimer;
    //NSString* gameView;
}

@end

@implementation AttackModeViewController

/*-(void)saveScore{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:score forKey:@"highScore"];
    [defaults synchronize];
}*/


-(void)viewDidAppear:(BOOL)animated{
 
    [super viewDidAppear:YES];
    
    timeCount = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(timerAction)
                                               userInfo:nil
                                                repeats:YES];
}

-(void)timerAction{
    
    if (timeCount < 10 )
    {
        timeCount++;
        _timer.text = [NSString stringWithFormat:@"%d\"", timeCount];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)donePlaying{
    /*
     two ways might be?
     if ([blocksArray containsObject: != NSNotFound]){
     
     }
    if ([blocksArray containsObject: @"%@_%2d.jpg"]) // YES
    {
        // display alert 'congrats'
        // save time playing
    }*/
}


@end
