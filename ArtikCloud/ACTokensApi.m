#import "ACTokensApi.h"
#import "ACQueryParamCollection.h"
#import "ACTokenRequest.h"
#import "ACCheckTokenResponse.h"
#import "ACRefreshTokenResponse.h"


@interface ACTokensApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACTokensApi

static ACTokensApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        ACConfiguration *config = [ACConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[ACApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(ACApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(ACTokensApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACTokensApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACTokensApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACTokensApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [ACApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Check Token
/// Check Token
///  @param tokenInfo Token object to be checked 
///
///  @returns ACCheckTokenResponse*
///
-(NSNumber*) checkTokenWithTokenInfo: (ACTokenRequest*) tokenInfo
    completionHandler: (void (^)(ACCheckTokenResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'tokenInfo' is set
    if (tokenInfo == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `tokenInfo` when calling `checkToken`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/checkToken"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ACApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = tokenInfo;
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"ACCheckTokenResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACCheckTokenResponse*)data, error);
                           }
          ];
}

///
/// Refresh Token
/// Refresh Token
///  @param grantType Grant Type. 
///
///  @param refreshToken Refresh Token. 
///
///  @returns ACRefreshTokenResponse*
///
-(NSNumber*) refreshTokenWithGrantType: (NSString*) grantType
    refreshToken: (NSString*) refreshToken
    completionHandler: (void (^)(ACRefreshTokenResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'grantType' is set
    if (grantType == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `grantType` when calling `refreshToken`"];
    }
    
    // verify the required parameter 'refreshToken' is set
    if (refreshToken == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `refreshToken` when calling `refreshToken`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/token"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ACApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    
    if (grantType) {
        formParams[@"grant_type"] = grantType;
    }
    
    
    
    if (refreshToken) {
        formParams[@"refresh_token"] = refreshToken;
    }
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"ACRefreshTokenResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRefreshTokenResponse*)data, error);
                           }
          ];
}



@end
