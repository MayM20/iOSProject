//
//  UserModelClass.m
//  iOS try app
//
//  Created by Fatima Abreu on 31/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "UserModelClass.h"

@implementation UserModelClass
// read and write from disk
// nscoding

@synthesize name, email, uid;

-(id) initWith:(NSString *)input_Name
      andEmail:(NSString *)input_Email
        andUid:(NSString *)input_UID
{
    name = input_Name;
    email = input_Email;
    uid = input_UID;
    
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
    
    return [self initWith:thisName andEmail:thisEmail andUid:thisUid];
}

@end
