#import "ACExportResponse.h"

@implementation ACExportResponse

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"csvHeaders": @"csvHeaders", @"endDate": @"endDate", @"exportId": @"exportId", @"format": @"format", @"order": @"order", @"sdids": @"sdids", @"sdtids": @"sdtids", @"startDate": @"startDate", @"trialId": @"trialId", @"uids": @"uids", @"url": @"url" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"csvHeaders", @"endDate", @"exportId", @"format", @"order", @"sdids", @"sdtids", @"startDate", @"trialId", @"uids", @"url"];
  return [optionalProperties containsObject:propertyName];
}

@end
