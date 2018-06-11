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
          @"first_name": [user name],
          @"email": [user email]
          //@"score": [user score] TO ADD
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

@end
