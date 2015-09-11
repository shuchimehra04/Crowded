//
//  CrowdedApiWrapper.m
//  Crowded
//
//  Created by shuchi mehra on 9/10/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "CrowdedApiWrapper.h"
static NSString *const BASE_URL = @"http://apidev.crowded.com/";

@implementation CrowdedApiWrapper
+ (id)instance {
    static CrowdedApiWrapper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (id)init {
    if (self = [super init]) {
        _manager = [AFHTTPRequestOperationManager manager];
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_manager setRequestSerializer:serializer];
        NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:50 * 1024 * 1024 diskPath:nil];
        [NSURLCache setSharedURLCache:sharedCache];
        [self getAccessTokensuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    
    }
    return self;
    
}

-(void)getAccessTokensuccess:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{
    //{"grant_type":"password","username":"test@test.com","password":"123","client_id":"CrowdedApp","client_secret":"123"}

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"password", @"grant_type", @"test@test.com", @"username", @"123", @"password", @"CrowdedApp", @"client_id", @"123", @"client_secret", nil];

    [_manager POST:[BASE_URL stringByAppendingString:@"users/register"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self storeAccessToken:[responseObject objectForKey:@"access_token"] forTokenType:[responseObject objectForKey:@"token_type"]];
        
        if (success)
            success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
    }];
    
}
//token_type
- (void)storeAccessToken:(NSString*)access_Token forTokenType:(NSString*)token_Type {
    accessToken=access_Token;
    tokenType=token_Type;
    
 }

@end
