#import "ACUsersApi.h"
#import "ACQueryParamCollection.h"
#import "ACUserEnvelope.h"
#import "ACDevicesEnvelope.h"
#import "ACDeviceTypesEnvelope.h"
#import "ACPropertiesEnvelope.h"
#import "ACAppProperties.h"
#import "ACRulesEnvelope.h"


@interface ACUsersApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACUsersApi

static ACUsersApi* singletonAPI = nil;

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

+(ACUsersApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACUsersApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACUsersApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACUsersApi alloc] init];
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
/// Get Current User Profile
/// Get's the current user's profile
///  @returns ACUserEnvelope*
///
-(NSNumber*) getSelfWithCompletionHandler: 
    (void (^)(ACUserEnvelope* output, NSError* error)) handler {

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/self"];

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
                              responseType: @"ACUserEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACUserEnvelope*)data, error);
                           }
          ];
}

///
/// Get User Devices
/// Retrieve User's Devices
///  @param userId User ID
///
///  @param offset Offset for pagination.
///
///  @param count Desired count of items in the result set
///
///  @param includeProperties Optional. Boolean (true/false) - If false, only return the user's device types. If true, also return device types shared by other users.
///
///  @returns ACDevicesEnvelope*
///
-(NSNumber*) getUserDevicesWithUserId: (NSString*) userId
    offset: (NSNumber*) offset
    count: (NSNumber*) count
    includeProperties: (NSNumber*) includeProperties
    completionHandler: (void (^)(ACDevicesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `getUserDevices`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/devices"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if (count != nil) {
        
        queryParams[@"count"] = count;
    }
    if (includeProperties != nil) {
        
        queryParams[@"includeProperties"] = includeProperties;
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
                              responseType: @"ACDevicesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDevicesEnvelope*)data, error);
                           }
          ];
}

///
/// Get User Device Types
/// Retrieve User's Device Types
///  @param userId User ID.
///
///  @param offset Offset for pagination.
///
///  @param count Desired count of items in the result set
///
///  @param includeShared Optional. Boolean (true/false) - If false, only return the user's device types. If true, also return device types shared by other users.
///
///  @returns ACDeviceTypesEnvelope*
///
-(NSNumber*) getUserDeviceTypesWithUserId: (NSString*) userId
    offset: (NSNumber*) offset
    count: (NSNumber*) count
    includeShared: (NSNumber*) includeShared
    completionHandler: (void (^)(ACDeviceTypesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `getUserDeviceTypes`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/devicetypes"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if (count != nil) {
        
        queryParams[@"count"] = count;
    }
    if (includeShared != nil) {
        
        queryParams[@"includeShared"] = includeShared;
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
                              responseType: @"ACDeviceTypesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceTypesEnvelope*)data, error);
                           }
          ];
}

///
/// Get User application properties
/// Get application properties of a user
///  @param userId User Id
///
///  @param aid Application ID
///
///  @returns ACPropertiesEnvelope*
///
-(NSNumber*) getUserPropertiesWithUserId: (NSString*) userId
    aid: (NSString*) aid
    completionHandler: (void (^)(ACPropertiesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `getUserProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (aid != nil) {
        
        queryParams[@"aid"] = aid;
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
                              responseType: @"ACPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACPropertiesEnvelope*)data, error);
                           }
          ];
}

///
/// Update User Application Properties
/// Updates application properties of a user
///  @param userId User Id
///
///  @param properties Properties to be updated
///
///  @param aid Application ID
///
///  @returns ACPropertiesEnvelope*
///
-(NSNumber*) updateUserPropertiesWithUserId: (NSString*) userId
    properties: (ACAppProperties*) properties
    aid: (NSString*) aid
    completionHandler: (void (^)(ACPropertiesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `updateUserProperties`"];
    }
    
    // verify the required parameter 'properties' is set
    if (properties == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `properties` when calling `updateUserProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (aid != nil) {
        
        queryParams[@"aid"] = aid;
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
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = properties;
    

    
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
                              responseType: @"ACPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACPropertiesEnvelope*)data, error);
                           }
          ];
}

///
/// Create User Application Properties
/// Create application properties for a user
///  @param userId User Id
///
///  @param properties Properties to be updated
///
///  @param aid Application ID
///
///  @returns ACPropertiesEnvelope*
///
-(NSNumber*) createUserPropertiesWithUserId: (NSString*) userId
    properties: (ACAppProperties*) properties
    aid: (NSString*) aid
    completionHandler: (void (^)(ACPropertiesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `createUserProperties`"];
    }
    
    // verify the required parameter 'properties' is set
    if (properties == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `properties` when calling `createUserProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (aid != nil) {
        
        queryParams[@"aid"] = aid;
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
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = properties;
    

    
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
                              responseType: @"ACPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACPropertiesEnvelope*)data, error);
                           }
          ];
}

///
/// Delete User Application Properties
/// Deletes a user's application properties
///  @param userId User Id
///
///  @param aid Application ID
///
///  @returns ACPropertiesEnvelope*
///
-(NSNumber*) deleteUserPropertiesWithUserId: (NSString*) userId
    aid: (NSString*) aid
    completionHandler: (void (^)(ACPropertiesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `deleteUserProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (aid != nil) {
        
        queryParams[@"aid"] = aid;
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
                              responseType: @"ACPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACPropertiesEnvelope*)data, error);
                           }
          ];
}

///
/// Get User Rules
/// Retrieve User's Rules
///  @param userId User ID.
///
///  @param excludeDisabled Exclude disabled rules in the result.
///
///  @param otherApplications List rules of other applications if current application id has full read access
///
///  @param count Desired count of items in the result set.
///
///  @param offset Offset for pagination.
///
///  @returns ACRulesEnvelope*
///
-(NSNumber*) getUserRulesWithUserId: (NSString*) userId
    excludeDisabled: (NSNumber*) excludeDisabled
    otherApplications: (NSNumber*) otherApplications
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    completionHandler: (void (^)(ACRulesEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'userId' is set
    if (userId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `userId` when calling `getUserRules`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/users/{userId}/rules"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        pathParams[@"userId"] = userId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (excludeDisabled != nil) {
        
        queryParams[@"excludeDisabled"] = excludeDisabled;
    }
    if (otherApplications != nil) {
        
        queryParams[@"otherApplications"] = otherApplications;
    }
    if (count != nil) {
        
        queryParams[@"count"] = count;
    }
    if (offset != nil) {
        
        queryParams[@"offset"] = offset;
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
                              responseType: @"ACRulesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACRulesEnvelope*)data, error);
                           }
          ];
}



@end
