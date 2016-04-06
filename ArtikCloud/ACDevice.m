#import "ACDevice.h"

@implementation ACDevice

- (instancetype)init {
  self = [super init];

  if (self) {
    // initalise property's default value, if any
    
  }

  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"uid": @"uid", @"dtid": @"dtid", @"name": @"name", @"manifestVersion": @"manifestVersion", @"manifestVersionPolicy": @"manifestVersionPolicy", @"needProviderAuth": @"needProviderAuth", @"properties": @"properties", @"createdOn": @"createdOn", @"connected": @"connected", @"certificateInfo": @"certificateInfo", @"certificateSignature": @"certificateSignature", @"eid": @"eid", @"providerCredentials": @"providerCredentials" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"uid", @"dtid", @"name", @"manifestVersion", @"manifestVersionPolicy", @"needProviderAuth", @"properties", @"createdOn", @"connected", @"certificateInfo", @"certificateSignature", @"eid", @"providerCredentials"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

/**
 * Gets the string presentation of the object.
 * This method will be called when logging model object using `NSLog`.
 */
- (NSString *)description {
    return [[self toDictionary] description];
}

@end
