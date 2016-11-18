# ACRulesApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRule**](ACRulesApi.md#createrule) | **POST** /rules | Create Rule
[**deleteRule**](ACRulesApi.md#deleterule) | **DELETE** /rules/{ruleId} | Delete Rule
[**getRule**](ACRulesApi.md#getrule) | **GET** /rules/{ruleId} | Get Rule
[**updateRule**](ACRulesApi.md#updaterule) | **PUT** /rules/{ruleId} | Update Rule


# **createRule**
```objc
-(NSNumber*) createRuleWithRuleInfo: (ACRuleCreationInfo*) ruleInfo
    userId: (NSString*) userId
        completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler;
```

Create Rule

Create a new Rule

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACRuleCreationInfo* ruleInfo = [[ACRuleCreationInfo alloc] init]; // Rule object that needs to be added
NSString* userId = @"userId_example"; // User ID

ACRulesApi*apiInstance = [[ACRulesApi alloc] init];

// Create Rule
[apiInstance createRuleWithRuleInfo:ruleInfo
              userId:userId
          completionHandler: ^(ACRuleEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRulesApi->createRule: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ruleInfo** | [**ACRuleCreationInfo***](ACRuleCreationInfo*.md)| Rule object that needs to be added | 
 **userId** | **NSString***| User ID | 

### Return type

[**ACRuleEnvelope***](ACRuleEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRule**
```objc
-(NSNumber*) deleteRuleWithRuleId: (NSString*) ruleId
        completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler;
```

Delete Rule

Delete a Rule

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* ruleId = @"ruleId_example"; // Rule ID.

ACRulesApi*apiInstance = [[ACRulesApi alloc] init];

// Delete Rule
[apiInstance deleteRuleWithRuleId:ruleId
          completionHandler: ^(ACRuleEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRulesApi->deleteRule: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ruleId** | **NSString***| Rule ID. | 

### Return type

[**ACRuleEnvelope***](ACRuleEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRule**
```objc
-(NSNumber*) getRuleWithRuleId: (NSString*) ruleId
        completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler;
```

Get Rule

Get a rule using the Rule ID

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* ruleId = @"ruleId_example"; // Rule ID.

ACRulesApi*apiInstance = [[ACRulesApi alloc] init];

// Get Rule
[apiInstance getRuleWithRuleId:ruleId
          completionHandler: ^(ACRuleEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRulesApi->getRule: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ruleId** | **NSString***| Rule ID. | 

### Return type

[**ACRuleEnvelope***](ACRuleEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRule**
```objc
-(NSNumber*) updateRuleWithRuleId: (NSString*) ruleId
    ruleInfo: (ACRuleUpdateInfo*) ruleInfo
        completionHandler: (void (^)(ACRuleEnvelope* output, NSError* error)) handler;
```

Update Rule

Update an existing Rule

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* ruleId = @"ruleId_example"; // Rule ID.
ACRuleUpdateInfo* ruleInfo = [[ACRuleUpdateInfo alloc] init]; // Rule object that needs to be updated

ACRulesApi*apiInstance = [[ACRulesApi alloc] init];

// Update Rule
[apiInstance updateRuleWithRuleId:ruleId
              ruleInfo:ruleInfo
          completionHandler: ^(ACRuleEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACRulesApi->updateRule: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ruleId** | **NSString***| Rule ID. | 
 **ruleInfo** | [**ACRuleUpdateInfo***](ACRuleUpdateInfo*.md)| Rule object that needs to be updated | 

### Return type

[**ACRuleEnvelope***](ACRuleEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

