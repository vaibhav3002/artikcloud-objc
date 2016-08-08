#import "ACRefreshTokenResponse.h"

@implementation ACRefreshTokenResponse

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"access_token": @"accessToken", @"expires_in": @"expiresIn", @"refresh_token": @"refreshToken", @"token_type": @"tokenType" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"accessToken", @"expiresIn", @"refreshToken", @"tokenType"];
  return [optionalProperties containsObject:propertyName];
}

@end
