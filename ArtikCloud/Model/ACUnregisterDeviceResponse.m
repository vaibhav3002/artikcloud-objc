#import "ACUnregisterDeviceResponse.h"

@implementation ACUnregisterDeviceResponse

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"certificateInfo": @"certificateInfo", @"certificateSignature": @"certificateSignature", @"createdOn": @"createdOn", @"dtid": @"dtid", @"eid": @"eid", @"id": @"_id", @"manifestVersion": @"manifestVersion", @"manifestVersionPolicy": @"manifestVersionPolicy", @"name": @"name", @"needProviderAuth": @"needProviderAuth", @"uid": @"uid" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"certificateInfo", @"certificateSignature", @"createdOn", @"dtid", @"eid", @"_id", @"manifestVersion", @"manifestVersionPolicy", @"name", @"needProviderAuth", @"uid"];
  return [optionalProperties containsObject:propertyName];
}

@end
