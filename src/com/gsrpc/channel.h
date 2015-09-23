//
//  net.h
//  test
//
//  Created by liyang on 15/6/23.
//  Copyright (c) 2015年 github.com/gsdocker/gs2objc. All rights reserved.
//

#ifndef COM_GSRPC_GSDOCKER_OBJC_NET_H
#define COM_GSRPC_GSDOCKER_OBJC_NET_H

#import <Foundation/Foundation.h>
#import <com/gsrpc/future.h>

@class GSRequest;
@class GSResponse;



@protocol GSCallback <NSObject>

-(void) callback:(GSResponse*) response withErr:(NSError*) err;

@end


@protocol GSChannel <NSObject>

@required
- (void)Send:(GSRequest *)call withCallback:(id<GSCallback>) callback;
@end


@protocol GSDispatcher <NSObject>

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


id<GSPromise> GSCreatePromise(id<GSChannel> channel,GSRequest* request,GSResolver resolver);

#endif
