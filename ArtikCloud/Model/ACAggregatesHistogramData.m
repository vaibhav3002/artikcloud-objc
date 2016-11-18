#import "ACAggregatesHistogramData.h"

@implementation ACAggregatesHistogramData

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"count": @"count", @"max": @"max", @"mean": @"mean", @"min": @"min", @"sum": @"sum", @"ts": @"ts", @"variance": @"variance" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"count", @"max", @"mean", @"min", @"sum", @"ts", @"variance"];
  return [optionalProperties containsObject:propertyName];
}

@end
