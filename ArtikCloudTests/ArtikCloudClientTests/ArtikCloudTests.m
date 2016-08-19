//
//  ArtikCloudTests.m
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 8/19/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArtikCloudTests.h"

@implementation ArtikCloudTests : XCTestCase

- (void)setUp {
    [super setUp];
    
    // Load all the properties
    NSError *error = nil;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *propertiesPath = [bundle pathForResource:
                           @"artik" ofType:@"properties"];
    NSLog(@"Path %@", propertiesPath);
    
    NSString *propertyFileContent = [[NSString alloc] initWithContentsOfFile:propertiesPath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error reading artik.properties %@", error);
        return;
    }
    
    NSArray *properties = [propertyFileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if (properties.count == 0) return;
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:properties.count];
    for (NSString *propertySting in properties) {
        NSArray *property = [propertySting componentsSeparatedByString:@"="];
        
        if (property.count != 2) continue;
        
        [result setObject:property[1] forKey:property[0]];
    }
    
    self.properties = result;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProperty {
    NSString * userId = [self.properties objectForKey:@"user1.id"];
    XCTAssertTrue([userId isEqualToString:@"04ddbd35d57d4d7b8f07f219c44457b2"]);
}


@end
