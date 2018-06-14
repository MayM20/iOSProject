//
//  AppDataProvider.m
//  iOS try app
//
//  Created by Maylen Medina on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "AppDataProvider.h"

@implementation AppDataProvider

@synthesize rootNode, usersNode, USER_ID, ref;

NSString * const const_database_score = @"score";

//constructor
-(id)init
{
    self = [super init];
    
    if(self)
    {
        //Firebase reference
        self.rootNode = [[FIRDatabase database] reference];
        self.usersNode = [rootNode child:@"users"];
        
        
        //getting current User ID
        if(USER_ID == nil){
            USER_ID = [FIRAuth auth].currentUser.uid;
        }
    }
    return self;
}

//inserting user data into firebase
-(void)InsertUserProfileData:(UserModelClass *)user WithUserID:(NSString *)userID{
    @try{
    
        NSString *key = [[rootNode child:@"users/"] child:userID].key;
        
        //Obj to parse into Firebase
        NSDictionary *postFirebase =
        @{
          //@"first_name": [user name],
          //@"email": [user email]
          @"first_name": [user name],
          @"email": [user email],
          @"score": [user score]
          };
        
        //appending user data object
        NSDictionary *childUpdate = @{[[@"/users/" stringByAppendingString:key] stringByAppendingString:@"/profile"]: postFirebase};
        
        //inserting into DB
        [rootNode updateChildValues:childUpdate
                withCompletionBlock:^(NSError * _Nullable error,
                                      FIRDatabaseReference * _Nonnull ref)
         {
             if(error != nil){
                
                
             }
             else{
                 return;
             }
         }];
        
    }
    @catch(NSException *ex){
        @throw ex.reason;
    }
}
//insert score
-(void)insertUserScore:(UserModelClass *)user WithUserID:(NSString *)user_id{
        
        //referencing the child firebase
        NSString *key = [[usersNode child:@"profile/"]child:user_id].key;
        
        //parsing object into firebase
        NSDictionary *post =
        @{
          //const_database_score = [user score];
        };
        
        //append user info score to object
        NSDictionary *childupdate = @{[[@"/profile/" stringByAppendingString: key] stringByAppendingString:@"/score"]: post};
        
        //insert into db
        [usersNode updateChildValues:childupdate
                 withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref)
        {
            if(error != nil){
                NSLog(@"sorry but an error has occured");
            }
            else{
                return;
            }
                    
        }];
    
}

@end
