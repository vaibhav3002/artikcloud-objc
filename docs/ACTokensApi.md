# ACTokensApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkToken**](ACTokensApi.md#checktoken) | **POST** /accounts/checkToken | Check Token
[**refreshToken**](ACTokensApi.md#refreshtoken) | **POST** /accounts/token | Refresh Token
[**tokenInfo**](ACTokensApi.md#tokeninfo) | **GET** /accounts/tokenInfo | Token Info


# **checkToken**
```objc
-(NSNumber*) checkTokenWithTokenInfo: (ACTokenRequest*) tokenInfo
        completionHandler: (void (^)(ACCheckTokenResponse* output, NSError* error)) handler;
```

Check Token

(Deprecated) Check Token. See tokenInfo

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


ACTokenRequest* tokenInfo = [[ACTokenRequest alloc] init]; // Token object to be checked

ACTokensApi*apiInstance = [[ACTokensApi alloc] init];

// Check Token
[apiInstance checkTokenWithTokenInfo:tokenInfo
          completionHandler: ^(ACCheckTokenResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTokensApi->checkToken: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenInfo** | [**ACTokenRequest***](ACTokenRequest*.md)| Token object to be checked | 

### Return type

[**ACCheckTokenResponse***](ACCheckTokenResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshToken**
```objc
-(NSNumber*) refreshTokenWithGrantType: (NSString*) grantType
    refreshToken: (NSString*) refreshToken
        completionHandler: (void (^)(ACRefreshTokenResponse* output, NSError* error)) handler;
```

Refresh Token

Refresh Token

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* grantType = @"grantType_example"; // Grant Type.
NSString* refreshToken = @"refreshToken_example"; // Refresh Token.

ACTokensApi*apiInstance = [[ACTokensApi alloc] init];

// Refresh Token
[apiInstance refreshTokenWithGrantType:grantType
              refreshToken:refreshToken
          completionHandler: ^(ACRefreshTokenResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTokensApi->refreshToken: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **grantType** | **NSString***| Grant Type. | 
 **refreshToken** | **NSString***| Refresh Token. | 

### Return type

[**ACRefreshTokenResponse***](ACRefreshTokenResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tokenInfo**
```objc
-(NSNumber*) tokenInfoWithCompletionHandler: 
        (void (^)(ACTokenInfoSuccessResponse* output, NSError* error)) handler;
```

Token Info

Returns the Token Information

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];



ACTokensApi*apiInstance = [[ACTokensApi alloc] init];

// Token Info
[apiInstance tokenInfoWithCompletionHandler: 
          ^(ACTokenInfoSuccessResponse* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTokensApi->tokenInfo: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ACTokenInfoSuccessResponse***](ACTokenInfoSuccessResponse.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

