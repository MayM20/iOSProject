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
        if(self.isGameFinished == false){
            
            //make user model with id and score
            UserModelClass *user = [[UserModelClass alloc] init];
            AppDataProvider *db = [[AppDataProvider alloc] init];
            
            if([FIRAuth auth].currentUser != nil)
            {
                
                //get the user id from authentication
                //search firebase with key using UID
                userID = [FIRAuth auth].currentUser.uid;
                
                [[[[[db rootNode] child:@"users"] child:userID] child:@"profile"]
                 observeSingleEventOfType:FIRDataEventTypeValue
                 withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                     
                     if(snapshot != nil){
                         NSDictionary *usersDictionary = snapshot.value;
                         
                         //values from user model class, set score
                         [user setScore: [usersDictionary valueForKey:@"score"]];
                          NSLog(@"dfds: %@", user.score);//get current score
                        
                         
                     }
                     
                 } withCancelBlock:^(NSError * _Nonnull error) {
                     AlertViewController *alertError = [[AlertViewController alloc] init];
                     [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
                 }];
            }
            
            
            //compare score
            if(timeCount< (int)user.score){
                
                //[user setScore:[usersDictionary valueForKey:@"score"]];
            }
            
            //enter better score to firebase (either delete previous score or overwrite , on firebase)
            
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
