#ifndef COM_GSRPC_TRACE_TRACER_GS
#define COM_GSRPC_TRACE_TRACER_GS
#import <com/gsrpc/stream.h>

#import <com/gsrpc/channel.h>

#import <com/gsrpc/gsrpc.gs.h>




@class EvtRPC;


@interface EvtRPC : NSObject

@property UInt64 Trace;

@property UInt32 ID;

@property UInt32 Prev;

@property(nonatomic, strong) NSString* Probe;

@property(nonatomic, strong) GSTime* StartTime;

@property(nonatomic, strong) GSTime* EndTime;

@property(nonatomic, strong) NSMutableArray * Attributes;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end


#endif //COM_GSRPC_TRACE_TRACER_GS
