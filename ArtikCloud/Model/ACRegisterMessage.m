#import "ACRegisterMessage.h"

@implementation ACRegisterMessage

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    self.type = @"register";
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"cid": @"cid", @"authorization": @"authorization", @"sdid": @"sdid", @"ts": @"ts", @"type": @"type" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"cid", @"authorization", @"sdid", @"ts", @"type"];
  return [optionalProperties containsObject:propertyName];
}

@end
