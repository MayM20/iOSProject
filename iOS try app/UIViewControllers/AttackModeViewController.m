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
    NSString *userID;

    
    int currentTime;
}

@end

@implementation AttackModeViewController

@synthesize ref;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ref = [[FIRDatabase database] reference];
}

-(void)viewDidAppear:(BOOL)animated{
 
    [super viewDidAppear:YES];
    
    timeCount = 0;
    currentTime = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(timerAction)
                                               userInfo:nil
                                                repeats:YES];
    
}

-(void)timerAction{
    
    if (timeCount < 100 )
    {
        timeCount++;
        _timer.text = [NSString stringWithFormat:@"%d\"", timeCount];

        //once game is finished, save time
        if(self.isGameFinished == true){
            
            //bool cz = self.isGameFinished;
            //NSLog(@"not completed yet");
            //NSLog(@" %d: ",(int)cz );
            
        
        }
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
