//
//  net.h
//  test
//
//  Created by liyang on 15/6/23.
//  Copyright (c) 2015年 github.com/gsdocker/gs2objc. All rights reserved.
//

#ifndef COM_GSRPC_GSDOCKER_OBJC_NET_H
#define COM_GSRPC_GSDOCKER_OBJC_NET_H

@class GSRequest;
@class GSResponse;

@class GSFuture;

@protocol GSChannel <NSObject>

@required
- (GSFuture *)Send:(GSRequest *)call;

@end

@protocol GSDispatcher <NSObject>
- (GSResponse *)Dispatch:(GSRequest *)call;
@end

#endif
