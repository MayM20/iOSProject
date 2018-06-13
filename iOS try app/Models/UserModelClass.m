//
//  UserModelClass.m
//  iOS try app
//
//  Created by Maylen Medina on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "UserModelClass.h"

@implementation UserModelClass
// read and write from disk
// nscoding

@synthesize name, email, uid, score;

-(id) initWith:(NSString *)input_Name
      andEmail:(NSString *)input_Email
        andUid:(NSString *)input_UID
      andScore:(NSString *)gameScore
{
    name = input_Name;
    email = input_Email;
    uid = input_UID;
    score= gameScore;
    
    return self;
}

// NSCoding Methods
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:name forKey:@"nameKey"];
    [aCoder encodeObject:email forKey:@"emailKey"];
    [aCoder encodeObject:uid forKey:@"uidKey"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    
    NSString* thisName = [aDecoder decodeObjectForKey:@"nameKey"];
    NSString* thisEmail = [aDecoder decodeObjectForKey:@"emailKey"];
    NSString* thisUid = [aDecoder decodeObjectForKey:@"uidKey"];
    NSString* thisScore = [aDecoder decodeObjectForKey:@"scoreKey"];
    
    return [self initWith:thisName andEmail:thisEmail andUid:thisUid andScore:thisScore];
}

@end
