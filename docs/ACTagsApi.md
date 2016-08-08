# ACTagsApi

All URIs are relative to *https://api.artik.cloud/v1.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTagCategories**](ACTagsApi.md#gettagcategories) | **GET** /tags/categories | Get all categories
[**getTagSuggestions**](ACTagsApi.md#gettagsuggestions) | **GET** /tags/suggestions | Get tag suggestions
[**getTagsByCategories**](ACTagsApi.md#gettagsbycategories) | **GET** /tags | Get all tags of categories


# **getTagCategories**
```objc
-(NSNumber*) getTagCategoriesWithCompletionHandler: 
        (void (^)(ACTagsEnvelope* output, NSError* error)) handler;
```

Get all categories

Get all tags marked as categories

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];



ACTagsApi*apiInstance = [[ACTagsApi alloc] init];

// Get all categories
[apiInstance getTagCategoriesWithCompletionHandler: 
          ^(ACTagsEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTagsApi->getTagCategories: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ACTagsEnvelope***](ACTagsEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTagSuggestions**
```objc
-(NSNumber*) getTagSuggestionsWithEntityType: (NSString*) entityType
    tags: (NSString*) tags
    name: (NSString*) name
    count: (NSNumber*) count
        completionHandler: (void (^)(ACTagsEnvelope* output, NSError* error)) handler;
```

Get tag suggestions

Get tag suggestions for applications, device types that have been most used with a group of tags.

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* entityType = @"entityType_example"; // Entity type name. (optional)
NSString* tags = @"tags_example"; // Comma separated list of tags. (optional)
NSString* name = @"name_example"; // Name of tags used for type ahead. (optional)
NSNumber* count = @56; // Number of results to return. Max 10. (optional)

ACTagsApi*apiInstance = [[ACTagsApi alloc] init];

// Get tag suggestions
[apiInstance getTagSuggestionsWithEntityType:entityType
              tags:tags
              name:name
              count:count
          completionHandler: ^(ACTagsEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTagsApi->getTagSuggestions: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entityType** | **NSString***| Entity type name. | [optional] 
 **tags** | **NSString***| Comma separated list of tags. | [optional] 
 **name** | **NSString***| Name of tags used for type ahead. | [optional] 
 **count** | **NSNumber***| Number of results to return. Max 10. | [optional] 

### Return type

[**ACTagsEnvelope***](ACTagsEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTagsByCategories**
```objc
-(NSNumber*) getTagsByCategoriesWithCategories: (NSString*) categories
        completionHandler: (void (^)(ACTagsEnvelope* output, NSError* error)) handler;
```

Get all tags of categories

Get all tags related to the list of categories

### Example 
```objc
ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* categories = @"categories_example"; // Comma separated list of categories. (optional)

ACTagsApi*apiInstance = [[ACTagsApi alloc] init];

// Get all tags of categories
[apiInstance getTagsByCategoriesWithCategories:categories
          completionHandler: ^(ACTagsEnvelope* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling ACTagsApi->getTagsByCategories: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categories** | **NSString***| Comma separated list of categories. | [optional] 

### Return type

[**ACTagsEnvelope***](ACTagsEnvelope.md)

### Authorization

[artikcloud_oauth](../README.md#artikcloud_oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

