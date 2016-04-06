ARTIK Cloud Objective-C SDK
==========================

This SDK helps you connect your iOS or OS X applications to ARTIK Cloud. It exposes a number of methods to easily execute REST API calls to ARTIK Cloud.

## Requirements

The API client library requires ARC (Automatic Reference Counting) to be enabled in your Xcode project.

## Installation

To install it, put the API client library in your project and then simply add the following line to your Podfile:

```ruby
pod "ArtikCloud", :path => "/path/to/lib"
```

## Coding Recommendation

It's recommended to create an instance of ApiClient per thread in a multithreaded environment to avoid any potential issue.

More about ARTIK Cloud
---------------------

If you are not familiar with ARTIK Cloud, we have extensive documentation at https://developer.artik.cloud/documentation

The full ARTIK Cloud API specification can be found at https://developer.artik.cloud/documentation/api-spec

Check out advanced sample applications at https://developer.artik.cloud/documentation/samples/

To create and manage your services and devices on ARTIK Cloud, create an account at https://developer.artik.cloud

Also see the ARTIK Cloud blog for tutorials, updates, and more: http://artik.io/blog

Licence and Copyright
---------------------

Licensed under the Apache License. See [LICENCE](https://github.com/artikcloud/artikcloud-objc/blob/master/LICENSE).

Copyright (c) 2016 Samsung Electronics Co., Ltd.
