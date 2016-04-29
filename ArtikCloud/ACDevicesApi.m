#import "ACDevicesApi.h"
#import "ACQueryParamCollection.h"
#import "ACDevice.h"
#import "ACDeviceEnvelope.h"
#import "ACDeviceTokenEnvelope.h"


@interface ACDevicesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACDevicesApi

static ACDevicesApi* singletonAPI = nil;

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

+(ACDevicesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACDevicesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACDevicesApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACDevicesApi alloc] init];
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
/// Add Device
/// Create a device
///  @param device Device to be added to the user 
///
///  @returns ACDeviceEnvelope*
///
-(NSNumber*) addDeviceWithDevice: (ACDevice*) device
    completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'device' is set
    if (device == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `device` when calling `addDevice`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices"];

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
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = device;
    

    
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
                              responseType: @"ACDeviceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceEnvelope*)data, error);
                           }
          ];
}

///
/// Delete Device
/// Deletes a device
///  @param deviceId deviceId 
///
///  @returns ACDeviceEnvelope*
///
-(NSNumber*) deleteDeviceWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `deleteDevice`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
                              responseType: @"ACDeviceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceEnvelope*)data, error);
                           }
          ];
}

///
/// Delete Device Token
/// Deletes a device's token
///  @param deviceId deviceId 
///
///  @returns ACDeviceTokenEnvelope*
///
-(NSNumber*) deleteDeviceTokenWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `deleteDeviceToken`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}/tokens"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
                              responseType: @"ACDeviceTokenEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceTokenEnvelope*)data, error);
                           }
          ];
}

///
/// Get Device
/// Retrieves a device
///  @param deviceId deviceId 
///
///  @returns ACDeviceEnvelope*
///
-(NSNumber*) getDeviceWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `getDevice`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
                              responseType: @"ACDeviceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceEnvelope*)data, error);
                           }
          ];
}

///
/// Get Device Token
/// Retrieves a device's token
///  @param deviceId deviceId 
///
///  @returns ACDeviceTokenEnvelope*
///
-(NSNumber*) getDeviceTokenWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `getDeviceToken`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}/tokens"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
                              responseType: @"ACDeviceTokenEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceTokenEnvelope*)data, error);
                           }
          ];
}

///
/// Update Device
/// Updates a device
///  @param deviceId deviceId 
///
///  @param device Device to be updated 
///
///  @returns ACDeviceEnvelope*
///
-(NSNumber*) updateDeviceWithDeviceId: (NSString*) deviceId
    device: (ACDevice*) device
    completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `updateDevice`"];
    }
    
    // verify the required parameter 'device' is set
    if (device == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `device` when calling `updateDevice`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = device;
    

    
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
                              responseType: @"ACDeviceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceEnvelope*)data, error);
                           }
          ];
}

///
/// Update Device Token
/// Updates a device's token
///  @param deviceId deviceId 
///
///  @returns ACDeviceTokenEnvelope*
///
-(NSNumber*) updateDeviceTokenWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `updateDeviceToken`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}/tokens"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
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
    NSString *requestContentType = [ACApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"artikcloud_oauth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
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
                              responseType: @"ACDeviceTokenEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceTokenEnvelope*)data, error);
                           }
          ];
}



@end
