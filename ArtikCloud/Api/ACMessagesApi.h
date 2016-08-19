#import <Foundation/Foundation.h>
#import "ACAggregatesHistogramResponse.h"
#import "ACFieldPresenceEnvelope.h"
#import "ACNormalizedMessagesEnvelope.h"
#import "ACAggregatesResponse.h"
#import "ACSnapshotResponses.h"
#import "ACMessageAction.h"
#import "ACMessageIDEnvelope.h"
#import "ACApi.h"

/**
* ARTIK Cloud API
* No descripton provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)
*
* OpenAPI spec version: 2.0.0
* 
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


@interface ACMessagesApi: NSObject <ACApi>

extern NSString* kACMessagesApiErrorDomain;
extern NSInteger kACMessagesApiMissingParamErrorCode;

+(instancetype) sharedAPI;

/// Get Histogram aggregates
/// Get Histogram on normalized messages.
///
/// @param startDate Timestamp of earliest message (in milliseconds since epoch).
/// @param endDate Timestamp of latest message (in milliseconds since epoch).
/// @param sdid Source device ID of the messages being searched. (optional)
/// @param field Message field being queried for building histogram. (optional)
/// @param interval Interval of time for building histogram blocks. (Valid values: minute, hour, day, month, year) (optional)
/// 
///  code:0 message:"success"
///
/// @return ACAggregatesHistogramResponse*
-(NSNumber*) getAggregatesHistogramWithStartDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    sdid: (NSString*) sdid
    field: (NSString*) field
    interval: (NSString*) interval
    completionHandler: (void (^)(ACAggregatesHistogramResponse* output, NSError* error)) handler;


/// Get normalized message presence
/// Get normalized message presence.
///
/// @param startDate startDate
/// @param endDate endDate
/// @param interval String representing grouping interval. One of: &#39;minute&#39; (1 hour limit), &#39;hour&#39; (1 day limit), &#39;day&#39; (31 days limit), &#39;month&#39; (1 year limit), or &#39;year&#39; (10 years limit).
/// @param sdid Source device ID of the messages being searched. (optional)
/// @param fieldPresence String representing a field from the specified device ID. (optional)
/// 
///  code:0 message:"success"
///
/// @return ACFieldPresenceEnvelope*
-(NSNumber*) getFieldPresenceWithStartDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    interval: (NSString*) interval
    sdid: (NSString*) sdid
    fieldPresence: (NSString*) fieldPresence
    completionHandler: (void (^)(ACFieldPresenceEnvelope* output, NSError* error)) handler;


/// Get Last Normalized Message
/// Get last messages normalized.
///
/// @param count Number of items to return per query. (optional)
/// @param sdids Comma separated list of source device IDs (minimum: 1). (optional)
/// @param fieldPresence String representing a field from the specified device ID. (optional)
/// 
///  code:0 message:"success"
///
/// @return ACNormalizedMessagesEnvelope*
-(NSNumber*) getLastNormalizedMessagesWithCount: (NSNumber*) count
    sdids: (NSString*) sdids
    fieldPresence: (NSString*) fieldPresence
    completionHandler: (void (^)(ACNormalizedMessagesEnvelope* output, NSError* error)) handler;


/// Get Normalized Message Aggregates
/// Get Aggregates on normalized messages.
///
/// @param sdid Source device ID of the messages being searched.
/// @param field Message field being queried for aggregates.
/// @param startDate Timestamp of earliest message (in milliseconds since epoch).
/// @param endDate Timestamp of latest message (in milliseconds since epoch).
/// 
///  code:0 message:"success"
///
/// @return ACAggregatesResponse*
-(NSNumber*) getMessageAggregatesWithSdid: (NSString*) sdid
    field: (NSString*) field
    startDate: (NSNumber*) startDate
    endDate: (NSNumber*) endDate
    completionHandler: (void (^)(ACAggregatesResponse* output, NSError* error)) handler;


/// Get Message Snapshots
/// Get message snapshots.
///
/// @param sdids Device IDs for which the snapshots are requested. Max 100 device ids per call.
/// @param includeTimestamp Indicates whether to return timestamps of the last update for each field. (optional)
/// 
///  code:0 message:"success"
///
/// @return ACSnapshotResponses*
-(NSNumber*) getMessageSnapshotsWithSdids: (NSString*) sdids
    includeTimestamp: (NSNumber*) includeTimestamp
    completionHandler: (void (^)(ACSnapshotResponses* output, NSError* error)) handler;


/// Get Normalized Messages
/// Get the messages normalized
///
/// @param uid User ID. If not specified, assume that of the current authenticated user. If specified, it must be that of a user for which the current authenticated user has read access to. (optional)
/// @param sdid Source device ID of the messages being searched. (optional)
/// @param mid The SAMI message ID being searched. (optional)
/// @param fieldPresence String representing a field from the specified device ID. (optional)
/// @param filter Filter. (optional)
/// @param offset A string that represents the starting item, should be the value of &#39;next&#39; field received in the last response. (required for pagination) (optional)
/// @param count count (optional)
/// @param startDate startDate (optional)
/// @param endDate endDate (optional)
/// @param order Desired sort order: &#39;asc&#39; or &#39;desc&#39; (optional)
/// 
///  code:0 message:"success"
///
/// @return ACNormalizedMessagesEnvelope*
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
    completionHandler: (void (^)(ACNormalizedMessagesEnvelope* output, NSError* error)) handler;


/// Send Message Action
/// Send a message or an Action:<br/><table><tr><th>Combination</th><th>Parameters</th><th>Description</th></tr><tr><td>Send Message</td><td>sdid, type=message</td><td>Send a message from a Source Device</td></tr><tr><td>Send Action</td><td>ddid, type=action</td><td>Send an action to a Destination Device</td></tr><tr><td>Common</td><td>data, ts, token</td><td>Parameters that can be used with the above combinations.</td></tr></table>
///
/// @param data Message or Action object that is passed in the body
/// 
///  code:0 message:"success"
///
/// @return ACMessageIDEnvelope*
-(NSNumber*) sendMessageActionWithData: (ACMessageAction*) data
    completionHandler: (void (^)(ACMessageIDEnvelope* output, NSError* error)) handler;



@end
