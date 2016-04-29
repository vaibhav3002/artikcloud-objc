#import "ACDeviceTypesApi.h"
#import "ACQueryParamCollection.h"
#import "ACManifestVersionsEnvelope.h"
#import "ACDeviceTypeEnvelope.h"
#import "ACDeviceTypesEnvelope.h"
#import "ACManifestPropertiesEnvelope.h"


@interface ACDeviceTypesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACDeviceTypesApi

static ACDeviceTypesApi* singletonAPI = nil;

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

+(ACDeviceTypesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACDeviceTypesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACDeviceTypesApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACDeviceTypesApi alloc] init];
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
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceTypeId` when calling `getAvailableManifestVersions`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/availablemanifestversions"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACManifestVersionsEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACManifestVersionsEnvelope*)data, error);
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
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceTypeId` when calling `getDeviceType`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACDeviceTypeEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACDeviceTypeEnvelope*)data, error);
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
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getDeviceTypes`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

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
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceTypeId` when calling `getLatestManifestProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/manifests/latest/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
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
                              responseType: @"ACManifestPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACManifestPropertiesEnvelope*)data, error);
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
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `deviceTypeId` when calling `getManifestProperties`"];
    }
    
    // verify the required parameter 'version' is set
    if (version == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `version` when calling `getManifestProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/devicetypes/{deviceTypeId}/manifests/{version}/properties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (deviceTypeId != nil) {
        pathParams[@"deviceTypeId"] = deviceTypeId;
    }
    if (version != nil) {
        pathParams[@"version"] = version;
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
                              responseType: @"ACManifestPropertiesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACManifestPropertiesEnvelope*)data, error);
                           }
          ];
}



@end
