#import "ACActionOut.h"

@implementation ACActionOut

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"mid": @"mid", @"uid": @"uid", @"sdtid": @"sdtid", @"cts": @"cts", @"mv": @"mv" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"mid", @"uid", @"sdtid", @"cts", @"mv"];
  return [optionalProperties containsObject:propertyName];
}

@end
