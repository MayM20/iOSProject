//
//  AppDataProvider.h
//  iOS try app
//
//  Created by Fatima Abreu on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModelClass.h"
#import "AlertViewController.h"

@import Firebase;

@interface AppDataProvider : NSObject

@property (strong, nonatomic) FIRDatabaseReference *rootNode;
@property (strong, nonatomic) FIRDatabaseReference *usersNode;
@property NSString *USER_ID;


-(void)InsertUserProfileData: (UserModelClass *) user WithUserID:(NSString *) userID;


@end
