#import "ACTokenInfo.h"

@implementation ACTokenInfo

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"client_id": @"clientId", @"device_id": @"deviceId", @"expires_in": @"expiresIn", @"user_id": @"userId" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"clientId", @"deviceId", @"expiresIn", @"userId"];
  return [optionalProperties containsObject:propertyName];
}

@end
