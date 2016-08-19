//
//  TokensApiTests.m
//  ArtikCloudClient
//
//  Created by Maneesh Sahu-SSI on 3/30/16.
//  Copyright © 2016 Samsung Strategy and Innovation Center. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ArtikCloud/ACTokensApi.h>
#import "ArtikCloudTests.h"

@interface TokensApiTests : ArtikCloudTests
@property (nonatomic) ACApiClient *apiClient;
@property (nonatomic) ACTokensApi *api;
@property (nonatomic, readonly) NSString *accessToken;
@property (nonatomic, readonly) NSString *refreshToken;
@end

@implementation TokensApiTests
@synthesize accessToken, refreshToken;

- (NSString *)accessToken {
    return [self getProperty:@"user1.token"] ;
}

- (NSString *)refreshToken {
    return @"bb90333aee114b3e97284814d978080d";
}

- (void)setUp {
    [super setUp];

    [ACConfiguration sharedConfig].accessToken = self.accessToken;

    self.api = [[ACTokensApi alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCheckToken {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCheckToken"];

    ACTokenRequest *tokenIn = [[ACTokenRequest alloc] init];
    tokenIn.token = self.accessToken;

    [self.api checkTokenWithTokenInfo:tokenIn completionHandler:^(ACCheckTokenResponse *output, NSError *error) {
        if (error) {
            XCTFail(@"Error Checking Token %@", error);
        }

        if (!output) {
            XCTFail(@"Check Token Response  was nil");
        }

        XCTAssertEqualObjects(@"Valid token", output.data.message);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testRefreshToken {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testRefreshToken"];

    [self.api refreshTokenWithGrantType:@"refresh_token" refreshToken:self.refreshToken completionHandler:^(ACRefreshTokenResponse *output, NSError *error) {

        if (error) {
            XCTFail(@"Error Refreshing Token %@", error);
        }

        if (!output) {
            XCTFail(@"Refresh Token Response  was nil");
        }

        XCTAssertNotNil(output.refreshToken, @"refresh token must not be nil");

        [expectation fulfill];

    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}
@end
