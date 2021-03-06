//
//  UserModelClass.h
//  iOS try app
//
//  Created by Maylen Medina on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModelClass : NSObject <NSCoding>

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *uid;
@property (nonatomic, retain) NSString *score;

-(id) initWith:(NSString *)input_Name
      andEmail:(NSString *)input_Email
        andUid:(NSString *)input_UID
      andScore:(NSString *)gameScore;

@end
