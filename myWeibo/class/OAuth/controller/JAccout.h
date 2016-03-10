//
//  JAccout.h
//  myWeibo
//
//  Created by zhangjie520 on 3/10/16.
//  Copyright © 2016 zhangjie520. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JAccout : NSObject<NSCoding>

/**接口获取授权后的access token。唯一*/
@property(nonatomic, copy) NSString *access_token;

/**access_token的生命周期，单位是秒数。*/
@property(nonatomic, copy) NSString *expires_in;

/**	当前授权用户的UID*/
@property(nonatomic, copy) NSString *uid;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
