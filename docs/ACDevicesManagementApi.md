# ACDevicesManagementApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTasks**](ACDevicesManagementApi.md#createtasks) | **POST** /devicemgmt/tasks | Create a new task for one or more devices
[**deleteServerProperties**](ACDevicesManagementApi.md#deleteserverproperties) | **DELETE** /devicemgmt/devices/{did}/serverproperties | Deletes a device&#39;s properties.
[**getAllByDid**](ACDevicesManagementApi.md#getallbydid) | **GET** /devicemgmt/devices/{did}/tasks | Returns the list of tasks for a particular device id with optional status filter.
[**getDeviceTypesInfo**](ACDevicesManagementApi.md#getdevicetypesinfo) | **GET** /devicemgmt/devicetypes/{dtid} | Read a device type device management information.
[**getManifestProperties**](ACDevicesManagementApi.md#getmanifestproperties) | **GET** /devicemgmt/devicetypes/{dtid}/manifest/properties | Get a device type&#39;s device management manifest properties
[**getProperties**](ACDevicesManagementApi.md#getproperties) | **GET** /devicemgmt/devices/{did}/properties | Read a device&#39;s properties.
[**getStatuses**](ACDevicesManagementApi.md#getstatuses) | **GET** /devicemgmt/tasks/{tid}/statuses | Returns the details and status of a task id and the individual statuses of each device id in the list.
[**getStatusesHistory**](ACDevicesManagementApi.md#getstatuseshistory) | **GET** /devicemgmt/tasks/{tid}/statuses/history | Returns the history of the status changes for a specific task id, or for a specific device id in that task.
[**getTaskByID**](ACDevicesManagementApi.md#gettaskbyid) | **GET** /devicemgmt/tasks/{tid} | Returns the details and global status of a specific task id.
[**getTasks**](ACDevicesManagementApi.md#gettasks) | **GET** /devicemgmt/tasks | Returns the all the tasks for a device type.
[**queryProperties**](ACDevicesManagementApi.md#queryproperties) | **GET** /devicemgmt/devices/properties | Query device properties across devices.
[**updateDeviceTypesInfo**](ACDevicesManagementApi.md#updatedevicetypesinfo) | **PUT** /devicemgmt/devicetypes/{dtid} | Updates a device type information
[**updateServerProperties**](ACDevicesManagementApi.md#updateserverproperties) | **POST** /devicemgmt/devices/{did}/serverproperties | Updates a device&#39;s server properties.
[**updateTask**](ACDevicesManagementApi.md#updatetask) | **PUT** /devicemgmt/tasks/{tid} | Updates a task for all devices - For now just allows changing the state to cancelled.
[**updateTaskForDevice**](ACDevicesManagementApi.md#updatetaskfordevice) | **PUT** /devicemgmt/tasks/{tid}/devices/{did} | Updates a task for a specific device - For now just allows changing the state to cancelled.


# **createTasks**
```objc
-(NSNumber*) createTasksWithTaskPayload: (ACTaskRequest*) taskPayload
        completionHandler: (void (^)(ACTaskEnvelope* output, NSError* error)) handler;
```

Create a new task for one or more devices

Create a new task for one or more devices

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACTaskRequest* taskPayload = [[ACTaskRequest alloc] init]; // Task object to be created

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Create a new task for one or more devices
[apiInstance createTasksWithTaskPayload:taskPayload
          completionHandler: ^(ACTaskEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->createTasks: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskPayload** | [**ACTaskRequest***](ACTaskRequest*.md)| Task object to be created | 

### Return type

[**ACTaskEnvelope***](ACTaskEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteServerProperties**
```objc
-(NSNumber*) deleteServerPropertiesWithDid: (NSString*) did
        completionHandler: (void (^)(ACMetadataEnvelope* output, NSError* error)) handler;
```

Deletes a device's properties.

Deletes a device's properties.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* did = @"did_example"; // Device ID.

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Deletes a device's properties.
[apiInstance deleteServerPropertiesWithDid:did
          completionHandler: ^(ACMetadataEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->deleteServerProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **did** | **NSString***| Device ID. | 

### Return type

[**ACMetadataEnvelope***](ACMetadataEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllByDid**
```objc
-(NSNumber*) getAllByDidWithDid: (NSString*) did
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    status: (NSString*) status
    order: (NSString*) order
    sort: (NSString*) sort
        completionHandler: (void (^)(ACTaskByDidListEnvelope* output, NSError* error)) handler;
```

Returns the list of tasks for a particular device id with optional status filter.

Returns the list of tasks for a particular device id with optional status filter.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* did = @"did_example"; // Device ID.
NSNumber* count = @56; // Max results count. (optional)
NSNumber* offset = @56; // Result starting offset. (optional)
NSString* status = @"status_example"; // Status filter. Comma-separated statuses. (optional)
NSString* order = @"order_example"; // Sort results by a field. Valid fields: createdOn. (optional)
NSString* sort = @"sort_example"; // Sort order. Valid values: asc or desc. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Returns the list of tasks for a particular device id with optional status filter.
[apiInstance getAllByDidWithDid:did
              count:count
              offset:offset
              status:status
              order:order
              sort:sort
          completionHandler: ^(ACTaskByDidListEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getAllByDid: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **did** | **NSString***| Device ID. | 
 **count** | **NSNumber***| Max results count. | [optional] 
 **offset** | **NSNumber***| Result starting offset. | [optional] 
 **status** | **NSString***| Status filter. Comma-separated statuses. | [optional] 
 **order** | **NSString***| Sort results by a field. Valid fields: createdOn. | [optional] 
 **sort** | **NSString***| Sort order. Valid values: asc or desc. | [optional] 

### Return type

[**ACTaskByDidListEnvelope***](ACTaskByDidListEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceTypesInfo**
```objc
-(NSNumber*) getDeviceTypesInfoWithDtid: (NSString*) dtid
        completionHandler: (void (^)(ACDeviceTypesInfoEnvelope* output, NSError* error)) handler;
```

Read a device type device management information.

Read a device type device management information.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* dtid = @"dtid_example"; // Device type ID.

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Read a device type device management information.
[apiInstance getDeviceTypesInfoWithDtid:dtid
          completionHandler: ^(ACDeviceTypesInfoEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getDeviceTypesInfo: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dtid** | **NSString***| Device type ID. | 

### Return type

[**ACDeviceTypesInfoEnvelope***](ACDeviceTypesInfoEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getManifestProperties**
```objc
-(NSNumber*) getManifestPropertiesWithDtid: (NSString*) dtid
        completionHandler: (void (^)(ACMetadataPropertiesEnvelope* output, NSError* error)) handler;
```

Get a device type's device management manifest properties

Get a device type's device management manifest properties

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* dtid = @"dtid_example"; // Device Type ID.

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Get a device type's device management manifest properties
[apiInstance getManifestPropertiesWithDtid:dtid
          completionHandler: ^(ACMetadataPropertiesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getManifestProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dtid** | **NSString***| Device Type ID. | 

### Return type

[**ACMetadataPropertiesEnvelope***](ACMetadataPropertiesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProperties**
```objc
-(NSNumber*) getPropertiesWithDid: (NSString*) did
    includeTimestamp: (NSNumber*) includeTimestamp
        completionHandler: (void (^)(ACMetadataEnvelope* output, NSError* error)) handler;
```

Read a device's properties.

Read a device's properties.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* did = @"did_example"; // Device ID.
NSNumber* includeTimestamp = @true; // Include timestamp. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Read a device's properties.
[apiInstance getPropertiesWithDid:did
              includeTimestamp:includeTimestamp
          completionHandler: ^(ACMetadataEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **did** | **NSString***| Device ID. | 
 **includeTimestamp** | **NSNumber***| Include timestamp. | [optional] 

### Return type

[**ACMetadataEnvelope***](ACMetadataEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatuses**
```objc
-(NSNumber*) getStatusesWithTid: (NSString*) tid
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    status: (NSString*) status
    dids: (NSString*) dids
        completionHandler: (void (^)(ACTaskStatusesEnvelope* output, NSError* error)) handler;
```

Returns the details and status of a task id and the individual statuses of each device id in the list.

Returns the details and status of a task id and the individual statuses of each device id in the list.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* tid = @"tid_example"; // Task ID.
NSNumber* count = @56; // Max results count. (optional)
NSNumber* offset = @56; // Result starting offset. (optional)
NSString* status = @"status_example"; // Status filter. Comma-separated statuses. (optional)
NSString* dids = @"dids_example"; // Devices filter. Comma-separated device IDs. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Returns the details and status of a task id and the individual statuses of each device id in the list.
[apiInstance getStatusesWithTid:tid
              count:count
              offset:offset
              status:status
              dids:dids
          completionHandler: ^(ACTaskStatusesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getStatuses: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tid** | **NSString***| Task ID. | 
 **count** | **NSNumber***| Max results count. | [optional] 
 **offset** | **NSNumber***| Result starting offset. | [optional] 
 **status** | **NSString***| Status filter. Comma-separated statuses. | [optional] 
 **dids** | **NSString***| Devices filter. Comma-separated device IDs. | [optional] 

### Return type

[**ACTaskStatusesEnvelope***](ACTaskStatusesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatusesHistory**
```objc
-(NSNumber*) getStatusesHistoryWithTid: (NSString*) tid
    did: (NSString*) did
        completionHandler: (void (^)(ACTaskStatusesHistoryEnvelope* output, NSError* error)) handler;
```

Returns the history of the status changes for a specific task id, or for a specific device id in that task.

Returns the history of the status changes for a specific task id, or for a specific device id in that task.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* tid = @"tid_example"; // Task ID.
NSString* did = @"did_example"; // Device ID. Optional. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Returns the history of the status changes for a specific task id, or for a specific device id in that task.
[apiInstance getStatusesHistoryWithTid:tid
              did:did
          completionHandler: ^(ACTaskStatusesHistoryEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getStatusesHistory: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tid** | **NSString***| Task ID. | 
 **did** | **NSString***| Device ID. Optional. | [optional] 

### Return type

[**ACTaskStatusesHistoryEnvelope***](ACTaskStatusesHistoryEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTaskByID**
```objc
-(NSNumber*) getTaskByIDWithTid: (NSString*) tid
        completionHandler: (void (^)(ACTaskEnvelope* output, NSError* error)) handler;
```

Returns the details and global status of a specific task id.

Returns the details and global status of a specific task id.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* tid = @"tid_example"; // Task ID.

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Returns the details and global status of a specific task id.
[apiInstance getTaskByIDWithTid:tid
          completionHandler: ^(ACTaskEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getTaskByID: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tid** | **NSString***| Task ID. | 

### Return type

[**ACTaskEnvelope***](ACTaskEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTasks**
```objc
-(NSNumber*) getTasksWithDtid: (NSString*) dtid
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    status: (NSString*) status
    order: (NSString*) order
    sort: (NSString*) sort
        completionHandler: (void (^)(ACTaskListEnvelope* output, NSError* error)) handler;
```

Returns the all the tasks for a device type.

Returns the all the tasks for a device type.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* dtid = @"dtid_example"; // Device Type ID.
NSNumber* count = @56; // Max results count. (optional)
NSNumber* offset = @56; // Result starting offset. (optional)
NSString* status = @"status_example"; // Status filter. Comma-separated statuses. (optional)
NSString* order = @"order_example"; // Sort results by a field. Valid fields: createdOn. (optional)
NSString* sort = @"sort_example"; // Sort order. Valid values: asc or desc. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Returns the all the tasks for a device type.
[apiInstance getTasksWithDtid:dtid
              count:count
              offset:offset
              status:status
              order:order
              sort:sort
          completionHandler: ^(ACTaskListEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->getTasks: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dtid** | **NSString***| Device Type ID. | 
 **count** | **NSNumber***| Max results count. | [optional] 
 **offset** | **NSNumber***| Result starting offset. | [optional] 
 **status** | **NSString***| Status filter. Comma-separated statuses. | [optional] 
 **order** | **NSString***| Sort results by a field. Valid fields: createdOn. | [optional] 
 **sort** | **NSString***| Sort order. Valid values: asc or desc. | [optional] 

### Return type

[**ACTaskListEnvelope***](ACTaskListEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **queryProperties**
```objc
-(NSNumber*) queryPropertiesWithDtid: (NSString*) dtid
    count: (NSNumber*) count
    offset: (NSNumber*) offset
    filter: (NSString*) filter
    includeTimestamp: (NSNumber*) includeTimestamp
        completionHandler: (void (^)(ACMetadataQueryEnvelope* output, NSError* error)) handler;
```

Query device properties across devices.

Query device properties across devices.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* dtid = @"dtid_example"; // Device Type ID.
NSNumber* count = @56; // Max results count. (optional)
NSNumber* offset = @56; // Result starting offset. (optional)
NSString* filter = @"filter_example"; // Query filter. Comma-separated key=value pairs (optional)
NSNumber* includeTimestamp = @true; // Include timestamp. (optional)

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Query device properties across devices.
[apiInstance queryPropertiesWithDtid:dtid
              count:count
              offset:offset
              filter:filter
              includeTimestamp:includeTimestamp
          completionHandler: ^(ACMetadataQueryEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->queryProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dtid** | **NSString***| Device Type ID. | 
 **count** | **NSNumber***| Max results count. | [optional] 
 **offset** | **NSNumber***| Result starting offset. | [optional] 
 **filter** | **NSString***| Query filter. Comma-separated key&#x3D;value pairs | [optional] 
 **includeTimestamp** | **NSNumber***| Include timestamp. | [optional] 

### Return type

[**ACMetadataQueryEnvelope***](ACMetadataQueryEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDeviceTypesInfo**
```objc
-(NSNumber*) updateDeviceTypesInfoWithDtid: (NSString*) dtid
    deviceTypeInfo: (ACDeviceTypesInfo*) deviceTypeInfo
        completionHandler: (void (^)(ACDeviceTypesInfoEnvelope* output, NSError* error)) handler;
```

Updates a device type information

Updates a device type information

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* dtid = @"dtid_example"; // Device type ID.
ACDeviceTypesInfo* deviceTypeInfo = [[ACDeviceTypesInfo alloc] init]; // Device type info object to be set

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Updates a device type information
[apiInstance updateDeviceTypesInfoWithDtid:dtid
              deviceTypeInfo:deviceTypeInfo
          completionHandler: ^(ACDeviceTypesInfoEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->updateDeviceTypesInfo: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dtid** | **NSString***| Device type ID. | 
 **deviceTypeInfo** | [**ACDeviceTypesInfo***](ACDeviceTypesInfo*.md)| Device type info object to be set | 

### Return type

[**ACDeviceTypesInfoEnvelope***](ACDeviceTypesInfoEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateServerProperties**
```objc
-(NSNumber*) updateServerPropertiesWithDid: (NSString*) did
    deviceProperties: (NSObject*) deviceProperties
        completionHandler: (void (^)(ACMetadataEnvelope* output, NSError* error)) handler;
```

Updates a device's server properties.

Updates a device's server properties.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* did = @"did_example"; // Device ID.
NSObject* deviceProperties = NULL; // Device properties object to be set

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Updates a device's server properties.
[apiInstance updateServerPropertiesWithDid:did
              deviceProperties:deviceProperties
          completionHandler: ^(ACMetadataEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->updateServerProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **did** | **NSString***| Device ID. | 
 **deviceProperties** | **NSObject***| Device properties object to be set | 

### Return type

[**ACMetadataEnvelope***](ACMetadataEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTask**
```objc
-(NSNumber*) updateTaskWithTid: (NSString*) tid
    taskUpdateRequest: (ACTaskUpdateRequest*) taskUpdateRequest
        completionHandler: (void (^)(ACTaskUpdateResponse* output, NSError* error)) handler;
```

Updates a task for all devices - For now just allows changing the state to cancelled.

Updates a task for all devices - For now just allows changing the state to cancelled.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* tid = @"tid_example"; // Task ID.
ACTaskUpdateRequest* taskUpdateRequest = [[ACTaskUpdateRequest alloc] init]; // Task update request

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Updates a task for all devices - For now just allows changing the state to cancelled.
[apiInstance updateTaskWithTid:tid
              taskUpdateRequest:taskUpdateRequest
          completionHandler: ^(ACTaskUpdateResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->updateTask: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tid** | **NSString***| Task ID. | 
 **taskUpdateRequest** | [**ACTaskUpdateRequest***](ACTaskUpdateRequest*.md)| Task update request | 

### Return type

[**ACTaskUpdateResponse***](ACTaskUpdateResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTaskForDevice**
```objc
-(NSNumber*) updateTaskForDeviceWithTid: (NSString*) tid
    did: (NSString*) did
    deviceTaskUpdateRequest: (ACDeviceTaskUpdateRequest*) deviceTaskUpdateRequest
        completionHandler: (void (^)(ACDeviceTaskUpdateResponse* output, NSError* error)) handler;
```

Updates a task for a specific device - For now just allows changing the state to cancelled.

Updates a task for a specific device - For now just allows changing the state to cancelled.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* tid = @"tid_example"; // Task ID.
NSString* did = @"did_example"; // Device ID.
ACDeviceTaskUpdateRequest* deviceTaskUpdateRequest = [[ACDeviceTaskUpdateRequest alloc] init]; // Device task update request

ACDevicesManagementApi*apiInstance = [[ACDevicesManagementApi alloc] init];

// Updates a task for a specific device - For now just allows changing the state to cancelled.
[apiInstance updateTaskForDeviceWithTid:tid
              did:did
              deviceTaskUpdateRequest:deviceTaskUpdateRequest
          completionHandler: ^(ACDeviceTaskUpdateResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesManagementApi->updateTaskForDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tid** | **NSString***| Task ID. | 
 **did** | **NSString***| Device ID. | 
 **deviceTaskUpdateRequest** | [**ACDeviceTaskUpdateRequest***](ACDeviceTaskUpdateRequest*.md)| Device task update request | 

### Return type

[**ACDeviceTaskUpdateResponse***](ACDeviceTaskUpdateResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

