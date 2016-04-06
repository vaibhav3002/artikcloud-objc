#import "ACMessagesApi.h"
#import "ACQueryParamCollection.h"
#import "ACNormalizedMessagesEnvelope.h"
#import "ACMessageAction.h"
#import "ACMessageIDEnvelope.h"
#import "ACAggregatesResponse.h"
#import "ACAggregatesHistogramResponse.h"
#import "ACFieldPresenceEnvelope.h"


@interface ACMessagesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ACMessagesApi

static ACMessagesApi* singletonAPI = nil;

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

+(ACMessagesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[ACMessagesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(ACMessagesApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[ACMessagesApi alloc] init];
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
/// Get Normalized Messages
/// Get the messages normalized
///  @param uid User ID. If not specified, assume that of the current authenticated user. If specified, it must be that of a user for which the current authenticated user has read access to.
///
///  @param sdid Source device ID of the messages being searched.
///
///  @param mid The SAMI message ID being searched.
///
///  @param fieldPresence String representing a field from the specified device ID.
///
///  @param filter Filter.
///
///  @param offset A string that represents the starting item, should be the value of 'next' field received in the last response. (required for pagination)
///
///  @param count count
///
///  @param startDate startDate
///
///  @param endDate endDate
///
///  @param order Desired sort order: 'asc' or 'desc'
///
///  @returns ACNormalizedMessagesEnvelope*
///
-(NSNumber*) getNormalizedMessagesWithUid: (NSString*) uid
    sdid: (NSString*) sdid
    mid: (NSString*) mid
    fieldPresence: (NSString*) fieldPresence
    filter: (NSString*) filter
    offset: (NSString*) offset
    count: (NSNumber*) count
    startDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    order: (NSString*) order
    completionHandler: (void (^)(ACNormalizedMessagesEnvelope* output, NSError* error)) handler {

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (uid != nil) {
        
        queryParams[@"uid"] = uid;
    }
    if (sdid != nil) {
        
        queryParams[@"sdid"] = sdid;
    }
    if (mid != nil) {
        
        queryParams[@"mid"] = mid;
    }
    if (fieldPresence != nil) {
        
        queryParams[@"fieldPresence"] = fieldPresence;
    }
    if (filter != nil) {
        
        queryParams[@"filter"] = filter;
    }
    if (offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if (count != nil) {
        
        queryParams[@"count"] = count;
    }
    if (startDate != nil) {
        
        queryParams[@"startDate"] = startDate;
    }
    if (endDate != nil) {
        
        queryParams[@"endDate"] = endDate;
    }
    if (order != nil) {
        
        queryParams[@"order"] = order;
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
                              responseType: @"ACNormalizedMessagesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACNormalizedMessagesEnvelope*)data, error);
                           }
          ];
}

///
/// Send Message Action
/// Send a message or an Action:<br/><table><tr><th>Combination</th><th>Parameters</th><th>Description</th></tr><tr><td>Send Message</td><td>sdid, type=message</td><td>Send a message from a Source Device</td></tr><tr><td>Send Action</td><td>ddid, type=action</td><td>Send an action to a Destination Device</td></tr><tr><td>Common</td><td>data, ts, token</td><td>Parameters that can be used with the above combinations.</td></tr></table>
///  @param data Message or Action object that is passed in the body
///
///  @returns ACMessageIDEnvelope*
///
-(NSNumber*) sendMessageActionWithData: (ACMessageAction*) data
    completionHandler: (void (^)(ACMessageIDEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'data' is set
    if (data == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `data` when calling `sendMessageAction`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages"];

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
    
    bodyParam = data;
    

    
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
                              responseType: @"ACMessageIDEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACMessageIDEnvelope*)data, error);
                           }
          ];
}

///
/// Get Normalized Message Aggregates
/// Get Aggregates on normalized messages.
///  @param sdid Source device ID of the messages being searched.
///
///  @param field Message field being queried for aggregates.
///
///  @param startDate Timestamp of earliest message (in milliseconds since epoch).
///
///  @param endDate Timestamp of latest message (in milliseconds since epoch).
///
///  @returns ACAggregatesResponse*
///
-(NSNumber*) getMessageAggregatesWithSdid: (NSString*) sdid
    field: (NSString*) field
    startDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    completionHandler: (void (^)(ACAggregatesResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'sdid' is set
    if (sdid == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `sdid` when calling `getMessageAggregates`"];
    }
    
    // verify the required parameter 'field' is set
    if (field == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `field` when calling `getMessageAggregates`"];
    }
    
    // verify the required parameter 'startDate' is set
    if (startDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `startDate` when calling `getMessageAggregates`"];
    }
    
    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `endDate` when calling `getMessageAggregates`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/analytics/aggregates"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (sdid != nil) {
        
        queryParams[@"sdid"] = sdid;
    }
    if (field != nil) {
        
        queryParams[@"field"] = field;
    }
    if (startDate != nil) {
        
        queryParams[@"startDate"] = startDate;
    }
    if (endDate != nil) {
        
        queryParams[@"endDate"] = endDate;
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
                              responseType: @"ACAggregatesResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACAggregatesResponse*)data, error);
                           }
          ];
}

///
/// Get Histogram aggregates
/// Get Histogram on normalized messages.
///  @param startDate Timestamp of earliest message (in milliseconds since epoch).
///
///  @param endDate Timestamp of latest message (in milliseconds since epoch).
///
///  @param sdid Source device ID of the messages being searched.
///
///  @param field Message field being queried for building histogram.
///
///  @param interval Interval of time for building histogram blocks. (Valid values: minute, hour, day, month, year)
///
///  @returns ACAggregatesHistogramResponse*
///
-(NSNumber*) getAggregatesHistogramWithStartDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    sdid: (NSString*) sdid
    field: (NSString*) field
    interval: (NSString*) interval
    completionHandler: (void (^)(ACAggregatesHistogramResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'startDate' is set
    if (startDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `startDate` when calling `getAggregatesHistogram`"];
    }
    
    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `endDate` when calling `getAggregatesHistogram`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/analytics/histogram"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (startDate != nil) {
        
        queryParams[@"startDate"] = startDate;
    }
    if (endDate != nil) {
        
        queryParams[@"endDate"] = endDate;
    }
    if (sdid != nil) {
        
        queryParams[@"sdid"] = sdid;
    }
    if (field != nil) {
        
        queryParams[@"field"] = field;
    }
    if (interval != nil) {
        
        queryParams[@"interval"] = interval;
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
                              responseType: @"ACAggregatesHistogramResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACAggregatesHistogramResponse*)data, error);
                           }
          ];
}

///
/// Get Last Normalized Message
/// Get last messages normalized.
///  @param count Number of items to return per query.
///
///  @param sdids Comma separated list of source device IDs (minimum: 1).
///
///  @param fieldPresence String representing a field from the specified device ID.
///
///  @returns ACNormalizedMessagesEnvelope*
///
-(NSNumber*) getLastNormalizedMessagesWithCount: (NSNumber*) count
    sdids: (NSString*) sdids
    fieldPresence: (NSString*) fieldPresence
    completionHandler: (void (^)(ACNormalizedMessagesEnvelope* output, NSError* error)) handler {

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/last"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (count != nil) {
        
        queryParams[@"count"] = count;
    }
    if (sdids != nil) {
        
        queryParams[@"sdids"] = sdids;
    }
    if (fieldPresence != nil) {
        
        queryParams[@"fieldPresence"] = fieldPresence;
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
                              responseType: @"ACNormalizedMessagesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACNormalizedMessagesEnvelope*)data, error);
                           }
          ];
}

///
/// Get normalized message presence
/// Get normalized message presence.
///  @param startDate startDate
///
///  @param endDate endDate
///
///  @param interval String representing grouping interval. One of: 'minute' (1 hour limit), 'hour' (1 day limit), 'day' (31 days limit), 'month' (1 year limit), or 'year' (10 years limit).
///
///  @param sdid Source device ID of the messages being searched.
///
///  @param fieldPresence String representing a field from the specified device ID.
///
///  @returns ACFieldPresenceEnvelope*
///
-(NSNumber*) getFieldPresenceWithStartDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    interval: (NSString*) interval
    sdid: (NSString*) sdid
    fieldPresence: (NSString*) fieldPresence
    completionHandler: (void (^)(ACFieldPresenceEnvelope* output, NSError* error)) handler {

    
    // verify the required parameter 'startDate' is set
    if (startDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `startDate` when calling `getFieldPresence`"];
    }
    
    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `endDate` when calling `getFieldPresence`"];
    }
    
    // verify the required parameter 'interval' is set
    if (interval == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `interval` when calling `getFieldPresence`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/presence"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (sdid != nil) {
        
        queryParams[@"sdid"] = sdid;
    }
    if (fieldPresence != nil) {
        
        queryParams[@"fieldPresence"] = fieldPresence;
    }
    if (startDate != nil) {
        
        queryParams[@"startDate"] = startDate;
    }
    if (endDate != nil) {
        
        queryParams[@"endDate"] = endDate;
    }
    if (interval != nil) {
        
        queryParams[@"interval"] = interval;
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
                              responseType: @"ACFieldPresenceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((ACFieldPresenceEnvelope*)data, error);
                           }
          ];
}



@end
