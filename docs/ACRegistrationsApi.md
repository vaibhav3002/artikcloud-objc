# ACRegistrationsApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**confirmUser**](ACRegistrationsApi.md#confirmuser) | **PUT** /devices/registrations/pin | Confirm User
[**getRequestStatusForUser**](ACRegistrationsApi.md#getrequeststatusforuser) | **GET** /devices/registrations/{requestId}/status | Get Request Status For User
[**unregisterDevice**](ACRegistrationsApi.md#unregisterdevice) | **DELETE** /devices/{deviceId}/registrations | Unregister Device


# **confirmUser**
```objc
-(NSNumber*) confirmUserWithRegistrationInfo: (ACDeviceRegConfirmUserRequest*) registrationInfo
        completionHandler: (void (^)(ACDeviceRegConfirmUserResponseEnvelope* output, NSError* error)) handler;
```

Confirm User

This call updates the registration request issued earlier by associating it with an authenticated user and captures all additional information required to add a new device.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACDeviceRegConfirmUserRequest* registrationInfo = [[ACDeviceRegConfirmUserRequest alloc] init]; // Device Registration information.

ACRegistrationsApi*apiInstance = [[ACRegistrationsApi alloc] init];

// Confirm User
[apiInstance confirmUserWithRegistrationInfo:registrationInfo
          completionHandler: ^(ACDeviceRegConfirmUserResponseEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRegistrationsApi->confirmUser: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registrationInfo** | [**ACDeviceRegConfirmUserRequest***](ACDeviceRegConfirmUserRequest*.md)| Device Registration information. | 

### Return type

[**ACDeviceRegConfirmUserResponseEnvelope***](ACDeviceRegConfirmUserResponseEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRequestStatusForUser**
```objc
-(NSNumber*) getRequestStatusForUserWithRequestId: (NSString*) requestId
        completionHandler: (void (^)(ACDeviceRegStatusResponseEnvelope* output, NSError* error)) handler;
```

Get Request Status For User

This call checks the status of the request so users can poll and know when registration is complete.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* requestId = @"requestId_example"; // Request ID.

ACRegistrationsApi*apiInstance = [[ACRegistrationsApi alloc] init];

// Get Request Status For User
[apiInstance getRequestStatusForUserWithRequestId:requestId
          completionHandler: ^(ACDeviceRegStatusResponseEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRegistrationsApi->getRequestStatusForUser: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestId** | **NSString***| Request ID. | 

### Return type

[**ACDeviceRegStatusResponseEnvelope***](ACDeviceRegStatusResponseEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unregisterDevice**
```objc
-(NSNumber*) unregisterDeviceWithDeviceId: (NSString*) deviceId
        completionHandler: (void (^)(ACUnregisterDeviceResponseEnvelope* output, NSError* error)) handler;
```

Unregister Device

This call clears any associations from the secure device registration.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* deviceId = @"deviceId_example"; // Device ID.

ACRegistrationsApi*apiInstance = [[ACRegistrationsApi alloc] init];

// Unregister Device
[apiInstance unregisterDeviceWithDeviceId:deviceId
          completionHandler: ^(ACUnregisterDeviceResponseEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRegistrationsApi->unregisterDevice: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **NSString***| Device ID. | 

### Return type

[**ACUnregisterDeviceResponseEnvelope***](ACUnregisterDeviceResponseEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

