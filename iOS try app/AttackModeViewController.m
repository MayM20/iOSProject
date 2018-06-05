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
    //NSString* gameView;
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
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)makeBlocksAction{
    //int imgNum = 1;
    
    //NSString* imgName = [NSString stringWithFormat:@"cute_%02d.jpg", imgNum];
    [super makeBlocksAction];
}

/*
 function that generates a random image into the container to play with
 
-(IBAction)randomImage{
    //generate random int from 1 to 5
    int randomInt = (arc4random()% 5) +1;
    
    //convert int to string
    NSString *fileName = [NSString stringWithFormat:@"file0%d.jpg", randomInt];
    
    //load UIImage from the filename
    UIImage *image = [UIImage imageNamed:fileName];
    
    //display UIImage in UIImageView
    [gameView setImage:image];
}*/


@end
