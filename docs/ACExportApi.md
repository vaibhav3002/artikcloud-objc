# ACExportApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**exportRequest**](ACExportApi.md#exportrequest) | **POST** /messages/export | Create Export Request
[**getExportHistory**](ACExportApi.md#getexporthistory) | **GET** /messages/export/history | Get Export History
[**getExportResult**](ACExportApi.md#getexportresult) | **GET** /messages/export/{exportId}/result | Get Export Result
[**getExportStatus**](ACExportApi.md#getexportstatus) | **GET** /messages/export/{exportId}/status | Check Export Status


# **exportRequest**
```objc
-(NSNumber*) exportRequestWithExportRequestInfo: (ACExportRequestInfo*) exportRequestInfo
        completionHandler: (void (^)(ACExportRequestResponse* output, NSError* error)) handler;
```

Create Export Request

Export normalized messages. The following input combinations are supported:<br/><table><tr><th>Combination</th><th>Parameters</th><th>Description</th></tr><tr><td>Get by users</td><td>uids</td><td>Search by a list of User IDs. For each user in the list, the current authenticated user must have read access over the specified user.</td></tr><tr><td>Get by devices</td><td>sdids</td><td>Search by Source Device IDs.</td></tr><tr><td>Get by device types</td><td>uids,sdtids</td><td>Search by list of Source Device Type IDs for the given list of users.</td></tr><tr><td>Get by trial</td><td>trialId</td><td>Search by Trial ID.</td></tr><tr><td>Get by combination of parameters</td><td>uids,sdids,sdtids</td><td>Search by list of Source Device IDs. Each Device ID must belong to a Source Device Type ID and a User ID.</td></tr><tr><td>Common</td><td>startDate,endDate,order,format,url,csvHeaders</td><td>Parameters that can be used with the above combinations.</td></tr></table>

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACExportRequestInfo* exportRequestInfo = [[ACExportRequestInfo alloc] init]; // ExportRequest object that is passed in the body

ACExportApi*apiInstance = [[ACExportApi alloc] init];

// Create Export Request
[apiInstance exportRequestWithExportRequestInfo:exportRequestInfo
          completionHandler: ^(ACExportRequestResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACExportApi->exportRequest: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportRequestInfo** | [**ACExportRequestInfo***](ACExportRequestInfo*.md)| ExportRequest object that is passed in the body | 

### Return type

[**ACExportRequestResponse***](ACExportRequestResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExportHistory**
```objc
-(NSNumber*) getExportHistoryWithTrialId: (NSString*) trialId
    count: (NSNumber*) count
    offset: (NSNumber*) offset
        completionHandler: (void (^)(ACExportHistoryResponse* output, NSError* error)) handler;
```

Get Export History

Get the history of export requests.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* trialId = @"trialId_example"; // Filter by trialId. (optional)
NSNumber* count = @56; // Pagination count. (optional)
NSNumber* offset = @56; // Pagination offset. (optional)

ACExportApi*apiInstance = [[ACExportApi alloc] init];

// Get Export History
[apiInstance getExportHistoryWithTrialId:trialId
              count:count
              offset:offset
          completionHandler: ^(ACExportHistoryResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACExportApi->getExportHistory: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **trialId** | **NSString***| Filter by trialId. | [optional] 
 **count** | **NSNumber***| Pagination count. | [optional] 
 **offset** | **NSNumber***| Pagination offset. | [optional] 

### Return type

[**ACExportHistoryResponse***](ACExportHistoryResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExportResult**
```objc
-(NSNumber*) getExportResultWithExportId: (NSString*) exportId
        completionHandler: (void (^)(NSString* output, NSError* error)) handler;
```

Get Export Result

Retrieve result of the export query in tgz format. The tar file may contain one or more files with the results.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* exportId = @"exportId_example"; // Export ID of the export query.

ACExportApi*apiInstance = [[ACExportApi alloc] init];

// Get Export Result
[apiInstance getExportResultWithExportId:exportId
          completionHandler: ^(NSString* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACExportApi->getExportResult: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportId** | **NSString***| Export ID of the export query. | 

### Return type

**NSString***

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExportStatus**
```objc
-(NSNumber*) getExportStatusWithExportId: (NSString*) exportId
        completionHandler: (void (^)(ACExportStatusResponse* output, NSError* error)) handler;
```

Check Export Status

Check status of the export query.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* exportId = @"exportId_example"; // Export ID of the export query.

ACExportApi*apiInstance = [[ACExportApi alloc] init];

// Check Export Status
[apiInstance getExportStatusWithExportId:exportId
          completionHandler: ^(ACExportStatusResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACExportApi->getExportStatus: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportId** | **NSString***| Export ID of the export query. | 

### Return type

[**ACExportStatusResponse***](ACExportStatusResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

