# ACDevicesApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addDevice**](ACDevicesApi.md#adddevice) | **POST** /devices | Add Device
[**deleteDevice**](ACDevicesApi.md#deletedevice) | **DELETE** /devices/{deviceId} | Delete Device
[**deleteDeviceToken**](ACDevicesApi.md#deletedevicetoken) | **DELETE** /devices/{deviceId}/tokens | Delete Device Token
[**getDevice**](ACDevicesApi.md#getdevice) | **GET** /devices/{deviceId} | Get Device
[**getDevicePresence**](ACDevicesApi.md#getdevicepresence) | **GET** /devices/{deviceId}/presence | Get device presence information
[**getDeviceToken**](ACDevicesApi.md#getdevicetoken) | **GET** /devices/{deviceId}/tokens | Get Device Token
[**updateDevice**](ACDevicesApi.md#updatedevice) | **PUT** /devices/{deviceId} | Update Device
[**updateDeviceToken**](ACDevicesApi.md#updatedevicetoken) | **PUT** /devices/{deviceId}/tokens | Update Device Token


# **addDevice**
```objc
-(NSNumber*) addDeviceWithDevice: (ACDevice*) device
        completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler;
```

Add Device

Create a device

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACDevice* device = [[ACDevice alloc] init]; // Device to be added to the user

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Add Device
[apiInstance addDeviceWithDevice:device
          completionHandler: ^(ACDeviceEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->addDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device** | [**ACDevice***](ACDevice*.md)| Device to be added to the user | 

### Return type

[**ACDeviceEnvelope***](ACDeviceEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDevice**
```objc
-(NSNumber*) deleteDeviceWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler;
```

Delete Device

Deletes a device

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Delete Device
[apiInstance deleteDeviceWithDeviceId:deviceId
          completionHandler: ^(ACDeviceEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->deleteDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 

### Return type

[**ACDeviceEnvelope***](ACDeviceEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDeviceToken**
```objc
-(NSNumber*) deleteDeviceTokenWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler;
```

Delete Device Token

Deletes a device's token

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Delete Device Token
[apiInstance deleteDeviceTokenWithDeviceId:deviceId
          completionHandler: ^(ACDeviceTokenEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->deleteDeviceToken: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 

### Return type

[**ACDeviceTokenEnvelope***](ACDeviceTokenEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevice**
```objc
-(NSNumber*) getDeviceWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler;
```

Get Device

Retrieves a device

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Get Device
[apiInstance getDeviceWithDeviceId:deviceId
          completionHandler: ^(ACDeviceEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->getDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 

### Return type

[**ACDeviceEnvelope***](ACDeviceEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevicePresence**
```objc
-(NSNumber*) getDevicePresenceWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACPresenceEnvelope* output, NSError* error)) handler;
```

Get device presence information

Return the presence status of the given device along with the time it was last seen

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // Device ID.

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Get device presence information
[apiInstance getDevicePresenceWithDeviceId:deviceId
          completionHandler: ^(ACPresenceEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->getDevicePresence: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| Device ID. | 

### Return type

[**ACPresenceEnvelope***](ACPresenceEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceToken**
```objc
-(NSNumber*) getDeviceTokenWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler;
```

Get Device Token

Retrieves a device's token

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Get Device Token
[apiInstance getDeviceTokenWithDeviceId:deviceId
          completionHandler: ^(ACDeviceTokenEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->getDeviceToken: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 

### Return type

[**ACDeviceTokenEnvelope***](ACDeviceTokenEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDevice**
```objc
-(NSNumber*) updateDeviceWithDeviceId: (NSString*) deviceId
    device: (ACDevice*) device
        completionHandler: (void (^)(ACDeviceEnvelope* output, NSError* error)) handler;
```

Update Device

Updates a device

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId
ACDevice* device = [[ACDevice alloc] init]; // Device to be updated

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Update Device
[apiInstance updateDeviceWithDeviceId:deviceId
              device:device
          completionHandler: ^(ACDeviceEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->updateDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 
 **device** | [**ACDevice***](ACDevice*.md)| Device to be updated | 

### Return type

[**ACDeviceEnvelope***](ACDeviceEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDeviceToken**
```objc
-(NSNumber*) updateDeviceTokenWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACDeviceTokenEnvelope* output, NSError* error)) handler;
```

Update Device Token

Updates a device's token

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // deviceId

ACDevicesApi*apiInstance = [[ACDevicesApi alloc] init];

// Update Device Token
[apiInstance updateDeviceTokenWithDeviceId:deviceId
          completionHandler: ^(ACDeviceTokenEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACDevicesApi->updateDeviceToken: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| deviceId | 

### Return type

[**ACDeviceTokenEnvelope***](ACDeviceTokenEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: text/plain
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

