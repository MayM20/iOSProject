//
//  AttackModeViewController.m
//  iOS try app
//
//  Created by Fatima Abreu on 2/6/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "AttackModeViewController.h"

@interface AttackModeViewController ()
{
    int timeCount;
    NSTimer* gameTimer;
}

@end

@implementation AttackModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//how can i do to implement this method from the other class? of course
 //inheritance but it seems to be a problem
-(void)viewDidAppear:(BOOL)animated{
    
    timeCount = 60;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                        target:self
                                      selector:@selector(timerAction)
                                      userInfo:nil
                                       repeats:YES];
    
    [super viewDidAppear:YES];
}
-(void)timerAction{
    if (timeCount > 0 )
    {
        timeCount --;
        _timer.text = [NSString stringWithFormat:@"%d\"", timeCount];
    }
    else
    {
        
    }
}
-(void)makeBlocksAction{
    [super makeBlocksAction];
}


@end
