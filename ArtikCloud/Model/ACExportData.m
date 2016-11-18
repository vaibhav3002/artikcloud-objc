#import "ACExportData.h"

@implementation ACExportData

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"expirationDate": @"expirationDate", @"exportId": @"exportId", @"fileSize": @"fileSize", @"md5": @"md5", @"request": @"request", @"status": @"status", @"totalMessages": @"totalMessages" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"expirationDate", @"exportId", @"fileSize", @"md5", @"request", @"status", @"totalMessages"];
  return [optionalProperties containsObject:propertyName];
}

@end
