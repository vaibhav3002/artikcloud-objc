#import <Foundation/Foundation.h>
#import "ACObject.h"

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

#import "ACTaskParameters.h"
#import "ACTaskStatus.h"
#import "ACTaskStatusCounts.h"


@protocol ACTaskStatuses
@end

@interface ACTaskStatuses : ACObject

/* Filter [optional]
 */
@property(nonatomic) NSString* filter;
/* Task type [optional]
 */
@property(nonatomic) NSString* taskType;
/* Modified on [optional]
 */
@property(nonatomic) NSNumber* modifiedOn;
/* Device Type ID [optional]
 */
@property(nonatomic) NSString* dtid;
/* Status counts [optional]
 */
@property(nonatomic) ACTaskStatusCounts* statusCounts;
/* Property [optional]
 */
@property(nonatomic) NSString* _property;
/* Statuses [optional]
 */
@property(nonatomic) NSArray<ACTaskStatus>* statuses;
/* Task ID [optional]
 */
@property(nonatomic) NSString* _id;
/* Device IDs [optional]
 */
@property(nonatomic) NSArray<NSString*>* dids;
/* Task parameters [optional]
 */
@property(nonatomic) ACTaskParameters* taskParameters;
/* Created on [optional]
 */
@property(nonatomic) NSNumber* createdOn;
/* Status [optional]
 */
@property(nonatomic) NSString* status;

@end
