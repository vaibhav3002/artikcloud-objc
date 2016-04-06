#import "ACDeviceType.h"

@implementation ACDeviceType

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"uniqueName": @"uniqueName", @"latestVersion": @"latestVersion", @"lastUpdated": @"lastUpdated", @"name": @"name", @"description": @"_description", @"uid": @"uid", @"oid": @"oid", @"hasCloudConnector": @"hasCloudConnector", @"approved": @"approved", @"published": @"published", @"protected": @"protected", @"inStore": @"inStore", @"ownedByCurrentUser": @"ownedByCurrentUser", @"tags": @"tags", @"rsp": @"rsp", @"issuerDn": @"issuerDn", @"vid": @"vid" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"uniqueName", @"latestVersion", @"lastUpdated", @"name", @"_description", @"uid", @"oid", @"hasCloudConnector", @"approved", @"published", @"protected", @"inStore", @"ownedByCurrentUser", @"tags", @"rsp", @"issuerDn", @"vid"];

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
