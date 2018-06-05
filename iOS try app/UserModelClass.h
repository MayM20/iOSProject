//
//  UserModelClass.h
//  iOS try app
//
//  Created by Fatima Abreu on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModelClass : NSObject <NSCoding>

@property (nonatomic, retain) NSString *name;
@property (nonatomic,retain) NSString *email;
@property (nonatomic, retain) NSString *uid;

-(id) initWith:(NSString *)input_Name
      andEmail:(NSString *)input_Email
        andUid:(NSString *)input_UID;

@end
