//
//  AppDataProvider.m
//  iOS try app
//
//  Created by Fatima Abreu on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "AppDataProvider.h"

@implementation AppDataProvider

@synthesize rootNode, usersNode, USER_ID;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        //Firebase reference
        self.rootNode = [[FIRDatabase database] reference];
        self.usersNode = [rootNode child:@"users"];
        
        
        //Get Current User ID
        if(USER_ID == nil){
            USER_ID = [FIRAuth auth].currentUser.uid;
        }
    }
    return self;
}
/*-(void)displayFirstName:(UserModelClass *)user WithUserID:(NSString *)userID{
     NSString *key = [[rootNode child:@"users/"] child:userID].key;
    
    NSDictionary *postFirebase
    
}*/

-(void)InsertUserProfileData:(UserModelClass *)user WithUserID:(NSString *)userID{
    
    @try{
        //Reference Child Firebase
        NSString *key = [[rootNode child:@"users/"] child:userID].key;
        
        //Obj to parse into Firebase
        NSDictionary *postFirebase =
        @{
          @"first_name": [user name],
          @"email": [user email]
          };
        
        //Append User info to Obj
        NSDictionary *childUpdate = @{[[@"/users/" stringByAppendingString:key] stringByAppendingString:@"/profile"]: postFirebase};
        
        //Insert into DB
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
