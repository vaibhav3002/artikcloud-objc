//
//  UsersApiTests.m
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 3/29/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ArtikCloud/ACUsersApi.h>
#import "ArtikCloudTests.h"

@interface UsersApiTests : ArtikCloudTests

@property (nonatomic) ACUsersApi *api;
@property (nonatomic, readonly) NSString *aid;
@property (nonatomic) NSString *userId;

@end

@implementation UsersApiTests
@synthesize aid;

- (NSString *)aid {
    return [self getProperty:@"user1.aid"];
}

- (void)setUp {
    [super setUp];

    [ACConfiguration sharedConfig].accessToken = [self getProperty:@"user1.token"];

    self.api = [[ACUsersApi alloc] init];

    // Get the User ID for the tests
    [self.api getSelfWithCompletionHandler:^(ACUserEnvelope *output, NSError *error) {
        if (!error && output) {
            self.userId = output.data._id;
        } else {
            NSLog(@"Unable to retrieve User ID %@", error);
        }
    }];

    while (!self.userId) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }

    NSLog(@"Retrieved User ID: %@", self.userId);
}

- (void)tearDown {

    [super tearDown];
}

- (void)testGetSelf {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testGetSelf"];

    [self.api getSelfWithCompletionHandler:^(ACUserEnvelope *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Retrieving User Details %@", error);
        }

        if (!output) {
            XCTFail(@"User Envelope was nil");
        }

        XCTAssertNotNil(output);

        XCTAssertNotNil(output.data._id);
        self.userId = output.data._id;

        //XCTAssertTrue([output.data.name isEqualToString:[self getProperty:@"user1.name"]], @"Names are not equal %@, %@", output.data.name, [self getProperty:@"user1.name"]);
        XCTAssertTrue([output.data.fullName isEqualToString:[self getProperty:@"user1.fullname"]], @"Full Names are not equal %@, %@", output.data.fullName, [self getProperty:@"user1.fullname"]);
        XCTAssertTrue([output.data.email isEqualToString:[self getProperty:@"user1.email"]], @"Emails are not equal %@, %@", output.data.email, [self getProperty:@"user1.email"]);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


- (void)testGetUserDevices {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testGetUserDevices"];

    [self.api getUserDevicesWithUserId:self.userId offset:Nil count:Nil includeProperties:[NSNumber numberWithBool:TRUE] completionHandler:^(ACDevicesEnvelope *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Retrieving User Devices %@", error);
        }

        if (!output) {
            XCTFail(@"User Devices Envelope was nil");
        }

        XCTAssertNotNil(output.data.devices);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testGetUserDeviceTypes {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testGetUserDeviceTypes"];

    [self.api getUserDeviceTypesWithUserId:self.userId offset:Nil count:Nil includeShared:[NSNumber numberWithBool:FALSE] completionHandler:^(ACDeviceTypesEnvelope *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Retrieving User Device Types %@", error);
        }

        if (!output) {
            XCTFail(@"User Device Types Envelope was nil");
        }

        XCTAssertNotNil(output.data.deviceTypes);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testGetUserProperties {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testGetUserProperties"];

    [self.api getUserPropertiesWithUserId:self.userId aid:self.aid completionHandler:^(ACPropertiesEnvelope *output, NSError *error) {
        if (error) {
            // 404 ?
            // No Properties, Create New

            ACAppProperties *newProps = [[ACAppProperties alloc] init];
            newProps.properties = @"myKey=myValue";

            [self.api createUserPropertiesWithUserId:self.userId properties:newProps aid:self.aid completionHandler:^(ACPropertiesEnvelope *output2, NSError *error2) {
                if (error2) {
                    XCTFail(@"Error Creating User Properties %@", error2);
                }

                if (!output2) {
                    XCTFail(@"Created User Properties Envelope was nil");
                }

                XCTAssertTrue([output2.data.properties isEqualToString:newProps.properties], @"Properties are not equal %@, %@", output2.data.properties, newProps.properties);
                [expectation fulfill];
            }];
        }

        if (output) {
            // Try deleting the Properties
            [self.api deleteUserPropertiesWithUserId:self.userId aid:self.aid completionHandler:^(ACPropertiesEnvelope *output3, NSError *error3) {
                if (error3) {
                    XCTFail(@"Error Deleting User Properties %@", error3);
                }

                if (!output3) {
                    XCTFail(@"Deleted User Properties Envelope was nil");
                }
                [expectation fulfill];
            }];
        }
    }];

    [self waitForExpectationsWithTimeout:60.0 handler:nil];
}


@end
