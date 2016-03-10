//
//  JAccout.m
//  myWeibo
//
//  Created by zhangjie520 on 3/10/16.
//  Copyright © 2016 zhangjie520. All rights reserved.
//

#import "JAccout.h"

#define kAccess @"access_token"
#define kExpir  @"expires_in"
#define kUid    @"uid"

@implementation JAccout

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        _access_token = dict[kAccess];
        _expires_in = dict[kExpir];
        _uid = dict[kUid];
    }
    
    return self;
}

// 从文件中解析对象的时候调用。
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:kAccess];
        _expires_in = [aDecoder decodeObjectForKey:kExpir];
        _uid = [aDecoder decodeObjectForKey:kUid];
    }
    return self;
}

// 将对象写入文件的时候调用。
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_access_token forKey:kAccess];
    [aCoder encodeObject:_expires_in forKey:kExpir];
    [aCoder encodeObject:_uid forKey:kUid];
}

@end
