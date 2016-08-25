ARTIK Cloud Objective-C SDK
==========================

[![Build Status](https://travis-ci.org/artikcloud/artikcloud-objc.svg?branch=master)](https://travis-ci.org/artikcloud/artikcloud-objc) [![Pod version](https://badge.fury.io/co/ArtikCloud.svg)](https://badge.fury.io/co/ArtikCloud)

This SDK helps you connect your iOS or OS X applications to ARTIK Cloud. It exposes a number of methods to easily execute REST API calls to ARTIK Cloud.

## Requirements

The SDK requires [**ARC (Automatic Reference Counting)**](http://stackoverflow.com/questions/7778356/how-to-enable-disable-automatic-reference-counting) to be enabled in the Xcode project.

## Installation & Usage
### Install from Github using [CocoaPods](https://cocoapods.org/)

Add the following to the Podfile:

```ruby
pod 'ArtikCloud', :git => 'https://github.com/artikcloud/artikcloud-objc.git'
```

To specify a particular branch, append `, :branch => 'branch-name-here'`

To specify a particular commit, append `, :commit => '11aa22'`

### Install from local path using [CocoaPods](https://cocoapods.org/)

Put the SDK under your project folder (e.g. /path/to/objc_project/Vendor/ArtikCloud) and then add the following to the Podfile:

```ruby
pod 'ArtikCloud', :path => 'Vendor/ArtikCloud'
```

### Usage

Import the following:

```objc
#import <ArtikCloud/ACApiClient.h>
#import <ArtikCloud/ACConfiguration.h>
// load models
#import <ArtikCloud/ACAckEnvelope.h>
#import <ArtikCloud/ACAcknowledgement.h>
#import <ArtikCloud/ACAction.h>
#import <ArtikCloud/ACActionArray.h>
#import <ArtikCloud/ACActionDetails.h>
#import <ArtikCloud/ACActionDetailsArray.h>
#import <ArtikCloud/ACActionIn.h>
#import <ArtikCloud/ACActionOut.h>
#import <ArtikCloud/ACActions.h>
#import <ArtikCloud/ACAggregateData.h>
#import <ArtikCloud/ACAggregatesHistogramData.h>
#import <ArtikCloud/ACAggregatesHistogramResponse.h>
#import <ArtikCloud/ACAggregatesResponse.h>
#import <ArtikCloud/ACAppProperties.h>
#import <ArtikCloud/ACCheckTokenMessage.h>
#import <ArtikCloud/ACCheckTokenResponse.h>
#import <ArtikCloud/ACDevice.h>
#import <ArtikCloud/ACDeviceArray.h>
#import <ArtikCloud/ACDeviceEnvelope.h>
#import <ArtikCloud/ACDeviceRegCompleteRequest.h>
#import <ArtikCloud/ACDeviceRegConfirmUserRequest.h>
#import <ArtikCloud/ACDeviceRegConfirmUserResponse.h>
#import <ArtikCloud/ACDeviceRegConfirmUserResponseEnvelope.h>
#import <ArtikCloud/ACDeviceRegStatusResponse.h>
#import <ArtikCloud/ACDeviceRegStatusResponseEnvelope.h>
#import <ArtikCloud/ACDeviceToken.h>
#import <ArtikCloud/ACDeviceTokenEnvelope.h>
#import <ArtikCloud/ACDeviceType.h>
#import <ArtikCloud/ACDeviceTypeArray.h>
#import <ArtikCloud/ACDeviceTypeEnvelope.h>
#import <ArtikCloud/ACDeviceTypesEnvelope.h>
#import <ArtikCloud/ACDevicesEnvelope.h>
#import <ArtikCloud/ACErrorEnvelope.h>
#import <ArtikCloud/ACExportData.h>
#import <ArtikCloud/ACExportDataArray.h>
#import <ArtikCloud/ACExportHistoryResponse.h>
#import <ArtikCloud/ACExportNormalizedMessagesResponse.h>
#import <ArtikCloud/ACExportRequest.h>
#import <ArtikCloud/ACExportRequestData.h>
#import <ArtikCloud/ACExportRequestInfo.h>
#import <ArtikCloud/ACExportRequestResponse.h>
#import <ArtikCloud/ACExportResponse.h>
#import <ArtikCloud/ACExportStatusResponse.h>
#import <ArtikCloud/ACFieldPath.h>
#import <ArtikCloud/ACFieldPresence.h>
#import <ArtikCloud/ACFieldPresenceEnvelope.h>
#import <ArtikCloud/ACFieldsActions.h>
#import <ArtikCloud/ACManifestProperties.h>
#import <ArtikCloud/ACManifestPropertiesEnvelope.h>
#import <ArtikCloud/ACManifestVersions.h>
#import <ArtikCloud/ACManifestVersionsEnvelope.h>
#import <ArtikCloud/ACMessage.h>
#import <ArtikCloud/ACMessageAction.h>
#import <ArtikCloud/ACMessageID.h>
#import <ArtikCloud/ACMessageIDEnvelope.h>
#import <ArtikCloud/ACMessageIn.h>
#import <ArtikCloud/ACMessageOut.h>
#import <ArtikCloud/ACNonEmptyString.h>
#import <ArtikCloud/ACNormalizedAction.h>
#import <ArtikCloud/ACNormalizedActionsEnvelope.h>
#import <ArtikCloud/ACNormalizedMessage.h>
#import <ArtikCloud/ACNormalizedMessagesEnvelope.h>
#import <ArtikCloud/ACOutputRule.h>
#import <ArtikCloud/ACPresenceEnvelope.h>
#import <ArtikCloud/ACPresenceModel.h>
#import <ArtikCloud/ACPropertiesEnvelope.h>
#import <ArtikCloud/ACRefreshTokenResponse.h>
#import <ArtikCloud/ACRegisterMessage.h>
#import <ArtikCloud/ACRuleArray.h>
#import <ArtikCloud/ACRuleCreationInfo.h>
#import <ArtikCloud/ACRuleEnvelope.h>
#import <ArtikCloud/ACRuleError.h>
#import <ArtikCloud/ACRuleUpdateInfo.h>
#import <ArtikCloud/ACRuleWarningOutput.h>
#import <ArtikCloud/ACRulesEnvelope.h>
#import <ArtikCloud/ACSnapshotResponse.h>
#import <ArtikCloud/ACSnapshotResponses.h>
#import <ArtikCloud/ACSnapshotsResponseEnvelope.h>
#import <ArtikCloud/ACTag.h>
#import <ArtikCloud/ACTagArray.h>
#import <ArtikCloud/ACTagsEnvelope.h>
#import <ArtikCloud/ACToken.h>
#import <ArtikCloud/ACTokenInfo.h>
#import <ArtikCloud/ACTokenInfoSuccessResponse.h>
#import <ArtikCloud/ACTokenRequest.h>
#import <ArtikCloud/ACTokenResponse.h>
#import <ArtikCloud/ACUnregisterDeviceResponse.h>
#import <ArtikCloud/ACUnregisterDeviceResponseEnvelope.h>
#import <ArtikCloud/ACUser.h>
#import <ArtikCloud/ACUserEnvelope.h>
#import <ArtikCloud/ACWebSocketError.h>
// load API classes for accessing endpoints
#import <ArtikCloud/ACDeviceTypesApi.h>
#import <ArtikCloud/ACDevicesApi.h>
#import <ArtikCloud/ACExportApi.h>
#import <ArtikCloud/ACMessagesApi.h>
#import <ArtikCloud/ACRegistrationsApi.h>
#import <ArtikCloud/ACRulesApi.h>
#import <ArtikCloud/ACTagsApi.h>
#import <ArtikCloud/ACTokensApi.h>
#import <ArtikCloud/ACUsersApi.h>

```

## Recommendation

It's recommended to create an instance of ApiClient per thread in a multi-threaded environment to avoid any potential issue.

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```objc

ACConfiguration *apiConfig = [ACConfiguration sharedConfig];

// Configure OAuth2 access token for authorization: (authentication scheme: artikcloud_oauth)
[apiConfig setAccessToken:@"YOUR_ACCESS_TOKEN"];


NSString* *deviceTypeId = @"deviceTypeId_example"; // deviceTypeId

ACDeviceTypesApi *apiInstance = [[ACDeviceTypesApi alloc] init];

// Get Available Manifest Versions
[apiInstance getAvailableManifestVersionsWithDeviceTypeId:deviceTypeId
              completionHandler: ^(ACManifestVersionsEnvelope* output, NSError* error) {
                            if (output) {
                                NSLog(@"%@", output);
                            }
                            if (error) {
                                NSLog(@"Error: %@", error);
                            }
                        }];

```

## Documentation for API Endpoints

All URIs are relative to *https://api.artik.cloud/v1.1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ACDeviceTypesApi* | [**getAvailableManifestVersions**](docs/ACDeviceTypesApi.md#getavailablemanifestversions) | **GET** /devicetypes/{deviceTypeId}/availablemanifestversions | Get Available Manifest Versions
*ACDeviceTypesApi* | [**getDeviceType**](docs/ACDeviceTypesApi.md#getdevicetype) | **GET** /devicetypes/{deviceTypeId} | Get Device Type
*ACDeviceTypesApi* | [**getDeviceTypes**](docs/ACDeviceTypesApi.md#getdevicetypes) | **GET** /devicetypes | Get Device Types
*ACDeviceTypesApi* | [**getLatestManifestProperties**](docs/ACDeviceTypesApi.md#getlatestmanifestproperties) | **GET** /devicetypes/{deviceTypeId}/manifests/latest/properties | Get Latest Manifest Properties
*ACDeviceTypesApi* | [**getManifestProperties**](docs/ACDeviceTypesApi.md#getmanifestproperties) | **GET** /devicetypes/{deviceTypeId}/manifests/{version}/properties | Get manifest properties
*ACDevicesApi* | [**addDevice**](docs/ACDevicesApi.md#adddevice) | **POST** /devices | Add Device
*ACDevicesApi* | [**deleteDevice**](docs/ACDevicesApi.md#deletedevice) | **DELETE** /devices/{deviceId} | Delete Device
*ACDevicesApi* | [**deleteDeviceToken**](docs/ACDevicesApi.md#deletedevicetoken) | **DELETE** /devices/{deviceId}/tokens | Delete Device Token
*ACDevicesApi* | [**getDevice**](docs/ACDevicesApi.md#getdevice) | **GET** /devices/{deviceId} | Get Device
*ACDevicesApi* | [**getDevicePresence**](docs/ACDevicesApi.md#getdevicepresence) | **GET** /devices/{deviceId}/presence | Get device presence information
*ACDevicesApi* | [**getDeviceToken**](docs/ACDevicesApi.md#getdevicetoken) | **GET** /devices/{deviceId}/tokens | Get Device Token
*ACDevicesApi* | [**updateDevice**](docs/ACDevicesApi.md#updatedevice) | **PUT** /devices/{deviceId} | Update Device
*ACDevicesApi* | [**updateDeviceToken**](docs/ACDevicesApi.md#updatedevicetoken) | **PUT** /devices/{deviceId}/tokens | Update Device Token
*ACExportApi* | [**exportRequest**](docs/ACExportApi.md#exportrequest) | **POST** /messages/export | Create Export Request
*ACExportApi* | [**getExportHistory**](docs/ACExportApi.md#getexporthistory) | **GET** /messages/export/history | Get Export History
*ACExportApi* | [**getExportResult**](docs/ACExportApi.md#getexportresult) | **GET** /messages/export/{exportId}/result | Get Export Result
*ACExportApi* | [**getExportStatus**](docs/ACExportApi.md#getexportstatus) | **GET** /messages/export/{exportId}/status | Check Export Status
*ACMessagesApi* | [**getAggregatesHistogram**](docs/ACMessagesApi.md#getaggregateshistogram) | **GET** /messages/analytics/histogram | Get Normalized Message Histogram
*ACMessagesApi* | [**getFieldPresence**](docs/ACMessagesApi.md#getfieldpresence) | **GET** /messages/presence | Get normalized message presence
*ACMessagesApi* | [**getLastNormalizedMessages**](docs/ACMessagesApi.md#getlastnormalizedmessages) | **GET** /messages/last | Get Last Normalized Message
*ACMessagesApi* | [**getMessageAggregates**](docs/ACMessagesApi.md#getmessageaggregates) | **GET** /messages/analytics/aggregates | Get Normalized Message Aggregates
*ACMessagesApi* | [**getMessageSnapshots**](docs/ACMessagesApi.md#getmessagesnapshots) | **GET** /messages/snapshots | Get Message Snapshots
*ACMessagesApi* | [**getNormalizedActions**](docs/ACMessagesApi.md#getnormalizedactions) | **GET** /actions | Get Normalized Actions
*ACMessagesApi* | [**getNormalizedMessages**](docs/ACMessagesApi.md#getnormalizedmessages) | **GET** /messages | Get Normalized Messages
*ACMessagesApi* | [**sendActions**](docs/ACMessagesApi.md#sendactions) | **POST** /actions | Send Actions
*ACMessagesApi* | [**sendMessage**](docs/ACMessagesApi.md#sendmessage) | **POST** /messages | Send Message
*ACRegistrationsApi* | [**confirmUser**](docs/ACRegistrationsApi.md#confirmuser) | **PUT** /devices/registrations/pin | Confirm User
*ACRegistrationsApi* | [**getRequestStatusForUser**](docs/ACRegistrationsApi.md#getrequeststatusforuser) | **GET** /devices/registrations/{requestId}/status | Get Request Status For User
*ACRegistrationsApi* | [**unregisterDevice**](docs/ACRegistrationsApi.md#unregisterdevice) | **DELETE** /devices/{deviceId}/registrations | Unregister Device
*ACRulesApi* | [**createRule**](docs/ACRulesApi.md#createrule) | **POST** /rules | Create Rule
*ACRulesApi* | [**deleteRule**](docs/ACRulesApi.md#deleterule) | **DELETE** /rules/{ruleId} | Delete Rule
*ACRulesApi* | [**getRule**](docs/ACRulesApi.md#getrule) | **GET** /rules/{ruleId} | Get Rule
*ACRulesApi* | [**updateRule**](docs/ACRulesApi.md#updaterule) | **PUT** /rules/{ruleId} | Update Rule
*ACTagsApi* | [**getTagCategories**](docs/ACTagsApi.md#gettagcategories) | **GET** /tags/categories | Get all categories
*ACTagsApi* | [**getTagSuggestions**](docs/ACTagsApi.md#gettagsuggestions) | **GET** /tags/suggestions | Get tag suggestions
*ACTagsApi* | [**getTagsByCategories**](docs/ACTagsApi.md#gettagsbycategories) | **GET** /tags | Get all tags of categories
*ACTokensApi* | [**checkToken**](docs/ACTokensApi.md#checktoken) | **POST** /accounts/checkToken | Check Token
*ACTokensApi* | [**refreshToken**](docs/ACTokensApi.md#refreshtoken) | **POST** /accounts/token | Refresh Token
*ACTokensApi* | [**tokenInfo**](docs/ACTokensApi.md#tokeninfo) | **GET** /accounts/tokenInfo | Token Info
*ACUsersApi* | [**createUserProperties**](docs/ACUsersApi.md#createuserproperties) | **POST** /users/{userId}/properties | Create User Application Properties
*ACUsersApi* | [**deleteUserProperties**](docs/ACUsersApi.md#deleteuserproperties) | **DELETE** /users/{userId}/properties | Delete User Application Properties
*ACUsersApi* | [**getSelf**](docs/ACUsersApi.md#getself) | **GET** /users/self | Get Current User Profile
*ACUsersApi* | [**getUserDeviceTypes**](docs/ACUsersApi.md#getuserdevicetypes) | **GET** /users/{userId}/devicetypes | Get User Device Types
*ACUsersApi* | [**getUserDevices**](docs/ACUsersApi.md#getuserdevices) | **GET** /users/{userId}/devices | Get User Devices
*ACUsersApi* | [**getUserProperties**](docs/ACUsersApi.md#getuserproperties) | **GET** /users/{userId}/properties | Get User application properties
*ACUsersApi* | [**getUserRules**](docs/ACUsersApi.md#getuserrules) | **GET** /users/{userId}/rules | Get User Rules
*ACUsersApi* | [**updateUserProperties**](docs/ACUsersApi.md#updateuserproperties) | **PUT** /users/{userId}/properties | Update User Application Properties


## Documentation For Models

 - [ACAckEnvelope](docs/ACAckEnvelope.md)
 - [ACAcknowledgement](docs/ACAcknowledgement.md)
 - [ACAction](docs/ACAction.md)
 - [ACActionArray](docs/ACActionArray.md)
 - [ACActionDetails](docs/ACActionDetails.md)
 - [ACActionDetailsArray](docs/ACActionDetailsArray.md)
 - [ACActionIn](docs/ACActionIn.md)
 - [ACActionOut](docs/ACActionOut.md)
 - [ACActions](docs/ACActions.md)
 - [ACAggregateData](docs/ACAggregateData.md)
 - [ACAggregatesHistogramData](docs/ACAggregatesHistogramData.md)
 - [ACAggregatesHistogramResponse](docs/ACAggregatesHistogramResponse.md)
 - [ACAggregatesResponse](docs/ACAggregatesResponse.md)
 - [ACAppProperties](docs/ACAppProperties.md)
 - [ACCheckTokenMessage](docs/ACCheckTokenMessage.md)
 - [ACCheckTokenResponse](docs/ACCheckTokenResponse.md)
 - [ACDevice](docs/ACDevice.md)
 - [ACDeviceArray](docs/ACDeviceArray.md)
 - [ACDeviceEnvelope](docs/ACDeviceEnvelope.md)
 - [ACDeviceRegCompleteRequest](docs/ACDeviceRegCompleteRequest.md)
 - [ACDeviceRegConfirmUserRequest](docs/ACDeviceRegConfirmUserRequest.md)
 - [ACDeviceRegConfirmUserResponse](docs/ACDeviceRegConfirmUserResponse.md)
 - [ACDeviceRegConfirmUserResponseEnvelope](docs/ACDeviceRegConfirmUserResponseEnvelope.md)
 - [ACDeviceRegStatusResponse](docs/ACDeviceRegStatusResponse.md)
 - [ACDeviceRegStatusResponseEnvelope](docs/ACDeviceRegStatusResponseEnvelope.md)
 - [ACDeviceToken](docs/ACDeviceToken.md)
 - [ACDeviceTokenEnvelope](docs/ACDeviceTokenEnvelope.md)
 - [ACDeviceType](docs/ACDeviceType.md)
 - [ACDeviceTypeArray](docs/ACDeviceTypeArray.md)
 - [ACDeviceTypeEnvelope](docs/ACDeviceTypeEnvelope.md)
 - [ACDeviceTypesEnvelope](docs/ACDeviceTypesEnvelope.md)
 - [ACDevicesEnvelope](docs/ACDevicesEnvelope.md)
 - [ACErrorEnvelope](docs/ACErrorEnvelope.md)
 - [ACExportData](docs/ACExportData.md)
 - [ACExportDataArray](docs/ACExportDataArray.md)
 - [ACExportHistoryResponse](docs/ACExportHistoryResponse.md)
 - [ACExportNormalizedMessagesResponse](docs/ACExportNormalizedMessagesResponse.md)
 - [ACExportRequest](docs/ACExportRequest.md)
 - [ACExportRequestData](docs/ACExportRequestData.md)
 - [ACExportRequestInfo](docs/ACExportRequestInfo.md)
 - [ACExportRequestResponse](docs/ACExportRequestResponse.md)
 - [ACExportResponse](docs/ACExportResponse.md)
 - [ACExportStatusResponse](docs/ACExportStatusResponse.md)
 - [ACFieldPath](docs/ACFieldPath.md)
 - [ACFieldPresence](docs/ACFieldPresence.md)
 - [ACFieldPresenceEnvelope](docs/ACFieldPresenceEnvelope.md)
 - [ACFieldsActions](docs/ACFieldsActions.md)
 - [ACManifestProperties](docs/ACManifestProperties.md)
 - [ACManifestPropertiesEnvelope](docs/ACManifestPropertiesEnvelope.md)
 - [ACManifestVersions](docs/ACManifestVersions.md)
 - [ACManifestVersionsEnvelope](docs/ACManifestVersionsEnvelope.md)
 - [ACMessage](docs/ACMessage.md)
 - [ACMessageAction](docs/ACMessageAction.md)
 - [ACMessageID](docs/ACMessageID.md)
 - [ACMessageIDEnvelope](docs/ACMessageIDEnvelope.md)
 - [ACMessageIn](docs/ACMessageIn.md)
 - [ACMessageOut](docs/ACMessageOut.md)
 - [ACNonEmptyString](docs/ACNonEmptyString.md)
 - [ACNormalizedAction](docs/ACNormalizedAction.md)
 - [ACNormalizedActionsEnvelope](docs/ACNormalizedActionsEnvelope.md)
 - [ACNormalizedMessage](docs/ACNormalizedMessage.md)
 - [ACNormalizedMessagesEnvelope](docs/ACNormalizedMessagesEnvelope.md)
 - [ACOutputRule](docs/ACOutputRule.md)
 - [ACPresenceEnvelope](docs/ACPresenceEnvelope.md)
 - [ACPresenceModel](docs/ACPresenceModel.md)
 - [ACPropertiesEnvelope](docs/ACPropertiesEnvelope.md)
 - [ACRefreshTokenResponse](docs/ACRefreshTokenResponse.md)
 - [ACRegisterMessage](docs/ACRegisterMessage.md)
 - [ACRuleArray](docs/ACRuleArray.md)
 - [ACRuleCreationInfo](docs/ACRuleCreationInfo.md)
 - [ACRuleEnvelope](docs/ACRuleEnvelope.md)
 - [ACRuleError](docs/ACRuleError.md)
 - [ACRuleUpdateInfo](docs/ACRuleUpdateInfo.md)
 - [ACRuleWarningOutput](docs/ACRuleWarningOutput.md)
 - [ACRulesEnvelope](docs/ACRulesEnvelope.md)
 - [ACSnapshotResponse](docs/ACSnapshotResponse.md)
 - [ACSnapshotResponses](docs/ACSnapshotResponses.md)
 - [ACSnapshotsResponseEnvelope](docs/ACSnapshotsResponseEnvelope.md)
 - [ACTag](docs/ACTag.md)
 - [ACTagArray](docs/ACTagArray.md)
 - [ACTagsEnvelope](docs/ACTagsEnvelope.md)
 - [ACToken](docs/ACToken.md)
 - [ACTokenInfo](docs/ACTokenInfo.md)
 - [ACTokenInfoSuccessResponse](docs/ACTokenInfoSuccessResponse.md)
 - [ACTokenRequest](docs/ACTokenRequest.md)
 - [ACTokenResponse](docs/ACTokenResponse.md)
 - [ACUnregisterDeviceResponse](docs/ACUnregisterDeviceResponse.md)
 - [ACUnregisterDeviceResponseEnvelope](docs/ACUnregisterDeviceResponseEnvelope.md)
 - [ACUser](docs/ACUser.md)
 - [ACUserEnvelope](docs/ACUserEnvelope.md)
 - [ACWebSocketError](docs/ACWebSocketError.md)


## Documentation For Authorization


## artikcloud_oauth

- **Type**: OAuth
- **Flow**: implicit
- **Authorization URL**: https://accounts.artik.cloud/authorize
- **Scopes**:
 - **read:artikcloud**: Read from ARTIK Cloud
 - **write:artikcloud**: Write from ARTIK Cloud

Usage
------

Peek into [tests](https://github.com/artikcloud/artikcloud-objc/tree/master/ArtikCloudTests/ArtikCloudClientTests) for examples about how to use the SDK.

In addition, you can look at our tutorial and sample applications. These will give you a good overview of what you can do and how to do it.

More about ARTIK Cloud
---------------------

If you are not familiar with ARTIK Cloud, we have extensive documentation at https://developer.artik.cloud/documentation

The full ARTIK Cloud API specification can be found at https://developer.artik.cloud/documentation/api-reference/

Check out advanced sample applications at https://developer.artik.cloud/documentation/samples/

To create and manage your services and devices on ARTIK Cloud, create an account at https://developer.artik.cloud

Also see the ARTIK Cloud blog for tutorials, updates, and more: http://artik.io/blog/cloud

Licence and Copyright
---------------------

Licensed under the Apache License. See [LICENSE](https://github.com/artikcloud/artikcloud-swift/blob/master/LICENSE).

Copyright (c) 2016 Samsung Electronics Co., Ltd.
