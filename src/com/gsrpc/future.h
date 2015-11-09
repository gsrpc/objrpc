//
//  future.h
//
//
//  Created by liyang on 15/6/23.
//  Copyright (c) 2015年. All rights reserved.
//
#ifndef COM_GSRPC_FUTURE_H
#define COM_GSRPC_FUTURE_H

#import <Foundation/Foundation.h>

@class GSRequest;
// pre declare interface GSResponse
@class GSResponse;

typedef void (^GSErrorHandler)(NSError *error);


// Async protocol
@protocol GSAsync <NSObject>

-(void) async:(void(^)()) block;

@end


// GSPromise the gsrpc async promise
@protocol GSPromise <GSAsync,NSObject>

// register async call success callback
-(id<GSPromise>) then:(id) block;

-(id<GSAsync>) catch:(GSErrorHandler) block;

@end

typedef id<GSPromise> (^GSResolver)(GSResponse* response,id block,NSError **error);


#endif