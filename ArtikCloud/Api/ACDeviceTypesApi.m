#import "ACDeviceTypesApi.h"
#import "ACQueryParamCollection.h"
#import "ACManifestVersionsEnvelope.h"
#import "ACDeviceTypeEnvelope.h"
#import "ACDeviceTypesEnvelope.h"
#import "ACManifestPropertiesEnvelope.h"


@interface ACDeviceTypesApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation ACDeviceTypesApi

NSString* kACDeviceTypesApiErrorDomain = @"ACDeviceTypesApiErrorDomain";
NSInteger kACDeviceTypesApiMissingParamErrorCode = 234513;

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
    static ACDeviceTypesApi *sharedAPI;
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
/// Get Available Manifest Versions
/// Get a Device Type's available manifest versions
///  @param deviceTypeId deviceTypeId 
///
///  @returns ACManifestVersionsEnvelope*
///
-(NSNumber*) getAvailableManifestVersionsWithDeviceTypeId: (NSString*) deviceTypeId
    completionHandler: (void (^)(ACManifestVersionsEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'deviceTypeId' is set
    if (deviceTypeId == nil) {
        NSParameterAssert(deviceTypeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"deviceTypeId"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/availablemanifestversions"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACManifestVersionsEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACManifestVersionsEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Device Type
/// Retrieves a Device Type
///  @param deviceTypeId deviceTypeId 
///
///  @returns ACDeviceTypeEnvelope*
///
-(NSNumber*) getDeviceTypeWithDeviceTypeId: (NSString*) deviceTypeId
    completionHandler: (void (^)(ACDeviceTypeEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'deviceTypeId' is set
    if (deviceTypeId == nil) {
        NSParameterAssert(deviceTypeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"deviceTypeId"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACDeviceTypeEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACDeviceTypeEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Device Types
/// Retrieves Device Types
///  @param name Device Type name 
///
///  @param offset Offset for pagination. (optional)
///
///  @param count Desired count of items in the result set (optional)
///
///  @param tags Elements tagged with the list of tags. (comma separated) (optional)
///
///  @returns ACDeviceTypesEnvelope*
///
-(NSNumber*) getDeviceTypesWithName: (NSString*) name
    offset: (NSNumber*) offset
    count: (NSNumber*) count
    tags: (NSString*) tags
    completionHandler: (void (^)(ACDeviceTypesEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'name' is set
    if (name == nil) {
        NSParameterAssert(name);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"name"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        queryParams[@"name"] = name;
    }
    if (offset != nil) {
        queryParams[@"offset"] = offset;
    }
    if (count != nil) {
        queryParams[@"count"] = count;
    }
    if (tags != nil) {
        queryParams[@"tags"] = tags;
    }
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
                              responseType: @"ACDeviceTypesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACDeviceTypesEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Device Types by Application
/// Get Device Types by Application
///  @param appId Application ID. 
///
///  @param productInfo Flag to include the associated ProductInfo if present (optional)
///
///  @param count Desired count of items in the result set. (optional)
///
///  @param offset Offset for pagination. (optional)
///
///  @returns ACDeviceTypesEnvelope*
///
-(NSNumber*) getDeviceTypesByApplicationWithAppId: (NSString*) appId
    productInfo: (NSNumber*) productInfo
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    completionHandler: (void (^)(ACDeviceTypesEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'appId' is set
    if (appId == nil) {
        NSParameterAssert(appId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"appId"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/applications/{appId}/devicetypes"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (appId != nil) {
        pathParams[@"appId"] = appId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (productInfo != nil) {
        queryParams[@"productInfo"] = productInfo;
    }
    if (count != nil) {
        queryParams[@"count"] = count;
    }
    if (offset != nil) {
        queryParams[@"offset"] = offset;
    }
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
                              responseType: @"ACDeviceTypesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACDeviceTypesEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Latest Manifest Properties
/// Get a Device Type's manifest properties for the latest version.
///  @param deviceTypeId Device Type ID. 
///
///  @returns ACManifestPropertiesEnvelope*
///
-(NSNumber*) getLatestManifestPropertiesWithDeviceTypeId: (NSString*) deviceTypeId
    completionHandler: (void (^)(ACManifestPropertiesEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'deviceTypeId' is set
    if (deviceTypeId == nil) {
        NSParameterAssert(deviceTypeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"deviceTypeId"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/manifests/latest/properties"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACManifestPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACManifestPropertiesEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get manifest properties
/// Get a Device Type's manifest properties for a specific version.
///  @param deviceTypeId Device Type ID. 
///
///  @param version Manifest Version. 
///
///  @returns ACManifestPropertiesEnvelope*
///
-(NSNumber*) getManifestPropertiesWithDeviceTypeId: (NSString*) deviceTypeId
    version: (NSString*) version
    completionHandler: (void (^)(ACManifestPropertiesEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'deviceTypeId' is set
    if (deviceTypeId == nil) {
        NSParameterAssert(deviceTypeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"deviceTypeId"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'version' is set
    if (version == nil) {
        NSParameterAssert(version);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"version"] };
            NSError* error = [NSError errorWithDomain:kACDeviceTypesApiErrorDomain code:kACDeviceTypesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/manifests/{version}/properties"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
    }
    if (version != nil) {
        pathParams[@"version"] = version;
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
                              responseType: @"ACManifestPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACManifestPropertiesEnvelope*)data, error);
                                }
                           }
          ];
}



@end
