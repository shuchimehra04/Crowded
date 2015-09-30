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

@property(nonatomic,strong)NSString *emailID;

+ (id)instance;

-(void)getAccessTokensuccess:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure;
- (void)registerUser:(NSString *)username success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure;
- (void)registerUserSecondStep:(NSString *)emailId success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure;
// http://apidev.crowded.com/user/maho@test.com
-(void)loginUser:(NSString *)username andPassword:(NSString *)password success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure;
-(void)forgotPassword:(NSString *)username success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure;

@end
