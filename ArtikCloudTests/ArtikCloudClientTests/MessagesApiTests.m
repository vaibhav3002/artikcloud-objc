//
//  MessagesApiTests.m
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 3/30/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ArtikCloud/ACMessagesApi.h>

@interface MessagesApiTests : XCTestCase
@property (nonatomic) ACApiClient *apiClient;
@property (nonatomic) ACMessagesApi *api;
@property (nonatomic, readonly) NSString *sdid;
@property (nonatomic, readonly) NSString *deviceToken;
@end

@implementation MessagesApiTests
@synthesize sdid, deviceToken;

- (NSString *)sdid {
    return @"993925c3cd994bf7a51c620884be65e9";
}

- (NSString *)deviceToken {
    return @"1eef3e3251e147d1ac707a57f6779c49";
}

- (void)setUp {
    [super setUp];
    
    //self.apiClient = [[ACApiClient alloc] init];
    self.apiClient = [[ACApiClient alloc] init];
    
    self.api = [[ACMessagesApi alloc] initWithApiClient:self.apiClient];
    [self.api addHeader:[@"Bearer " stringByAppendingString:self.deviceToken]  forKey:@"Authorization"];
}

- (void)tearDown {

    [super tearDown];
}

- (void)testSendMessage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSendMessage"];
    
    ACMessageAction *message = [[ACMessageAction alloc] init];
    message.sdid = self.sdid;
    message.type = @"message";
    message.ts = [[NSNumber alloc] initWithLong:[[NSDate date] timeIntervalSince1970] * 1000 ];
    message.data = @{ @"volume": @5 };
    
    [self.api sendMessageActionWithData:message completionHandler:^(ACMessageIDEnvelope *output, NSError *error) {
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
            
            NSObject *volume = [normalized.data objectForKey:@"volume"];
            XCTAssertNotNil(volume, @"Volume should not be null");
            
            XCTAssertEqualObjects(volume, [NSNumber numberWithFloat:5.0]);
            
            [expectation fulfill];
        }];
    }];
    
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
    
}


@end
