#import "ACOutputRule.h"

@implementation ACOutputRule

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"aid": @"aid", @"createdOn": @"createdOn", @"description": @"_description", @"enabled": @"enabled", @"error": @"error", @"id": @"_id", @"index": @"index", @"invalidatedOn": @"invalidatedOn", @"languageVersion": @"languageVersion", @"modifiedOn": @"modifiedOn", @"name": @"name", @"rule": @"rule", @"uid": @"uid", @"warning": @"warning" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"aid", @"createdOn", @"_description", @"enabled", @"error", @"_id", @"index", @"invalidatedOn", @"languageVersion", @"modifiedOn", @"name", @"rule", @"uid", @"warning"];
  return [optionalProperties containsObject:propertyName];
}

@end
