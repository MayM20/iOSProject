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
    
    //prepare timer for view
    timeCount = 0;
    currentTime = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(timerAction)
                                               userInfo:nil
                                                repeats:YES];
    
}

-(void)updateScore{
        
        //setup firebase
        self.ref = [[FIRDatabase database] reference];
        userID = [FIRAuth auth].currentUser.uid;
        UserModelClass *user = [[UserModelClass alloc] init];
        AppDataProvider *db = [[AppDataProvider alloc] init];
    
        //convert timecount to string so we can use to update firebase
        NSString *strTimeCount = @(timeCount).stringValue;
        
        
        //read current highschore/besttime
        [[[[[db rootNode] child:@"users"] child:userID] child:@"profile"]
         observeSingleEventOfType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
             
             if(snapshot != nil){
                 //fetch items from database into dictionary
                 NSDictionary *usersDictionary = snapshot.value;
                 
                 NSInteger hiScore;
                 
                 //values from user model class, set
                 [user setScore: [usersDictionary valueForKey:@"score"]];
                 hiScore = [user.score integerValue];
                 NSLog(@"score is %@", user.score);
                 
                 //if current score time is faster than user time
                 //hiscore then update with current score time
                 if(self->timeCount < hiScore){
                     
                     NSLog(@" timecount %d, hiscore %@",
                           self->timeCount, user.score);
                     
                     // write high score
                     [[[[[self.ref child:@"users"] child:self->userID]child:@"profile"]child:@"score"]
                      setValue:strTimeCount];
                     
                 }
                 
             }
             //exception handling
         } withCancelBlock:^(NSError * _Nonnull error) {
             AlertViewController *alertError = [[AlertViewController alloc] init];
             [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
         }];
    
    
}

-(void)timerAction{
    
    //maximum time limit is 120 seconds, 2 minutes
    if (timeCount < 120 )
    {
        timeCount++;
        _timer.text = [NSString stringWithFormat:@"%d\"", timeCount];

    }
    else
    {
        //if countdown is finished, return player to main view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    //if game is finshed, update score then transition to main page
    if(self.isGameFinished){
        self.updateScore;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end


