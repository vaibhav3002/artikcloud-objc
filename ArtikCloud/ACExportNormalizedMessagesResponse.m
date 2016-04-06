#import "ACExportNormalizedMessagesResponse.h"

@implementation ACExportNormalizedMessagesResponse

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"csvHeaders": @"csvHeaders", @"endDate": @"endDate", @"exportId": @"exportId", @"format": @"format", @"order": @"order", @"sdid": @"sdid", @"sdids": @"sdids", @"startDate": @"startDate", @"stdids": @"stdids", @"trialId": @"trialId", @"uid": @"uid", @"uids": @"uids", @"url": @"url" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"csvHeaders", @"endDate", @"exportId", @"format", @"order", @"sdid", @"sdids", @"startDate", @"stdids", @"trialId", @"uid", @"uids", @"url"];

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
