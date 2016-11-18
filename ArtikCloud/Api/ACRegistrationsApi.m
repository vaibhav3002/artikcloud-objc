#import "ACRegistrationsApi.h"
#import "ACQueryParamCollection.h"
#import "ACDeviceRegConfirmUserResponseEnvelope.h"
#import "ACDeviceRegConfirmUserRequest.h"
#import "ACDeviceRegStatusResponseEnvelope.h"
#import "ACUnregisterDeviceResponseEnvelope.h"


@interface ACRegistrationsApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation ACRegistrationsApi

NSString* kACRegistrationsApiErrorDomain = @"ACRegistrationsApiErrorDomain";
NSInteger kACRegistrationsApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    self = [super init];
    if (self) {
        ACConfiguration *config = [ACConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[ACApiClient alloc] init];
        }
        _apiClient = config.apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(ACApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+ (instancetype)sharedAPI {
    static ACRegistrationsApi *sharedAPI;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedAPI = [[self alloc] init];
    });
    return sharedAPI;
}

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.defaultHeaders[key];
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self setDefaultHeaderValue:value forKey:key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(NSUInteger) requestQueueSize {
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
        NSParameterAssert(registrationInfo);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"registrationInfo"] };
            NSError* error = [NSError errorWithDomain:kACRegistrationsApiErrorDomain code:kACRegistrationsApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/registrations/pin"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

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
                                if(handler) {
                                    handler((ACDeviceRegConfirmUserResponseEnvelope*)data, error);
                                }
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
        NSParameterAssert(requestId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"requestId"] };
            NSError* error = [NSError errorWithDomain:kACRegistrationsApiErrorDomain code:kACRegistrationsApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/registrations/{requestId}/status"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (requestId != nil) {
        pathParams[@"requestId"] = requestId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

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
                                if(handler) {
                                    handler((ACDeviceRegStatusResponseEnvelope*)data, error);
                                }
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
        NSParameterAssert(deviceId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"deviceId"] };
            NSError* error = [NSError errorWithDomain:kACRegistrationsApiErrorDomain code:kACRegistrationsApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devices/{deviceId}/registrations"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceId != nil) {
        pathParams[@"deviceId"] = deviceId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

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
                                if(handler) {
                                    handler((ACUnregisterDeviceResponseEnvelope*)data, error);
                                }
                           }
          ];
}



@end
