# ACDeviceTypesApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAvailableManifestVersions**](ACDeviceTypesApi.md#getavailablemanifestversions) | **GET** /devicetypes/{deviceTypeId}/availablemanifestversions | Get Available Manifest Versions
[**getDeviceType**](ACDeviceTypesApi.md#getdevicetype) | **GET** /devicetypes/{deviceTypeId} | Get Device Type
[**getDeviceTypes**](ACDeviceTypesApi.md#getdevicetypes) | **GET** /devicetypes | Get Device Types
[**getDeviceTypesByApplication**](ACDeviceTypesApi.md#getdevicetypesbyapplication) | **GET** /applications/{appId}/devicetypes | Get Device Types by Application
[**getLatestManifestProperties**](ACDeviceTypesApi.md#getlatestmanifestproperties) | **GET** /devicetypes/{deviceTypeId}/manifests/latest/properties | Get Latest Manifest Properties
[**getManifestProperties**](ACDeviceTypesApi.md#getmanifestproperties) | **GET** /devicetypes/{deviceTypeId}/manifests/{version}/properties | Get manifest properties


# **getAvailableManifestVersions**
```objc
-(NSNumber*) getAvailableManifestVersionsWithDeviceTypeId: (NSString*) deviceTypeId
        completionHandler: (void (^)(ACManifestVersionsEnvelope* output, NSError* error)) handler;
```

Get Available Manifest Versions

Get a Device Type's available manifest versions

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceTypeId = @"deviceTypeId_example"; // deviceTypeId

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Available Manifest Versions
[apiInstance getAvailableManifestVersionsWithDeviceTypeId:deviceTypeId
          completionHandler: ^(ACManifestVersionsEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getAvailableManifestVersions: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTypeId** | **NSString***| deviceTypeId | 

### Return type

[**ACManifestVersionsEnvelope***](ACManifestVersionsEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceType**
```objc
-(NSNumber*) getDeviceTypeWithDeviceTypeId: (NSString*) deviceTypeId
        completionHandler: (void (^)(ACDeviceTypeEnvelope* output, NSError* error)) handler;
```

Get Device Type

Retrieves a Device Type

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceTypeId = @"deviceTypeId_example"; // deviceTypeId

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Device Type
[apiInstance getDeviceTypeWithDeviceTypeId:deviceTypeId
          completionHandler: ^(ACDeviceTypeEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getDeviceType: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTypeId** | **NSString***| deviceTypeId | 

### Return type

[**ACDeviceTypeEnvelope***](ACDeviceTypeEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceTypes**
```objc
-(NSNumber*) getDeviceTypesWithName: (NSString*) name
    offset: (NSNumber*) offset
    count: (NSNumber*) count
    tags: (NSString*) tags
        completionHandler: (void (^)(ACDeviceTypesEnvelope* output, NSError* error)) handler;
```

Get Device Types

Retrieves Device Types

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* name = @"name_example"; // Device Type name
NSNumber* offset = @56; // Offset for pagination. (optional)
NSNumber* count = @56; // Desired count of items in the result set (optional)
NSString* tags = @"tags_example"; // Elements tagged with the list of tags. (comma separated) (optional)

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Device Types
[apiInstance getDeviceTypesWithName:name
              offset:offset
              count:count
              tags:tags
          completionHandler: ^(ACDeviceTypesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getDeviceTypes: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **NSString***| Device Type name | 
 **offset** | **NSNumber***| Offset for pagination. | [optional] 
 **count** | **NSNumber***| Desired count of items in the result set | [optional] 
 **tags** | **NSString***| Elements tagged with the list of tags. (comma separated) | [optional] 

### Return type

[**ACDeviceTypesEnvelope***](ACDeviceTypesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceTypesByApplication**
```objc
-(NSNumber*) getDeviceTypesByApplicationWithAppId: (NSString*) appId
    productInfo: (NSNumber*) productInfo
    count: (NSNumber*) count
    offset: (NSNumber*) offset
        completionHandler: (void (^)(ACDeviceTypesEnvelope* output, NSError* error)) handler;
```

Get Device Types by Application

Get Device Types by Application

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* appId = @"appId_example"; // Application ID.
NSNumber* productInfo = @true; // Flag to include the associated ProductInfo if present (optional)
NSNumber* count = @56; // Desired count of items in the result set. (optional)
NSNumber* offset = @56; // Offset for pagination. (optional)

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Device Types by Application
[apiInstance getDeviceTypesByApplicationWithAppId:appId
              productInfo:productInfo
              count:count
              offset:offset
          completionHandler: ^(ACDeviceTypesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getDeviceTypesByApplication: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appId** | **NSString***| Application ID. | 
 **productInfo** | **NSNumber***| Flag to include the associated ProductInfo if present | [optional] 
 **count** | **NSNumber***| Desired count of items in the result set. | [optional] 
 **offset** | **NSNumber***| Offset for pagination. | [optional] 

### Return type

[**ACDeviceTypesEnvelope***](ACDeviceTypesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestManifestProperties**
```objc
-(NSNumber*) getLatestManifestPropertiesWithDeviceTypeId: (NSString*) deviceTypeId
        completionHandler: (void (^)(ACManifestPropertiesEnvelope* output, NSError* error)) handler;
```

Get Latest Manifest Properties

Get a Device Type's manifest properties for the latest version.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceTypeId = @"deviceTypeId_example"; // Device Type ID.

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Latest Manifest Properties
[apiInstance getLatestManifestPropertiesWithDeviceTypeId:deviceTypeId
          completionHandler: ^(ACManifestPropertiesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getLatestManifestProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTypeId** | **NSString***| Device Type ID. | 

### Return type

[**ACManifestPropertiesEnvelope***](ACManifestPropertiesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getManifestProperties**
```objc
-(NSNumber*) getManifestPropertiesWithDeviceTypeId: (NSString*) deviceTypeId
    version: (NSString*) version
        completionHandler: (void (^)(ACManifestPropertiesEnvelope* output, NSError* error)) handler;
```

Get manifest properties

Get a Device Type's manifest properties for a specific version.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceTypeId = @"deviceTypeId_example"; // Device Type ID.
NSString* version = @"version_example"; // Manifest Version.

ACDeviceTypesApi*apiInstance = [[ACDeviceTypesApi alloc] init];

// Get manifest properties
[apiInstance getManifestPropertiesWithDeviceTypeId:deviceTypeId
              version:version
          completionHandler: ^(ACManifestPropertiesEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDeviceTypesApi->getManifestProperties: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTypeId** | **NSString***| Device Type ID. | 
 **version** | **NSString***| Manifest Version. | 

### Return type

[**ACManifestPropertiesEnvelope***](ACManifestPropertiesEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

