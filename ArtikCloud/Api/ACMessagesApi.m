#import "ACMessagesApi.h"
#import "ACQueryParamCollection.h"
#import "ACAggregatesHistogramResponse.h"
#import "ACFieldPresenceEnvelope.h"
#import "ACNormalizedMessagesEnvelope.h"
#import "ACAggregatesResponse.h"
#import "ACSnapshotsResponseEnvelope.h"
#import "ACMessageAction.h"
#import "ACMessageIDEnvelope.h"


@interface ACMessagesApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation ACMessagesApi

NSString* kACMessagesApiErrorDomain = @"ACMessagesApiErrorDomain";
NSInteger kACMessagesApiMissingParamErrorCode = 234513;

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
    static ACMessagesApi *sharedAPI;
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
/// Get Histogram aggregates
/// Get Histogram on normalized messages.
///  @param startDate Timestamp of earliest message (in milliseconds since epoch). 
///
///  @param endDate Timestamp of latest message (in milliseconds since epoch). 
///
///  @param sdid Source device ID of the messages being searched. (optional)
///
///  @param field Message field being queried for building histogram. (optional)
///
///  @param interval Interval of time for building histogram blocks. (Valid values: minute, hour, day, month, year) (optional)
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
        NSParameterAssert(startDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"startDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        NSParameterAssert(endDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"endDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/analytics/histogram"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

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
                              responseType: @"ACAggregatesHistogramResponse*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACAggregatesHistogramResponse*)data, error);
                                }
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
///  @param sdid Source device ID of the messages being searched. (optional)
///
///  @param fieldPresence String representing a field from the specified device ID. (optional)
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
        NSParameterAssert(startDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"startDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        NSParameterAssert(endDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"endDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'interval' is set
    if (interval == nil) {
        NSParameterAssert(interval);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"interval"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/presence"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

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
                              responseType: @"ACFieldPresenceEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACFieldPresenceEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Last Normalized Message
/// Get last messages normalized.
///  @param count Number of items to return per query. (optional)
///
///  @param sdids Comma separated list of source device IDs (minimum: 1). (optional)
///
///  @param fieldPresence String representing a field from the specified device ID. (optional)
///
///  @returns ACNormalizedMessagesEnvelope*
///
-(NSNumber*) getLastNormalizedMessagesWithCount: (NSNumber*) count
    sdids: (NSString*) sdids
    fieldPresence: (NSString*) fieldPresence
    completionHandler: (void (^)(ACNormalizedMessagesEnvelope* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/last"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

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
                              responseType: @"ACNormalizedMessagesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACNormalizedMessagesEnvelope*)data, error);
                                }
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
        NSParameterAssert(sdid);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"sdid"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'field' is set
    if (field == nil) {
        NSParameterAssert(field);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"field"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'startDate' is set
    if (startDate == nil) {
        NSParameterAssert(startDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"startDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'endDate' is set
    if (endDate == nil) {
        NSParameterAssert(endDate);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"endDate"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/analytics/aggregates"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

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
                              responseType: @"ACAggregatesResponse*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACAggregatesResponse*)data, error);
                                }
                           }
          ];
}

///
/// Get Message Snapshots
/// Get message snapshots.
///  @param sdids Device IDs for which the snapshots are requested. Max 100 device ids per call. 
///
///  @param includeTimestamp Indicates whether to return timestamps of the last update for each field. (optional)
///
///  @returns ACSnapshotsResponseEnvelope*
///
-(NSNumber*) getMessageSnapshotsWithSdids: (NSString*) sdids
    includeTimestamp: (NSNumber*) includeTimestamp
    completionHandler: (void (^)(ACSnapshotsResponseEnvelope* output, NSError* error)) handler {
    // verify the required parameter 'sdids' is set
    if (sdids == nil) {
        NSParameterAssert(sdids);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"sdids"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages/snapshots"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (sdids != nil) {
        queryParams[@"sdids"] = sdids;
    }
    if (includeTimestamp != nil) {
        queryParams[@"includeTimestamp"] = includeTimestamp;
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
                              responseType: @"ACSnapshotsResponseEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACSnapshotsResponseEnvelope*)data, error);
                                }
                           }
          ];
}

///
/// Get Normalized Messages
/// Get the messages normalized
///  @param uid User ID. If not specified, assume that of the current authenticated user. If specified, it must be that of a user for which the current authenticated user has read access to. (optional)
///
///  @param sdid Source device ID of the messages being searched. (optional)
///
///  @param mid The SAMI message ID being searched. (optional)
///
///  @param fieldPresence String representing a field from the specified device ID. (optional)
///
///  @param filter Filter. (optional)
///
///  @param offset A string that represents the starting item, should be the value of 'next' field received in the last response. (required for pagination) (optional)
///
///  @param count count (optional)
///
///  @param startDate startDate (optional)
///
///  @param endDate endDate (optional)
///
///  @param order Desired sort order: 'asc' or 'desc' (optional)
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
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

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
                              responseType: @"ACNormalizedMessagesEnvelope*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((ACNormalizedMessagesEnvelope*)data, error);
                                }
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
        NSParameterAssert(data);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"data"] };
            NSError* error = [NSError errorWithDomain:kACMessagesApiErrorDomain code:kACMessagesApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/messages"];

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
                                if(handler) {
                                    handler((ACMessageIDEnvelope*)data, error);
                                }
                           }
          ];
}



@end
