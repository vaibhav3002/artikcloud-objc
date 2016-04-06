//
//  ACWebSocket.m
//  Pods
//
//  Created by Maneesh Sahu-SSI on 3/29/16.
//
//

#import <Foundation/Foundation.h>
#import "ACWebSocket.h"

@interface ACWebSocket () <SRWebSocketDelegate>
@property (nonatomic, readwrite) ACConnectionStatus connectionStatus;
@end

@implementation ACWebSocket {
    SRWebSocket* _webSocket;
}

#pragma mark - WebSocket Implementation

- (instancetype) initWithPath:(NSString *)path {
    self = [super init];
    if (self) {
        NSURL* url = [[[NSURL alloc] initWithString:@"wss://api.artik.cloud/v1.1"] URLByAppendingPathComponent:path];
        _webSocket = [[SRWebSocket alloc] initWithURL:url];
        _webSocket.delegate = self;
    }
    return self;
}

- (void)connect {
    self.connectionStatus = AC_CONNECTING;
}

- (void)close {
    self.connectionStatus = AC_CLOSING;
}

- (void)closeWithCode:(NSInteger)code reason:(NSString *)reason {
    
    self.connectionStatus = AC_CLOSING;
}

- (void)sendObject:(NSObject *)object {
    
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    self.connectionStatus = AC_CONNECTED;
    //self.delegate didOpen:webSocket. withMessage:<#(NSString *)#>
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    self.connectionStatus = AC_CLOSED;
    [self.delegate didClose:(int)code withReason:reason remote:wasClean];
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    self.connectionStatus = AC_CLOSED;
    
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"Received Message %@", message);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    // NO-OP
}


@end
