#import "ACRuleError.h"

@implementation ACRuleError

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"errorCode": @"errorCode", @"fieldPath": @"fieldPath", @"messageArgs": @"messageArgs", @"messageKey": @"messageKey" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"errorCode", @"fieldPath", @"messageArgs", @"messageKey"];
  return [optionalProperties containsObject:propertyName];
}

@end
