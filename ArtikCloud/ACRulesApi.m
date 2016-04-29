#import "ACRulesApi.h"
#import "ACQueryParamCollection.h"
#import "ACRuleEnvelope.h"
#import "ACRuleCreationInfo.h"
#import "ACRuleUpdateInfo.h"


@interface ACRulesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACRulesApi

static ACRulesApi* singletonAPI = nil;

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

+(ACRulesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACRulesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACRulesApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACRulesApi alloc] init];
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
/// Create Rule
/// Create a new Rule
///  @param ruleInfo Rule object that needs to be added 
///
///  @param userId User ID 
///
///  @returns ACRuleEnvelope*
///
-(NSNumber*) createRuleWithRuleInfo: (ACRuleCreationInfo*) ruleInfo
    userId: (NSString*) userId
    completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'ruleInfo' is set
    if (ruleInfo == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `ruleInfo` when calling `createRule`"];
    }
    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `createRule`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/rules"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        
        queryParams[@"userId"] = userId;
    }
    
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
    
    bodyParam = ruleInfo;
    

    
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
                              responseType: @"ACRuleEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRuleEnvelope*)data, error);
                           }
          ];
}

///
/// Delete Rule
/// Delete a Rule
///  @param ruleId Rule ID. 
///
///  @returns ACRuleEnvelope*
///
-(NSNumber*) deleteRuleWithRuleId: (NSString*) ruleId
    completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'ruleId' is set
    if (ruleId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `ruleId` when calling `deleteRule`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/rules/{ruleId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (ruleId != nil) {
        pathParams[@"ruleId"] = ruleId;
    }
    

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
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"ACRuleEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRuleEnvelope*)data, error);
                           }
          ];
}

///
/// Get Rule
/// Get a rule using the Rule ID
///  @param ruleId Rule ID. 
///
///  @returns ACRuleEnvelope*
///
-(NSNumber*) getRuleWithRuleId: (NSString*) ruleId
    completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'ruleId' is set
    if (ruleId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `ruleId` when calling `getRule`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/rules/{ruleId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (ruleId != nil) {
        pathParams[@"ruleId"] = ruleId;
    }
    

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
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"ACRuleEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRuleEnvelope*)data, error);
                           }
          ];
}

///
/// Update Rule
/// Update an existing Rule
///  @param ruleId Rule ID. 
///
///  @param ruleInfo Rule object that needs to be updated 
///
///  @returns ACRuleEnvelope*
///
-(NSNumber*) updateRuleWithRuleId: (NSString*) ruleId
    ruleInfo: (ACRuleUpdateInfo*) ruleInfo
    completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'ruleId' is set
    if (ruleId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `ruleId` when calling `updateRule`"];
    }
    
    // verify the required parameter 'ruleInfo' is set
    if (ruleInfo == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `ruleInfo` when calling `updateRule`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/rules/{ruleId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (ruleId != nil) {
        pathParams[@"ruleId"] = ruleId;
    }
    

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
    
    bodyParam = ruleInfo;
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"ACRuleEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRuleEnvelope*)data, error);
                           }
          ];
}



@end
