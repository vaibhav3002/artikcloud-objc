#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>


//
//  ACWebSocket.h
//  Pods
//
//  Created by Maneesh Sahu-SSI on 3/29/16.
//
//

#ifndef ACWebSocket_h
#define ACWebSocket_h

typedef NS_ENUM(NSInteger, ACConnectionStatus) {
    AC_CONNECTING   = 0,
    AC_CONNECTED    = 1,
    AC_CLOSING      = 2,
    AC_CLOSED       = 3
};

#pragma mark - ACWebSocketDelegate

@protocol ACWebSocketDelegate <NSObject>

- (void) didOpen: (int) httpStatus withMessage: (NSString *) httpStatusMessage;

- (void) didClose: (int) code withReason: (NSString *) reason remote: (BOOL) remote;

@end
#pragma mark - ACWebSocket

@interface ACWebSocket : NSObject <SRWebSocketDelegate>

@property (nonatomic, weak) id <ACWebSocketDelegate> delegate;

@property (nonatomic, readonly) ACConnectionStatus connectionStatus;

- (instancetype)initWithPath:(NSString *) path;

/*
// Delegate queue will be dispatch_main_queue by default.
// You cannot set both OperationQueue and dispatch_queue.
- (void)setDelegateOperationQueue:(NSOperationQueue*) queue;
- (void)setDelegateDispatchQueue:(dispatch_queue_t) queue;

// By default, it will schedule itself on +[NSRunLoop SR_networkRunLoop] using defaultModes.
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;
- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;
 
 */

// ACWebSockets are intended for one-time-use only. Connect should be called once and only once.
- (void)connect;
- (void)close;
- (void)closeWithCode: (NSInteger)code reason: (NSString *)reason;
- (void)sendObject: (NSObject *) object;

@end

#endif /* ACWebSocket_h */
