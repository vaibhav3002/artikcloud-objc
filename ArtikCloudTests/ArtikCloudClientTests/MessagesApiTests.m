//
//  MessagesApiTests.m
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 3/30/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ArtikCloud/ACMessagesApi.h>
#import "ArtikCloudTests.h"

@interface MessagesApiTests : ArtikCloudTests
@property (nonatomic) ACMessagesApi *api;
@property (nonatomic, readonly) NSString *sdid;
@property (nonatomic, readonly) NSString *ddid;
@property (nonatomic, readonly) NSString *deviceToken;
@property (nonatomic, readonly) NSString *deviceToken2;
@end

@implementation MessagesApiTests
@synthesize sdid, ddid, deviceToken, deviceToken2;

- (NSString *)sdid {
    return [self getProperty:@"device1.id"];
}

- (NSString *)ddid {
    return [self getProperty:@"device4.id"];
}

- (NSString *)deviceToken {
    return [self getProperty:@"device1.token"];
}

- (NSString *)deviceToken2 {
    return [self getProperty:@"device4.token"];
}

- (void)setUp {
    [super setUp];

    [ACConfiguration sharedConfig].accessToken = self.deviceToken;
    self.api = [[ACMessagesApi alloc] init];
}

- (void)tearDown {

    [super tearDown];
}

- (void)testSendMessage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSendMessage"];

    ACMessage *message = [[ACMessage alloc] init];
    message.sdid = self.sdid;
    message.ts = [[NSNumber alloc] initWithLong:[[NSDate date] timeIntervalSince1970] * 1000 ];
    message.data = @{ @"steps": @500 };

    [self.api sendMessageWithData:message completionHandler:^(ACMessageIDEnvelope *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Sending Message %@", error);
        }

        if (!output) {
            XCTFail(@"MessageID Envelope was nil");
        }

        NSString *messageId = output.data.mid;
        XCTAssertNotNil(messageId, @"Message ID should not be null");

        // Sleep for 2 seconds, to get the normalized message
        [NSThread sleepForTimeInterval:2.0f];

        [self.api getNormalizedMessagesWithUid:nil sdid:Nil mid:messageId fieldPresence:nil filter:nil offset:nil count:nil startDate:nil endDate:nil order:nil completionHandler:^(ACNormalizedMessagesEnvelope *output2, NSError *error2) {

            if (error2) {
                XCTFail(@"Error Retrieving Normalized Message %@", error2);
            }

            if (!output2) {
                XCTFail(@"NormalizedMessages Envelope was nil");
            }

            XCTAssertTrue((output2.size.intValue == 1), @"Size should be 1");

            ACNormalizedMessage *normalized = [output2.data objectAtIndex:0];
            XCTAssertEqualObjects(normalized.mid, messageId);

            NSObject *steps = [normalized.data objectForKey:@"steps"];
            XCTAssertNotNil(steps, @"Steps should not be null");

            XCTAssertEqualObjects(steps, [NSNumber numberWithFloat:500.0]);

            [expectation fulfill];
        }];
    }];


    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testSendAction {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSendAction"];
    
    [ACConfiguration sharedConfig].accessToken = self.deviceToken2;

    
    ACAction *action = [[ACAction alloc] init];
    action.name = @"setVolume";
    action.parameters = @{ @"volume": @5 };
    
    ACActionArray *actionArray = [[ACActionArray alloc] init];
    actionArray.actions = (NSArray<ACAction>*) @[ action ];
    
    ACActions *actions = [[ACActions alloc] init];
    actions.ddid = self.ddid;
    actions.ts = [[NSNumber alloc] initWithLong:[[NSDate date] timeIntervalSince1970] * 1000 ];
    actions.type = @"action";
    actions.data = actionArray;
    
    [self.api sendActionsWithData:actions completionHandler:^(ACMessageIDEnvelope *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Sending Actions %@", error);
        }
        
        if (!output) {
            XCTFail(@"MessageID Envelope was nil");
        }
        
        NSString *messageId = output.data.mid;
        XCTAssertNotNil(messageId, @"Message ID should not be null");
        
        // Sleep for 2 seconds, to get the normalized message
        [NSThread sleepForTimeInterval:2.0f];
        
        [expectation fulfill];
    }];
    
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


@end
