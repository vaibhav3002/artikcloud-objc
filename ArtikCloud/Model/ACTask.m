#import "ACTask.h"

@implementation ACTask

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"filter": @"filter", @"taskType": @"taskType", @"modifiedOn": @"modifiedOn", @"dtid": @"dtid", @"statusCounts": @"statusCounts", @"property": @"_property", @"id": @"_id", @"dids": @"dids", @"taskParameters": @"taskParameters", @"createdOn": @"createdOn", @"status": @"status" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"filter", @"taskType", @"modifiedOn", @"dtid", @"statusCounts", @"_property", @"_id", @"dids", @"taskParameters", @"createdOn", @"status"];
  return [optionalProperties containsObject:propertyName];
}

@end
