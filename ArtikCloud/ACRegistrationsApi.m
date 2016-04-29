#import "ACRegistrationsApi.h"
#import "ACQueryParamCollection.h"
#import "ACDeviceRegConfirmUserResponseEnvelope.h"
#import "ACDeviceRegConfirmUserRequest.h"
#import "ACDeviceRegStatusResponseEnvelope.h"
#import "ACUnregisterDeviceResponseEnvelope.h"


@interface ACRegistrationsApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACRegistrationsApi

static ACRegistrationsApi* singletonAPI = nil;

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

+(ACRegistrationsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACRegistrationsApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACRegistrationsApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACRegistrationsApi alloc] init];
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
/// Confirm User
/// This call updates the registration request issued earlier by associating it with an authenticated user and captures all additional information required to add a new device.
///  @param registrationInfo Device Registration information. 
///
///  @returns ACDeviceRegConfirmUserResponseEnvelope*
///
-(NSNumber*) confirmUserWithRegistrationInfo: (ACDeviceRegConfirmUserRequest*) registrationInfo
    completionHandler: (void (^)(ACDeviceRegConfirmUserResponseEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'registrationInfo' is set
    if (registrationInfo == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `registrationInfo` when calling `confirmUser`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/registrations/pin"];

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
    
    bodyParam = registrationInfo;
    

    
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
                              responseType: @"ACDeviceRegConfirmUserResponseEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceRegConfirmUserResponseEnvelope*)data, error);
                           }
          ];
}

///
/// Get Request Status For User
/// This call checks the status of the request so users can poll and know when registration is complete.
///  @param requestId Request ID. 
///
///  @returns ACDeviceRegStatusResponseEnvelope*
///
-(NSNumber*) getRequestStatusForUserWithRequestId: (NSString*) requestId
    completionHandler: (void (^)(ACDeviceRegStatusResponseEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'requestId' is set
    if (requestId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `requestId` when calling `getRequestStatusForUser`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/registrations/{requestId}/status"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (requestId != nil) {
        pathParams[@"requestId"] = requestId;
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
                              responseType: @"ACDeviceRegStatusResponseEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceRegStatusResponseEnvelope*)data, error);
                           }
          ];
}

///
/// Unregister Device
/// This call clears any associations from the secure device registration.
///  @param deviceId Device ID. 
///
///  @returns ACUnregisterDeviceResponseEnvelope*
///
-(NSNumber*) unregisterDeviceWithDeviceId: (NSString*) deviceId
    completionHandler: (void (^)(ACUnregisterDeviceResponseEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'deviceId' is set
    if (deviceId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceId` when calling `unregisterDevice`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}/registrations"];

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
                              responseType: @"ACUnregisterDeviceResponseEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACUnregisterDeviceResponseEnvelope*)data, error);
                           }
          ];
}



@end
