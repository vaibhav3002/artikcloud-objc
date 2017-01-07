#import "ACTaskStatusCounts.h"

@implementation ACTaskStatusCounts

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"numFailed": @"numFailed", @"numCancelled": @"numCancelled", @"totalDevices": @"totalDevices", @"numCompleted": @"numCompleted", @"numSucceeded": @"numSucceeded" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"numFailed", @"numCancelled", @"totalDevices", @"numCompleted", @"numSucceeded"];
  return [optionalProperties containsObject:propertyName];
}

@end
