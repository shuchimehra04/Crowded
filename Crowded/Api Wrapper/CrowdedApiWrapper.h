//
//  CrowdedApiWrapper.h
//  Crowded
//
//  Created by shuchi mehra on 9/10/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface CrowdedApiWrapper : NSObject
{
 AFHTTPRequestOperationManager *_manager;
    NSString *accessToken;
    NSString *tokenType;
}
typedef void (^CrowdedApiSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^CrowdedApiFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);
typedef void (^CrowdedApiBatchCompletionBlock)(NSArray *operations);


+ (id)instance;

@end
