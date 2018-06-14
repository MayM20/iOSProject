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
    
    //Prepare timer for view
    timeCount = 0;
    currentTime = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(timerAction)
                                               userInfo:nil
                                                repeats:YES];
    
}

-(void)updateScore{
        
        //Setup firebase
        self.ref = [[FIRDatabase database] reference];
        userID = [FIRAuth auth].currentUser.uid;
        UserModelClass *user = [[UserModelClass alloc] init];
        AppDataProvider *db = [[AppDataProvider alloc] init];
    
        // convert timecount to string so we can use to update firebase
        NSString *strTimeCount = @(timeCount).stringValue;
        
        
        // Read current highschore
        [[[[[db rootNode] child:@"users"] child:userID] child:@"profile"]
         observeSingleEventOfType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
             
             if(snapshot != nil){
                 // Fetch items from database into dictionary
                 NSDictionary *usersDictionary = snapshot.value;
                 
                 NSInteger hiScore;
                 
                 //values from user model class, set
                 [user setScore: [usersDictionary valueForKey:@"score"]];
                 hiScore = [user.score integerValue];
                 NSLog(@"score is %@", user.score);
                 
                 // If current score is faster than user hiscore then update with current score
                 if(self->timeCount < hiScore){
                     
                     NSLog(@" timecount %d, hiscore %@",
                           self->timeCount, user.score);
                     
                     // Write high score
                     [[[[[self.ref child:@"users"] child:self->userID]child:@"profile"]child:@"score"]
                      setValue:strTimeCount];
                     
                 }
                 
             }
             // Exceptio handling
         } withCancelBlock:^(NSError * _Nonnull error) {
             AlertViewController *alertError = [[AlertViewController alloc] init];
             [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
         }];
    
    
}

-(void)timerAction{
    
    // Maximum time limit is 120 seconds
    if (timeCount < 120 )
    {
        timeCount++;
        _timer.text = [NSString stringWithFormat:@"%d\"", timeCount];

    }
    else
    {
        // If countdown is finish, return player to main view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    // If game is finshed, update score then transition to main page
    if(self.isGameFinished){
        self.updateScore;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end


