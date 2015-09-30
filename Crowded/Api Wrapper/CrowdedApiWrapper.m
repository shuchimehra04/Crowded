//
//  CrowdedApiWrapper.m
//  Crowded
//
//  Created by shuchi mehra on 9/10/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "CrowdedApiWrapper.h"
static NSString *const BASE_URL = @"http://apidev.crowded.com/";
static NSString *const ACCESSTOKEN_HEADER_FIELD = @"access_token";
static NSString *const TOKENTYPE_HEADER_FIELD = @"token_type";
static NSString *const AUTHENTICATION_HEADER_FIELD = @"Authorization";

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
            
    }
    return self;
    
}

-(void)getAccessTokensuccess:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{
    //{"grant_type":"password","username":"test@test.com","password":"123","client_id":"CrowdedApp","client_secret":"123"}

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"password", @"grant_type", @"test@test.com", @"username", @"123", @"password", @"CrowdedApp", @"client_id", @"123", @"client_secret", nil];

    [_manager POST:[BASE_URL stringByAppendingString:@"oauth"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self storeAccessToken:[responseObject objectForKey:ACCESSTOKEN_HEADER_FIELD] forTokenType:[responseObject objectForKey:TOKENTYPE_HEADER_FIELD]];
        
        if (success)
            success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
    }];
    
}
- (void)registerUser:(NSString *)username success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:username,@"email",nil];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_manager POST:[BASE_URL stringByAppendingString:@"user"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (success)
            self.emailID=username;
        
            success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
           // [self registerUser:username success:success failure:failure];
        
           }];


}
-(void)loginUser:(NSString *)username andPassword:(NSString *)password success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:username,@"email",password,@"password",nil];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_manager POST:[BASE_URL stringByAppendingString:@"auth"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (success)
            success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // [self registerUser:username success:success failure:failure];
        
    }];



}
-(void)forgotPassword:(NSString *)username success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{
    //apidev.crowded.com/user?forgotPass=<email>
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_manager POST:[[BASE_URL stringByAppendingString:@"user?forgotPass="] stringByAppendingString:[NSString stringWithFormat:@"%@",username]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (success)
            success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    


}
- (void)storeAccessToken:(NSString*)access_Token forTokenType:(NSString*)token_Type {
    accessToken=access_Token;
    tokenType=token_Type;
    [[_manager requestSerializer] setValue:[[[token_Type stringByAppendingString:@"<" ]stringByAppendingString:accessToken] stringByAppendingString:@">"] forHTTPHeaderField:AUTHENTICATION_HEADER_FIELD];
     }
- (void)registerUserSecondStep:(NSString *)emailId success:(CrowdedApiSuccessBlock)success failure:(CrowdedApiFailureBlock)failure
{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_manager POST:[[BASE_URL stringByAppendingString:@"user/"] stringByAppendingString:[NSString stringWithFormat:@"%@",emailId]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (success)
            success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // [self registerUser:username success:success failure:failure];
        
    }];
    

}
@end
